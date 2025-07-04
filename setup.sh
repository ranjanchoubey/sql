#!/bin/bash

# SQL Learning Notes - Complete Setup Script
# This script sets up everything needed for the Jupyter Book

echo "🚀 Setting up SQL Learning Notes..."
echo "=================================="

# Install Python dependencies
echo "📦 Installing Python packages..."
pip install -r requirements.txt

# Build the Jupyter Book
echo "📚 Building Jupyter Book..."
jupyter-book build .

# Check if build was successful
if [ -f "_build/html/index.html" ]; then
    echo ""
    echo "🎉 Setup complete! Your SQL Learning Notes are ready!"
    echo ""
    
    # Check if we're in a codespace
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo "📍 Access your book at:"
        echo "   Codespace: https://$CODESPACE_NAME-5500.app.github.dev/_build/html/index.html"
        echo "   Alternative: https://$CODESPACE_NAME-8000.app.github.dev/ (after running ./serve.sh)"
        echo ""
    else
        echo "📍 Access your book at:"
        echo "   Local: file://$(pwd)/_build/html/index.html"
        echo "   Server: http://localhost:8000/ (after running ./serve.sh)"
        echo ""
    fi

    echo "✨ Pro tip: The main entry point is index.html"
    echo ""
    echo "🌐 Once deployed, your book will be available at:"
    echo "   https://sql.ranjanchoubey.com/"
    echo ""
    echo "Quick commands:"
    echo "  ./setup.sh    - Run this setup (current script)"
    echo "  ./serve.sh    - Start local server"
    echo "  ./rebuild.sh  - Rebuild book after changes"
    
else
    echo "❌ Error: Jupyter Book build failed"
    exit 1
fi
    echo "  ./rebuild.sh  - Rebuild book after changes"
    
else
    echo "❌ Error: Jupyter Book build failed"
    exit 1
fi
fi
