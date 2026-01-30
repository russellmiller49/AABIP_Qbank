import json
from pathlib import Path


def main() -> None:
    manifest_path = Path("shared/src/commonMain/resources/assets/manifest/assets_manifest.json")
    if not manifest_path.exists():
        raise SystemExit(f"Missing manifest: {manifest_path} (run `make assets` first)")

    data = json.loads(manifest_path.read_text(encoding="utf-8"))
    errors = data.get("errors", [])
    if errors:
        print("Asset import errors:")
        for e in errors:
            print("-", e.get("id"), ":", e.get("error"))
        raise SystemExit(1)
    print("Assets OK")


if __name__ == "__main__":
    main()

