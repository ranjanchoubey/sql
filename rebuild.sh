#!/bin/bash

# Rebuild the Jupyter Book after making changes

echo "🔄 Rebuilding SQL Learning Notes..."
echo "================================="

# Clean build first (optional, but ensures fresh build)
echo "🧹 Cleaning previous build..."
jupyter-book clean .

# Build the book
echo "📚 Building Jupyter Book..."
jupyter-book build .

# Check if build was successful
if [ -f "_build/html/index.html" ]; then
    echo ""
    echo "✅ Rebuild complete!"
    echo ""
    
    # Check if we're in a codespace
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo "📍 View your updated book at:"
        echo "   https://$CODESPACE_NAME-5500.app.github.dev/_build/html/index.html"
        echo ""
        echo "💡 If using Live Server, refresh your browser to see changes"
    else
        echo "📍 View your updated book at:"
        echo "   file://$(pwd)/_build/html/index.html"
        echo "   or http://localhost:8000/ (if server is running)"
    fi
    
    echo ""
    echo "🚀 Ready to commit and push to deploy to:"
    echo "   https://sql.ranjanchoubey.com/"
    
else
    echo "❌ Error: Jupyter Book rebuild failed"
    exit 1
fi
