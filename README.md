# PSRL Documentation

[![Documentation Status](https://readthedocs.org/projects/psrl/badge/?version=latest)](https://psrl.readthedocs.io/en/latest/?badge=latest)

This repository hosts the **PSRL** documentation, built with [Sphinx](https://www.sphinx-doc.org/) and published on [Read the Docs](https://readthedocs.org/).

PSRL is a reinforcement learning (RL) framework for efficient large language model (LLM) post-training. The source code lives in a separate repository: <https://github.com/lhy101/psrl>.

---

## Repository layout

```
psrl_doc/
├── .readthedocs.yaml      # Read the Docs build configuration
├── .gitignore
├── README.md              # This file
└── docs/
    ├── conf.py            # Sphinx configuration
    ├── Makefile           # `make html`, `make livehtml`, `make clean`
    ├── requirements.txt   # Sphinx + theme + extensions
    ├── index.md           # Documentation landing page
    ├── README.md          # Author/maintainer build guide (excluded from build)
    ├── _static/           # Custom CSS/JS and figures (SVG, MP4)
    ├── _templates/        # Sphinx HTML template overrides (optional)
    ├── overview/          # Project overview
    ├── tutorial/          # Installation, quickstart, configuration
    ├── design/            # Architecture and design deep dives
    └── examples/          # End-to-end recipes (RLVR, agentic RL, GRM)
```

---

## Build locally

```bash
# 1. Install documentation dependencies
python -m pip install -r docs/requirements.txt

# 2. Build the HTML site
cd docs
make html

# 3. Preview in a browser
python -m http.server -d _build/html 8000
# then open http://localhost:8000
```

For an auto-reloading dev server (requires `sphinx-autobuild`):

```bash
cd docs
make livehtml
```

See `docs/README.md` for a full author guide covering page authoring, Mermaid diagrams, Sphinx-Design cards/tabs, and figure updates.

---

## Publish on Read the Docs

1. Push this repository to GitHub (or GitLab / Bitbucket).
2. Sign in to <https://readthedocs.org/> and click **Import a Project**.
3. Select this repository — Read the Docs will auto-detect `.readthedocs.yaml`.
4. The first build typically takes 2–3 minutes; the site will be served at
   `https://<your-project-slug>.readthedocs.io/en/latest/`.

To enable preview builds on pull requests, turn on **Build pull requests for this project** in the Read the Docs admin.

---

## License

See the upstream code repository for licensing of the PSRL framework itself. This documentation repository is intended to be released under the same license as the source project.
