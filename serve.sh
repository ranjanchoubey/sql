#!/bin/bash

# Serve the Jupyter Book locally

echo "🌐 Starting local server for SQL Learning Notes..."

# Check if book is built
if [ ! -d "_build/html" ]; then
    echo "📚 Book not found. Building first..."
    ./setup.sh
fi

# Change to build directory and start server
cd _build/html

echo "🚀 Server starting on port 8000..."
echo "📍 Access your book at:"

if [ ! -z "$CODESPACE_NAME" ]; then
    echo "   Codespace: https://$CODESPACE_NAME-8000.app.github.dev/"
else
    echo "   Local: http://localhost:8000/"
fi

echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Start Python server
python -m http.server 8000
