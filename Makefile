.PHONY: assets assets-check

PYTHON ?= python3

assets:
	$(PYTHON) scripts/assets/kenney_import.py

assets-check:
	$(PYTHON) scripts/assets/check_assets.py
