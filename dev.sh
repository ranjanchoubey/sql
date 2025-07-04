#!/bin/bash

# SQL Learning Notes - Development Script
# This script handles all development tasks

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}📘 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Function to show help
show_help() {
    echo "SQL Learning Notes - Development Helper"
    echo ""
    echo "Usage: ./dev.sh [command]"
    echo ""
    echo "Commands:"
    echo "  setup     - Initial setup (install dependencies, first build)"
    echo "  build     - Build the Jupyter Book"
    echo "  serve     - Start local development server"
    echo "  clean     - Clean build artifacts"
    echo "  deploy    - Prepare for GitHub Pages deployment"
    echo "  watch     - Watch for changes and auto-rebuild (requires watchdog)"
    echo "  help      - Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./dev.sh setup    # First time setup"
    echo "  ./dev.sh build    # Rebuild after changes"
    echo "  ./dev.sh serve    # Start local server"
    echo ""
}

# Function for initial setup
setup() {
    print_status "Setting up SQL Learning Notes development environment..."
    
    # Install Python dependencies
    print_status "Installing Python dependencies..."
    pip install -r requirements.txt
    
    # Build the book for the first time
    print_status "Building Jupyter Book for the first time..."
    jupyter-book build . --all
    
    print_success "Setup complete!"
    
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo ""
        print_status "🌐 Codespace URLs:"
        echo "   • Live Server: https://$CODESPACE_NAME-5500.app.github.dev/_build/html/"
        echo "   • Python Server: Run './dev.sh serve' then visit https://$CODESPACE_NAME-8000.app.github.dev/"
    else
        echo ""
        print_status "📍 Local development:"
        echo "   • File: $(pwd)/_build/html/index.html"
        echo "   • Server: Run './dev.sh serve' then visit http://localhost:8000"
    fi
    
    echo ""
    print_status "Next steps:"
    echo "   • Edit notebooks in chapters/ folder"
    echo "   • Run './dev.sh build' after making changes"
    echo "   • Run './dev.sh serve' to start local server"
    echo "   • Push to master branch for automatic deployment"
}

# Function to build the book
build() {
    print_status "Building Jupyter Book..."
    
    # Clean previous build to ensure fresh start
    rm -rf _build/
    
    # Build the book
    jupyter-book build . --all
    
    if [ $? -eq 0 ]; then
        print_success "Build complete!"
        
        if [ ! -z "$CODESPACE_NAME" ]; then
            echo "🌐 Preview: https://$CODESPACE_NAME-5500.app.github.dev/_build/html/"
        else
            echo "📍 Local: file://$(pwd)/_build/html/index.html"
        fi
    else
        print_error "Build failed!"
        exit 1
    fi
}

# Function to serve locally
serve() {
    if [ ! -d "_build/html" ]; then
        print_warning "No build found. Building first..."
        build
    fi
    
    print_status "Starting local development server..."
    print_status "Press Ctrl+C to stop the server"
    
    cd _build/html
    
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo ""
        print_success "🌐 Server running at: https://$CODESPACE_NAME-8000.app.github.dev/"
        python -m http.server 8000 --bind 0.0.0.0
    else
        echo ""
        print_success "🌐 Server running at: http://localhost:8000"
        python -m http.server 8000
    fi
}

# Function to clean build artifacts
clean() {
    print_status "Cleaning build artifacts..."
    rm -rf _build/
    rm -rf .jupyter_cache/
    print_success "Clean complete!"
}

# Function to prepare for deployment
deploy() {
    print_status "Preparing for GitHub Pages deployment..."
    
    # Clean and build
    clean
    build
    
    print_success "Ready for deployment!"
    print_status "Next steps:"
    echo "   1. git add ."
    echo "   2. git commit -m 'Update content'"
    echo "   3. git push origin master"
    echo ""
    print_status "GitHub Actions will automatically deploy to:"
    echo "   🌐 https://ranjanchoubey.github.io/sql-notes/"
}

# Function to watch for changes
watch() {
    if ! command -v watchmedo &> /dev/null; then
        print_warning "watchdog not installed. Installing..."
        pip install watchdog
    fi
    
    print_status "Watching for changes... Press Ctrl+C to stop"
    print_warning "This will rebuild automatically when .ipynb or .md files change"
    
    watchmedo shell-command \
        --patterns="*.ipynb;*.md;*.yml" \
        --recursive \
        --command='./dev.sh build' \
        .
}

# Main script logic
case "${1:-help}" in
    setup)
        setup
        ;;
    build)
        build
        ;;
    serve)
        serve
        ;;
    clean)
        clean
        ;;
    deploy)
        deploy
        ;;
    watch)
        watch
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_help
        exit 1
        ;;
esac
