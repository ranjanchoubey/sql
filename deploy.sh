#!/bin/bash

echo "🚀 Deploying to GitHub Pages..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf docs/
rm -rf _build/

# Build the book
echo "📖 Building Jupyter Book..."
jupyter-book build .

# Move _build/html contents to docs/
echo "📁 Moving files to docs/ folder..."
mv _build/html docs

# Create .nojekyll file to prevent GitHub from processing with Jekyll
echo "🔧 Creating .nojekyll file..."
touch docs/.nojekyll

# Add CNAME file if you have a custom domain (optional)
# echo "yourdomain.com" > docs/CNAME

echo "✅ Build complete! Files ready for GitHub Pages in docs/ folder"

if [ ! -z "$CODESPACE_NAME" ]; then
    echo "🌐 Preview: https://$CODESPACE_NAME-5500.app.github.dev/docs/"
else
    echo "📍 Local preview: file://$(pwd)/docs/index.html"
fi

echo ""
echo "📋 Next steps:"
echo "1. git add -f docs/  # Force add docs folder"
echo "2. git commit -m 'Deploy to GitHub Pages'"
echo "3. git push origin master"
echo "4. Enable GitHub Pages in repository settings"
