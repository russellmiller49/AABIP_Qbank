import json
import shutil
import zipfile
from pathlib import Path
from typing import Dict, List, Optional

import yaml
from PIL import Image


# ---------------- Utilities ----------------


def norm_slashes(p: str) -> str:
    return p.replace("\\", "/")


def ensure_dir(p: Path) -> None:
    p.mkdir(parents=True, exist_ok=True)


def unzip_all(zips_dir: Path, work_dir: Path) -> List[Path]:
    ensure_dir(work_dir)
    extracted_roots: List[Path] = []
    for z in sorted(zips_dir.glob("*.zip")):
        out = work_dir / z.stem
        if out.exists():
            # allow re-run
            shutil.rmtree(out)
        ensure_dir(out)
        with zipfile.ZipFile(z, "r") as zf:
            zf.extractall(out)
        extracted_roots.append(out)
    return extracted_roots


def collect_files(root: Path) -> List[Path]:
    return [p for p in root.rglob("*") if p.is_file()]


def score_largest_image(p: Path) -> int:
    try:
        with Image.open(p) as im:
            return im.size[0] * im.size[1]
    except Exception:
        return -1


def pick_match(matches: List[Path], pick: str) -> Optional[Path]:
    if not matches:
        return None
    if pick == "first":
        return matches[0]
    if pick == "second":
        return matches[1] if len(matches) > 1 else matches[0]
    if pick == "largest":
        scored = [(score_largest_image(m), m) for m in matches]
        scored.sort(key=lambda x: x[0], reverse=True)
        return scored[0][1]
    return matches[0]


def safe_filename(asset_id: str, ext: str) -> str:
    # ui.hp.fill -> ui_hp_fill.png
    base = asset_id.replace(".", "_").replace("/", "_")
    return f"{base}{ext}"


def safe_basename(asset_id: str) -> str:
    return asset_id.replace(".", "_").replace("/", "_")


def find_by_pattern(all_files: List[Path], pattern: str) -> List[Path]:
    # Convert glob-ish pattern to regex-ish matching on normalized relative path
    # We'll just use fnmatch-style by Path.match on a synthetic relative
    # For simplicity: manual match using fnmatch
    import fnmatch

    hits = []
    pattern_norm = pattern.lower()
    for f in all_files:
        rel = norm_slashes(str(f)).lower()
        if fnmatch.fnmatch(rel, pattern_norm) or fnmatch.fnmatch(f.name.lower(), pattern_norm):
            hits.append(f)
    hits.sort(key=lambda p: norm_slashes(str(p)).lower())
    return hits


def guess_pack_from_filename(zip_stem: str) -> str:
    # Map zip stem to a stable pack key
    # Example: kenney_ui-pack-adventure -> ui-pack-adventure
    return zip_stem.replace("kenney_", "")


def choose_zip_root(extracted_roots: List[Path], hint: str) -> Optional[Path]:
    hint = hint.lower().strip()
    if not hint:
        return None

    best: Optional[Path] = None
    best_score: Optional[tuple] = None

    for r in extracted_roots:
        pack_key = guess_pack_from_filename(r.name).lower()
        name = r.name.lower()
        path = norm_slashes(str(r)).lower()

        if pack_key == hint:
            score = (0, 0, pack_key)
        elif name == hint:
            score = (1, 0, name)
        elif hint in pack_key:
            score = (2, len(pack_key), pack_key)
        elif hint in name:
            score = (3, len(name), name)
        elif hint in path:
            score = (4, len(path), path)
        else:
            continue

        if best_score is None or score < best_score:
            best_score = score
            best = r

    return best


# ---------------- Main ----------------


def main() -> None:
    plan_path = Path("scripts/assets/asset_plan.yml")
    if not plan_path.exists():
        raise SystemExit(f"Missing {plan_path}")

    plan = yaml.safe_load(plan_path.read_text(encoding="utf-8"))

    zips_dir = Path(plan["inputs"]["zips_dir"])
    work_dir = Path(plan["inputs"]["work_dir"])
    out_root = Path(plan["output"]["root"])
    manifest_path = Path(plan["manifest"]["path"])

    if not zips_dir.exists():
        raise SystemExit(f"Missing zips dir: {zips_dir}")

    # Extract all zips
    extracted_roots = unzip_all(zips_dir, work_dir)

    # Index files per pack root
    pack_files: Dict[str, List[Path]] = {}
    for root in extracted_roots:
        pack_key = guess_pack_from_filename(root.name)
        pack_files[pack_key] = collect_files(root)

    imported = []
    errors = []

    for item in plan["assets"]:
        asset_id = item["id"]
        category = item["category"]
        hint = item.get("source_zip_hint", "")
        pattern = item["pattern"]
        pick = item.get("pick", "first")

        # pick pack root by hint
        pack_root = choose_zip_root(extracted_roots, hint) if hint else None
        if not pack_root:
            errors.append({"id": asset_id, "error": f"No extracted pack matches hint '{hint}'"})
            continue

        pack_key = guess_pack_from_filename(pack_root.name)
        files = pack_files.get(pack_key, [])

        matches = find_by_pattern(files, pattern)
        chosen = pick_match(matches, pick)

        if not chosen:
            errors.append({"id": asset_id, "error": f"No match for pattern '{pattern}' in pack '{pack_key}'"})
            continue

        ext = chosen.suffix.lower()
        if ext not in [".png", ".jpg", ".jpeg", ".webp", ".wav", ".mp3", ".ogg"]:
            # allow other extensions but warn
            pass

        out_dir = out_root / category
        ensure_dir(out_dir)

        base = safe_basename(asset_id)
        for existing in out_dir.glob(f"{base}.*"):
            try:
                existing.unlink()
            except Exception:
                pass

        out_file = out_dir / f"{base}{ext}"
        shutil.copy2(chosen, out_file)

        imported.append(
            {
                "id": asset_id,
                "category": category,
                "path": norm_slashes(str(out_file)),
                "source_pack": pack_key,
                "source_file": norm_slashes(str(chosen)),
                "pattern": pattern,
            }
        )

    # Write manifest
    ensure_dir(manifest_path.parent)
    manifest = {
        "version": plan.get("version", 1),
        "root": norm_slashes(str(out_root)),
        "assets": imported,
        "errors": errors,
    }
    manifest_path.write_text(json.dumps(manifest, indent=2), encoding="utf-8")

    print(f"Imported: {len(imported)} assets")
    if errors:
        print(f"Errors: {len(errors)} (see manifest errors)")
        for e in errors[:10]:
            print(" -", e["id"], e["error"])
    print(f"Manifest: {manifest_path}")


if __name__ == "__main__":
    main()
