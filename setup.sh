#!/bin/bash

# SQL Learning Notes - GitHub Codespace Setup Script
# This script sets up the complete environment for the Jupyter Book

echo "🚀 Setting up SQL Learning Notes Jupyter Book..."

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Install required Python packages
echo "📦 Installing Python dependencies..."
pip install --upgrade pip
pip install jupyter-book pandas sqlite3 ipython watchdog

# Create necessary directories
echo "📁 Creating build directories..."
mkdir -p _build/html

# Build the Jupyter Book
echo "🔨 Building Jupyter Book..."
jupyter-book build . --all

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Jupyter Book built successfully!"
    
    # Show the file location
    echo "📍 Your book is available at:"
    echo "   Local file: $(pwd)/_build/html/README.html"
    
    # If in codespace, show codespace URL pattern
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo "   Codespace URL: https://$CODESPACE_NAME-5500.app.github.dev/_build/html/README.html"
        echo ""
        echo "🌐 To serve the book locally:"
        echo "   1. Right-click on '_build/html/README.html' in VS Code"
        echo "   2. Select 'Open with Live Server'"
        echo "   3. Or run: ./serve.sh"
    fi
    
    echo ""
    echo "🎉 Setup complete! Your SQL Learning environment is ready."
    echo ""
    echo "Quick commands:"
    echo "  ./setup.sh    - Run this setup (current script)"
    echo "  ./serve.sh    - Start local server"
    echo "  ./rebuild.sh  - Rebuild book after changes"
    
else
    echo "❌ Error: Jupyter Book build failed"
    exit 1
fi
