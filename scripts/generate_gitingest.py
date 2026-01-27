#!/usr/bin/env python3
"""
Generate gitingest.md and gitingest_details.md — token-budget friendly repo snapshots
for LLM/context ingestion.
"""

from __future__ import annotations

import argparse
import os
import subprocess
from datetime import datetime
from pathlib import Path
from typing import Iterable, Set


# -----------------------------
# Configuration (repo-specific)
# -----------------------------

# Directory names to prune anywhere in the tree.
EXCLUDED_DIRS = {
    ".git",
    ".build",
    ".gradle",
    ".idea",
    ".vscode",
    ".dart_tool",
    ".kotlin",
    ".mypy_cache",
    ".pytest_cache",
    ".ruff_cache",
    ".swiftpm",
    ".venv",
    "__pycache__",
    "DerivedData",
    "Pods",
    "Carthage",
    "node_modules",
    "build",
    "build_result",
    "dist",
    "coverage",
    "ModuleCache",
    "index",
    "xcuserdata",
}

# File suffixes (including multi-part suffixes) to exclude from tree + inlining.
EXCLUDED_FILE_EXTENSIONS = {
    ".a",
    ".aar",
    ".apk",
    ".app",
    ".bin",
    ".class",
    ".db",
    ".dex",
    ".dSYM",
    ".framework",
    ".gif",
    ".hprof",
    ".ico",
    ".jar",
    ".jpeg",
    ".jpg",
    ".klib",
    ".len",
    ".lock",
    ".map",
    ".o",
    ".onnx",
    ".parquet",
    ".pbxuser",
    ".pkl",
    ".plistc",
    ".png",
    ".pcm",
    ".pt",
    ".pth",
    ".pyc",
    ".pyo",
    ".so",
    ".swiftdeps",
    ".swiftmodule",
    ".tar.gz",
    ".timestamp",
    ".xcarchive",
    ".xcuserstate",
    ".zip",
}

# Never inline these (even if they are "text").
DO_NOT_INLINE_BASENAMES = {
    "QuestionBank.json",
    "local.properties",
}

# Never include these in the curated "important files" section.
SENSITIVE_BASENAMES = {
    ".env",
    ".env.local",
    "local.properties",
    "google-services.json",
    "GoogleService-Info.plist",
}

IMPORTANT_DIRS = [
    "shared/src/commonMain/kotlin/",
    "shared/src/commonMain/resources/",
    "androidApp/src/main/java/",
    "androidApp/src/main/res/",
    "iosApp/iprep/",
    "iosApp/iprepTests/",
    "iosApp/iprepUITests/",
    "docs/",
]

# Curated “important files” to inline in the slim doc (subject to size + text checks).
IMPORTANT_FILES = [
    "docs/ARCHITECTURE.md",
    "CURSOR_SETUP.md",
    "settings.gradle.kts",
    "build.gradle.kts",
    "shared/build.gradle.kts",
    "androidApp/build.gradle.kts",
    "gradle.properties",
    "gradle/wrapper/gradle-wrapper.properties",
    "iosApp/build.sh",
    "iosApp/build_kmm.sh",
    "iosApp/xcode_build_phase.sh",
    "androidApp/src/main/AndroidManifest.xml",
    "iosApp/iprep/Info.plist",
    "iosApp/iprep/Resources/RemoteConfigDefaults.plist",
]

# Key data files (listed with size; not inlined by default).
KEY_DATA_FILES = [
    "shared/src/commonMain/resources/QuestionBank.json",
    "iosApp/iprep/Resources/QuestionBank.json",
]

DETAIL_DEFAULT_INCLUDE_DIRS = [
    "shared/src/",
    "androidApp/src/main/",
    "iosApp/iprep/",
    "iosApp/iprepTests/",
    "iosApp/iprepUITests/",
    "docs/",
]

DETAIL_DEFAULT_INCLUDE_EXTENSIONS = {
    ".kt",
    ".kts",
    ".swift",
    ".md",
    ".txt",
    ".json",
    ".xml",
    ".yml",
    ".yaml",
    ".properties",
    ".plist",
    ".xcconfig",
    ".sh",
}


def get_git_info() -> tuple[str, str]:
    """Get current git branch and commit hash (short)."""
    try:
        branch = (
            subprocess.check_output(
                ["git", "rev-parse", "--abbrev-ref", "HEAD"],
                stderr=subprocess.DEVNULL,
            )
            .decode()
            .strip()
        )
        commit = (
            subprocess.check_output(
                ["git", "rev-parse", "--short", "HEAD"], stderr=subprocess.DEVNULL
            )
            .decode()
            .strip()
        )
        return branch, commit
    except (subprocess.CalledProcessError, FileNotFoundError):
        return "unknown", "unknown"


def should_exclude_path(path: Path, repo_root: Path) -> bool:
    """Check if a path should be excluded."""
    try:
        rel_path = path.relative_to(repo_root)
    except ValueError:
        return True

    parts = rel_path.parts
    if any(part in EXCLUDED_DIRS for part in parts):
        return True

    # Skip curated sensitive files anywhere.
    if path.is_file() and path.name in SENSITIVE_BASENAMES:
        return True

    # Extension / suffix filtering (supports multi-part suffixes via endswith).
    if path.is_file():
        s = str(path).lower()
        for ext in EXCLUDED_FILE_EXTENSIONS:
            if s.endswith(ext.lower()):
                return True

    return False


def build_tree(
    root: Path,
    repo_root: Path,
    depth: int,
    max_depth: int,
    tree_files_mode: str,  # "none" | "some" | "all"
    tree_max_files_per_dir: int,
) -> list[str]:
    """Build a directory tree structure (pruned), capped by depth."""
    lines: list[str] = []
    indent = "  " * depth

    try:
        items = sorted(
            [p for p in root.iterdir() if not should_exclude_path(p, repo_root)],
            key=lambda p: (p.is_file(), p.name.lower()),
        )
    except (PermissionError, FileNotFoundError):
        return lines

    dirs = [p for p in items if p.is_dir()]
    files = [p for p in items if p.is_file()]

    for d in dirs:
        rel_path = d.relative_to(repo_root)
        path_str = str(rel_path).replace("\\", "/")
        lines.append(f"{indent}- {path_str}/")

        if depth < max_depth:
            lines.extend(
                build_tree(
                    d,
                    repo_root,
                    depth + 1,
                    max_depth,
                    tree_files_mode,
                    tree_max_files_per_dir,
                )
            )

    if tree_files_mode != "none":
        to_list = files
        if tree_files_mode == "some":
            to_list = files[: max(0, tree_max_files_per_dir)]
        for f in to_list:
            rel_path = f.relative_to(repo_root)
            path_str = str(rel_path).replace("\\", "/")
            lines.append(f"{indent}- {path_str}")

        if tree_files_mode == "some" and len(files) > len(to_list):
            lines.append(f"{indent}- … ({len(files) - len(to_list)} more files)")

    return lines


def get_repo_tree(
    repo_root: Path,
    max_depth: int,
    tree_files_mode: str,
    tree_max_files_per_dir: int,
) -> str:
    """Generate repository tree structure (pruned) with a depth cap."""
    root_name = repo_root.name if repo_root.name else "."
    tree_lines = [f"- {root_name}/"]
    tree_lines.extend(
        build_tree(
            repo_root,
            repo_root,
            depth=1,
            max_depth=max_depth,
            tree_files_mode=tree_files_mode,
            tree_max_files_per_dir=tree_max_files_per_dir,
        )
    )
    return "\n".join(tree_lines)


def read_file_content(file_path: Path) -> str:
    """Read file content with safe decoding."""
    try:
        with open(file_path, "r", encoding="utf-8", errors="replace") as f:
            return f.read()
    except Exception as e:
        return f"# Error reading file: {e}"


def is_probably_text_file(file_path: Path, probe_bytes: int = 8192) -> bool:
    """
    Heuristic to avoid inlining binary/unreadable files.
    - Reject if NUL bytes are present in a small prefix.
    - Reject if strict UTF-8 decode fails on that prefix.
    """
    try:
        with open(file_path, "rb") as f:
            chunk = f.read(probe_bytes)
        if b"\x00" in chunk:
            return False
        try:
            chunk.decode("utf-8", errors="strict")
        except UnicodeDecodeError:
            return False
        return True
    except Exception:
        return False


def looks_minified_text(text: str) -> bool:
    """Best-effort detection of minified bundles (very long lines / low newline density)."""
    if not text:
        return False
    max_line_len = max((len(line) for line in text.splitlines()), default=0)
    if max_line_len >= 2000:
        return True
    if len(text) >= 100_000:
        newline_ratio = text.count("\n") / max(1, len(text))
        if newline_ratio < 0.0005:
            return True
    return False


def iter_detail_candidate_files(
    repo_root: Path, include_dirs: Iterable[str], include_exts: Set[str]
) -> list[Path]:
    """Return repo-relative, filtered candidate files under include_dirs."""
    candidates: list[Path] = []
    for dir_str in include_dirs:
        dir_path = (repo_root / dir_str).resolve()
        if not dir_path.exists() or not dir_path.is_dir():
            continue

        for root, dirnames, filenames in os.walk(dir_path):
            root_path = Path(root)

            # Prune excluded dirs early.
            dirnames[:] = [
                d for d in dirnames if not should_exclude_path(root_path / d, repo_root)
            ]

            for name in filenames:
                p = root_path / name
                if should_exclude_path(p, repo_root):
                    continue
                if include_exts and p.suffix.lower() not in include_exts:
                    continue
                candidates.append(p)

    # Stable ordering: prioritize core source areas then smaller files.
    def sort_key(p: Path) -> tuple[int, int, int, str]:
        rel = str(p.relative_to(repo_root)).replace("\\", "/")
        in_shared = 0 if rel.startswith("shared/") else 1
        in_android = 0 if rel.startswith("androidApp/") else 1
        in_ios = 0 if rel.startswith("iosApp/") else 1
        try:
            size = p.stat().st_size
        except Exception:
            size = 10**9
        return (in_shared, in_android, in_ios, size, rel.lower())

    candidates.sort(key=sort_key)
    return candidates


def generate_gitingest_details(
    repo_root: Path,
    output_path: Path,
    include_dirs: Iterable[str],
    include_exts: Set[str],
    max_bytes: int,
    max_files: int,
    inline_mode: str,  # "none" | "curated" | "all"
) -> None:
    """Generate a more granular, text-only companion document for deeper LLM context."""
    print(f"Generating gitingest_details.md from {repo_root}...")

    branch, commit = get_git_info()
    timestamp = datetime.now().astimezone().isoformat(timespec="seconds")

    candidates = iter_detail_candidate_files(repo_root, include_dirs, include_exts)

    included_manifest: list[tuple[str, int]] = []
    inlined: list[str] = []
    inlined_files = 0
    skipped: list[tuple[str, str]] = []

    def should_inline(rel_path: str, suffix: str, basename: str) -> bool:
        if basename in DO_NOT_INLINE_BASENAMES:
            return False
        if inline_mode == "none":
            return False
        if inline_mode == "all":
            return True
        # curated
        if rel_path.startswith("shared/src/") and suffix in {".kt", ".kts", ".md"}:
            return True
        if rel_path.startswith("androidApp/src/") and suffix in {".kt", ".kts", ".xml", ".md"}:
            return True
        if rel_path.startswith("iosApp/iprep/") and suffix in {".swift", ".md", ".plist"}:
            return True
        if rel_path.startswith("docs/") and suffix == ".md":
            return True
        return False

    for p in candidates:
        rel = str(p.relative_to(repo_root)).replace("\\", "/")
        basename = p.name
        suffix = p.suffix.lower()

        try:
            size = p.stat().st_size
        except Exception:
            skipped.append((rel, "stat_failed"))
            continue

        if size > max_bytes:
            skipped.append((rel, f"too_large>{max_bytes}B"))
            continue
        if not p.is_file():
            skipped.append((rel, "not_a_file"))
            continue
        if not is_probably_text_file(p):
            skipped.append((rel, "binary_or_non_utf8"))
            continue

        included_manifest.append((rel, size))

        if should_inline(rel, suffix, basename):
            if inlined_files >= max_files:
                skipped.append((rel, f"inline_cap_reached>{max_files}"))
                continue

            text = read_file_content(p)
            if suffix in {".js", ".ts"} and looks_minified_text(text):
                skipped.append((rel, "minified_bundle"))
                continue
            if basename in DO_NOT_INLINE_BASENAMES:
                skipped.append((rel, "do_not_inline"))
                continue

            inlined_files += 1
            inlined.extend(
                [
                    "---",
                    f"### `{rel}`",
                    f"- Size: `{size}` bytes",
                    "```",
                    text,
                    "```",
                    "",
                ]
            )

    content_parts = [
        "# AABIP_Qbank — gitingest (details)",
        "",
        f"Generated: `{timestamp}`",
        f"Git: `{branch}` @ `{commit}`",
        "",
        "## What this file is",
        "- A **second** document you can provide to an LLM when more detail is needed.",
        "- Focuses on **text-readable** code/docs and skips binaries, oversized files, and build artifacts.",
        "",
        "## Selection settings",
        f"- Include dirs: `{', '.join(include_dirs)}`",
        f"- Include extensions: `{'`, `'.join(sorted(include_exts))}`",
        f"- Max file size: `{max_bytes}` bytes",
        f"- Inline mode: `{inline_mode}`",
        f"- Inline cap (files): `{max_files}`",
        "",
        "## Manifest (filtered candidates)",
        "",
    ]

    if included_manifest:
        content_parts.append("```")
        for rel, size in included_manifest:
            content_parts.append(f"{size:>9}  {rel}")
        content_parts.append("```")
    else:
        content_parts.append("_No matching text files found under the provided include dirs._")

    content_parts.extend(["", "## Skipped (reason)", ""])
    if skipped:
        content_parts.append("```")
        for rel, reason in skipped[:500]:
            content_parts.append(f"{reason:>22}  {rel}")
        if len(skipped) > 500:
            content_parts.append(f"... and {len(skipped) - 500} more")
        content_parts.append("```")
    else:
        content_parts.append("_Nothing skipped._")

    content_parts.extend(["", "## Inlined file contents", ""])
    if inlined:
        content_parts.extend(inlined)
    else:
        content_parts.append("_Inline mode was `none`, or no files met the inline criteria._")

    print(f"Writing to {output_path}...")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(content_parts))
    print(f"✅ Successfully generated {output_path}")


def _format_size(n: int) -> str:
    """Human-ish size string."""
    units = ["B", "KB", "MB", "GB"]
    size = float(n)
    for u in units:
        if size < 1024 or u == units[-1]:
            return f"{size:.1f}{u}" if u != "B" else f"{int(size)}B"
        size /= 1024
    return f"{n}B"


def generate_gitingest(
    repo_root: Path,
    output_path: Path,
    important_file_max_bytes: int,
    tree_max_depth: int,
    tree_files_mode: str,
    tree_max_files_per_dir: int,
) -> None:
    """Generate the slim curated gitingest.md file."""
    print(f"Generating gitingest.md from {repo_root}...")

    branch, commit = get_git_info()
    timestamp = datetime.now().astimezone().isoformat(timespec="seconds")

    print("Building repository tree...")
    repo_tree = get_repo_tree(
        repo_root,
        max_depth=tree_max_depth,
        tree_files_mode=tree_files_mode,
        tree_max_files_per_dir=tree_max_files_per_dir,
    )

    content_parts = [
        "# AABIP_Qbank — gitingest (curated)",
        "",
        f"Generated: `{timestamp}`",
        f"Git: `{branch}` @ `{commit}`",
        "",
        "## What this file is",
        "- A **token-budget friendly** snapshot of the repo **structure** + a curated set of **important files**.",
        "- Intended for LLM/context ingestion; excludes build artifacts and large binaries.",
        "",
        "## Exclusions (high level)",
        f"- Directories: `{', '.join(sorted(EXCLUDED_DIRS))}`",
        f"- File types: `{'`, `'.join(sorted(EXCLUDED_FILE_EXTENSIONS))}`",
        "",
        "## Repo tree (pruned)",
        "```",
        repo_tree,
        "```",
        "",
        "## Important directories (not inlined)",
    ]

    for dir_name in IMPORTANT_DIRS:
        content_parts.append(f"- `{dir_name}`")

    # Key data files listed with size, not inlined.
    content_parts.extend(["", "## Key data files (not inlined)", ""])
    any_data = False
    for rel in KEY_DATA_FILES:
        p = repo_root / rel
        if p.exists() and p.is_file():
            any_data = True
            try:
                size = p.stat().st_size
                content_parts.append(f"- `{rel}` ({_format_size(size)})")
            except Exception:
                content_parts.append(f"- `{rel}` (size unavailable)")
    if not any_data:
        content_parts.append("_None found (paths may differ in this checkout)._")

    content_parts.extend(["", "## Important files (inlined)", ""])

    print("Inlining important files...")
    missing: list[str] = []
    skipped: list[tuple[str, str]] = []

    for file_path_str in IMPORTANT_FILES:
        file_path = repo_root / file_path_str

        if file_path.name in SENSITIVE_BASENAMES:
            skipped.append((file_path_str, "sensitive"))
            continue

        if not file_path.exists():
            missing.append(file_path_str)
            continue

        try:
            size = file_path.stat().st_size
        except Exception:
            skipped.append((file_path_str, "stat_failed"))
            continue

        if size > important_file_max_bytes:
            skipped.append((file_path_str, f"too_large>{important_file_max_bytes}B"))
            continue
        if not is_probably_text_file(file_path):
            skipped.append((file_path_str, "binary_or_non_utf8"))
            continue
        if file_path.name in DO_NOT_INLINE_BASENAMES:
            skipped.append((file_path_str, "do_not_inline"))
            continue

        print(f"  Reading {file_path_str}...")
        file_content = read_file_content(file_path)
        if file_path.suffix.lower() in {".js", ".ts"} and looks_minified_text(file_content):
            skipped.append((file_path_str, "minified_bundle"))
            continue

        content_parts.extend(
            [
                "---",
                f"### `{file_path_str}`",
                f"- Size: `{size}` bytes",
                "```",
                file_content,
                "```",
                "",
            ]
        )

    if missing:
        content_parts.extend(["", "## Missing curated files", ""])
        content_parts.append("```")
        for p in missing:
            content_parts.append(p)
        content_parts.append("```")

    if skipped:
        content_parts.extend(["", "## Skipped curated files (reason)", ""])
        content_parts.append("```")
        for p, reason in skipped:
            content_parts.append(f"{reason:>22}  {p}")
        content_parts.append("```")

    print(f"Writing to {output_path}...")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(content_parts))

    print(f"✅ Successfully generated {output_path}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate curated gitingest markdown documents for LLM ingestion."
    )
    parser.add_argument(
        "--output",
        default="gitingest.md",
        help="Path (relative to repo root) for the base curated gitingest output.",
    )
    parser.add_argument(
        "--no-base",
        action="store_true",
        help="Skip generating the base gitingest.md file.",
    )
    parser.add_argument(
        "--important-max-bytes",
        type=int,
        default=200_000,
        help="Max size per inlined 'important file' in base doc (bytes).",
    )
    parser.add_argument(
        "--tree-max-depth",
        type=int,
        default=6,
        help="Max depth for the pruned repo tree in the base doc.",
    )
    parser.add_argument(
        "--tree-files",
        choices=["none", "some", "all"],
        default="none",
        help="Whether to include files in the base repo tree (default: directories only).",
    )
    parser.add_argument(
        "--tree-max-files-per-dir",
        type=int,
        default=25,
        help="When --tree-files=some, max files to list per directory.",
    )
    parser.add_argument(
        "--details",
        action="store_true",
        help="Also generate a second, more granular details document.",
    )
    parser.add_argument(
        "--details-output",
        default="gitingest_details.md",
        help="Path (relative to repo root) for the details output.",
    )
    parser.add_argument(
        "--details-include",
        action="append",
        default=[],
        help="Directory (relative to repo root) to include in details scan. Can be repeated.",
    )
    parser.add_argument(
        "--details-max-bytes",
        type=int,
        default=200_000,
        help="Max size per manifested/inlined file in details doc (bytes).",
    )
    parser.add_argument(
        "--details-max-files",
        type=int,
        default=100,
        help="Max number of files to inline into details doc.",
    )
    parser.add_argument(
        "--details-inline",
        choices=["none", "curated", "all"],
        default="curated",
        help="Inline file contents mode for details doc.",
    )
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parent.parent

    if not args.no_base:
        output_path = repo_root / args.output
        generate_gitingest(
            repo_root=repo_root,
            output_path=output_path,
            important_file_max_bytes=args.important_max_bytes,
            tree_max_depth=args.tree_max_depth,
            tree_files_mode=args.tree_files,
            tree_max_files_per_dir=args.tree_max_files_per_dir,
        )

    if args.details:
        include_dirs = args.details_include or DETAIL_DEFAULT_INCLUDE_DIRS
        details_output = repo_root / args.details_output
        generate_gitingest_details(
            repo_root=repo_root,
            output_path=details_output,
            include_dirs=include_dirs,
            include_exts=DETAIL_DEFAULT_INCLUDE_EXTENSIONS,
            max_bytes=args.details_max_bytes,
            max_files=args.details_max_files,
            inline_mode=args.details_inline,
        )


if __name__ == "__main__":
    main()

