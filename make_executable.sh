#!/bin/bash

# Make all scripts executable
echo "Making scripts executable..."

chmod +x setup.sh
chmod +x serve.sh
chmod +x rebuild.sh

echo "✅ All scripts are now executable!"
echo ""
echo "Available commands:"
echo "  ./setup.sh    - Complete setup and build"
echo "  ./rebuild.sh  - Rebuild after changes"
echo "  ./serve.sh    - Start local server"
