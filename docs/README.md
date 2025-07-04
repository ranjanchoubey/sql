# Docs Folder

This folder will contain the built Jupyter Book HTML files after GitHub Actions runs.

The deployment workflow will:
1. Build the Jupyter Book (`jupyter-book build .`)
2. Copy `_build/html/` contents to this `docs/` folder
3. GitHub Pages will serve from this folder

**Note**: This folder gets automatically updated by GitHub Actions on every push to main branch.
