#!/bin/bash

# Quick rebuild script for development

echo "🔄 Rebuilding Jupyter Book..."

# Force rebuild all pages
jupyter-book build . --all

if [ $? -eq 0 ]; then
    echo "✅ Rebuild complete!"
    
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo "🌐 Your book: https://$CODESPACE_NAME-5500.app.github.dev/_build/html/README.html"
    else
        echo "📍 Local file: $(pwd)/_build/html/README.html"
    fi
else
    echo "❌ Rebuild failed"
    exit 1
fi
