#!/bin/bash

echo "🚀 Building Jupyter Book for GitHub Pages..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf docs/
rm -rf _build/

# Build the book
echo "📖 Building Jupyter Book..."
jupyter-book build .

echo "✅ Build complete!"

if [ ! -z "$CODESPACE_NAME" ]; then
    echo "🌐 Preview: https://$CODESPACE_NAME-5500.app.github.dev/_build/html/"
else
    echo "📍 Local preview: file://$(pwd)/_build/html/index.html"
fi

echo ""
echo "📋 For GitHub Pages deployment:"
echo "1. Push your changes: git add . && git commit -m 'Update content' && git push origin master"
echo "2. GitHub Actions will automatically build and deploy"
echo "3. Visit Settings → Pages and select 'GitHub Actions' as source"
echo ""
echo "🌐 Your site will be available at: https://ranjanchoubey.github.io/sql-notes/"
else
    echo "📍 Local preview: file://$(pwd)/docs/index.html"
fi

echo ""
echo "📋 Next steps:"
echo "1. git add -f docs/  # Force add docs folder"
echo "2. git commit -m 'Deploy to GitHub Pages'"
echo "3. git push origin master"
echo "4. Enable GitHub Pages in repository settings"
