# =========================================================================
# psrl_doc top-level Makefile
#
# This repository is documentation-only and is published on Read the Docs.
# The canonical source of most pages lives in the main psrl_agent repo at
# $(PSRL_AGENT)/docs/. Use `make sync` to pull the latest version in.
#
# Files that are intentionally NOT synced (because psrl_doc owns them):
#   - docs/conf.py        : tuned for this standalone repo (no sys.path, no autodoc)
# =========================================================================

PSRL_AGENT ?= /jizhicfs/lhy/psrl_agent
SRC        := $(PSRL_AGENT)/docs/
DST        := docs/

RSYNC_FLAGS := -av --delete --itemize-changes \
               --exclude='conf.py' \
               --exclude='_build/' \
               --exclude='__pycache__/' \
               --exclude='*.pyc'

.PHONY: help sync sync-check html livehtml clean

help:
	@echo "Targets:"
	@echo "  make sync         - rsync docs/ from \$$PSRL_AGENT/docs/ (preserves our conf.py)"
	@echo "  make sync-check   - dry-run, show what 'make sync' would change"
	@echo "  make html         - build the documentation HTML"
	@echo "  make livehtml     - auto-reloading dev server (requires sphinx-autobuild)"
	@echo "  make clean        - remove build artifacts"
	@echo ""
	@echo "Override the source path with: make sync PSRL_AGENT=/some/other/path"

sync-check:
	@echo "[dry-run] rsync $(SRC) -> $(DST)"
	@rsync --dry-run $(RSYNC_FLAGS) $(SRC) $(DST)

sync:
	@test -d "$(SRC)" || { echo "ERROR: $(SRC) not found. Set PSRL_AGENT=/path/to/psrl_agent"; exit 1; }
	@echo "rsync $(SRC) -> $(DST)"
	@rsync $(RSYNC_FLAGS) $(SRC) $(DST)
	@echo ""
	@echo "Done. Review with: git status -- $(DST)"

html:
	$(MAKE) -C docs html

livehtml:
	$(MAKE) -C docs livehtml

clean:
	$(MAKE) -C docs clean
