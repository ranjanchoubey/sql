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
    echo "  start     - Build and serve (recommended for development)"
    echo "  fix       - Fix dependency issues and rebuild"
    echo "  clean     - Clean build artifacts"
    echo "  deploy    - Prepare for GitHub Pages deployment"
    echo "  watch     - Watch for changes and auto-rebuild (requires watchdog)"
    echo "  help      - Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./dev.sh setup    # First time setup"
    echo "  ./dev.sh start    # Build and serve (most common)"
    echo "  ./dev.sh build    # Just rebuild"
    echo "  ./dev.sh fix      # Fix dependency issues"
    echo ""
}

# Function to fix dependency issues
fix_dependencies() {
    print_status "Checking and fixing Python dependencies..."
    
    # Check if we need to fix psutil and pygments issues
    if ! python -c "import psutil; psutil.Process()" 2>/dev/null; then
        print_warning "Fixing psutil installation..."
        pip uninstall -y psutil
        pip install psutil
    fi
    
    if ! python -c "import pygments.util" 2>/dev/null; then
        print_warning "Fixing pygments installation..."
        pip uninstall -y pygments
        pip install pygments
    fi
    
    # Force reinstall problematic packages
    print_status "Ensuring all Jupyter Book dependencies are properly installed..."
    pip install --upgrade --force-reinstall jupyter-book nbclient ipykernel
    
    # Install/upgrade requirements
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt --upgrade
    fi
    
    print_success "Dependencies fixed!"
}

# Function for initial setup
setup() {
    print_status "Setting up SQL Learning Notes development environment..."
    
    # Install Python dependencies
    print_status "Installing Python dependencies..."
    fix_dependencies
    
    # Build the book for the first time
    print_status "Building Jupyter Book for the first time..."
    jupyter-book build . --all
    
    print_success "Setup complete!"
    
    if [ ! -z "$CODESPACE_NAME" ]; then
        echo ""
        print_status "🌐 Access your book:"
        echo "   • Run './dev.sh serve' to start server"
        echo "   • Then visit: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
        echo "   • Direct file: Open _build/html/README.html in browser"
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
    if jupyter-book build . --all; then
        print_success "Build complete!"
        
        if [ ! -z "$CODESPACE_NAME" ]; then
            echo ""
            print_status "🌐 To view your book:"
            echo "   • Run './dev.sh serve' to start server"
            echo "   • Then visit: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
        else
            echo ""
            print_status "📍 To view your book:"
            echo "   • Direct file: file://$(pwd)/_build/html/README.html"
            echo "   • Or run './dev.sh serve' then visit http://localhost:8000/README.html"
        fi
    else
        print_error "Build failed! Trying safe build..."
        safe_build
    fi
}

# Function to safely build with error handling
safe_build() {
    print_status "Building Jupyter Book with error recovery..."
    
    # Clean previous build to ensure fresh start
    rm -rf _build/
    rm -rf .jupyter_cache/
    
    # Try building with different strategies if first attempt fails
    local build_attempts=0
    local max_attempts=3
    
    while [ $build_attempts -lt $max_attempts ]; do
        build_attempts=$((build_attempts + 1))
        print_status "Build attempt $build_attempts of $max_attempts..."
        
        if jupyter-book build . --all; then
            print_success "Build successful!"
            
            if [ ! -z "$CODESPACE_NAME" ]; then
                echo ""
                print_status "🌐 To view your book:"
                echo "   • Run './dev.sh serve' to start server"
                echo "   • Then visit: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
            fi
            return 0
        else
            print_warning "Build attempt $build_attempts failed"
            
            if [ $build_attempts -eq 1 ]; then
                print_status "Attempting to fix dependencies..."
                fix_dependencies
            elif [ $build_attempts -eq 2 ]; then
                print_status "Trying build without executing notebooks..."
                if jupyter-book build . --all --builder html; then
                    print_success "Build successful (without execution)!"
                    
                    if [ ! -z "$CODESPACE_NAME" ]; then
                        echo ""
                        print_status "🌐 To view your book:"
                        echo "   • Run './dev.sh serve' to start server"
                        echo "   • Then visit: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
                    fi
                    return 0
                fi
            fi
        fi
    done
    
    print_error "All build attempts failed!"
    print_status "Possible solutions:"
    echo "   1. Run './dev.sh clean' then './dev.sh setup'"
    echo "   2. Check your notebook cells for errors"
    echo "   3. Try building individual chapters"
    return 1
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
        print_success "🌐 Server running at: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
        python -m http.server 8000 --bind 0.0.0.0
    else
        echo ""
        print_success "🌐 Server running at: http://localhost:8000/README.html"
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

# Function to build and serve in one command
start() {
    print_status "Building and serving Jupyter Book..."
    
    # Clean previous build to ensure fresh start
    rm -rf _build/
    
    # Build the book
    if jupyter-book build . --all; then
        print_success "Build complete! Starting server..."
        
        if [ ! -d "_build/html" ]; then
            print_error "Build directory not found!"
            return 1
        fi
        
        print_status "Starting local development server..."
        print_status "Press Ctrl+C to stop the server"
        
        cd _build/html
        
        if [ ! -z "$CODESPACE_NAME" ]; then
            echo ""
            print_success "🌐 Your book is ready at: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
            echo ""
            print_status "📝 Development workflow:"
            echo "   • Edit your notebooks in chapters/ folder"
            echo "   • Ctrl+C to stop server, then run './dev.sh start' to rebuild and serve"
            echo ""
            python -m http.server 8000 --bind 0.0.0.0
        else
            echo ""
            print_success "🌐 Your book is ready at: http://localhost:8000/README.html"
            echo ""
            print_status "📝 Development workflow:"
            echo "   • Edit your notebooks in chapters/ folder"
            echo "   • Ctrl+C to stop server, then run './dev.sh start' to rebuild and serve"
            echo ""
            python -m http.server 8000
        fi
    else
        print_error "Build failed! Trying safe build..."
        safe_build
        
        # If safe build succeeds, start server
        if [ $? -eq 0 ] && [ -d "_build/html" ]; then
            print_status "Starting server after successful recovery build..."
            cd _build/html
            
            if [ ! -z "$CODESPACE_NAME" ]; then
                echo ""
                print_success "🌐 Your book is ready at: https://$CODESPACE_NAME-8000.app.github.dev/README.html"
                python -m http.server 8000 --bind 0.0.0.0
            else
                echo ""
                print_success "🌐 Your book is ready at: http://localhost:8000/README.html"
                python -m http.server 8000
            fi
        fi
    fi
}

# Main script logic
case "${1:-help}" in
    setup)
        setup
        ;;
    start)
        start
        ;;
    build)
        build
        ;;
    serve)
        serve
        ;;
    fix)
        fix_dependencies
        build
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
