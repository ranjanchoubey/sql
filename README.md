# SQL Learning Notes

A comprehensive Jupyter Book for learning SQL with hands-on examples using SQLite.
Lets start

## 🌐 Live Book
📖 **[View the Live Book](https://ranjanchoubey.github.io/sql)**

## 🚀 Quick Start (GitHub Codespaces)

### One-Command Setup
For the fastest setup in GitHub Codespaces, run:

```bash
# Make script executable and run setup
chmod +x dev.sh
./dev.sh setup
```

This will automatically:
- ✅ Install all required Python packages
- ✅ Build the Jupyter Book
- ✅ Display your codespace access URLs

### Development Workflow
```bash
# Main development commands
./dev.sh build    # Rebuild after making changes
./dev.sh serve    # Start local development server
./dev.sh clean    # Clean build artifacts
./dev.sh watch    # Auto-rebuild when files change
./dev.sh deploy   # Prepare for GitHub Pages deployment

# Get help
./dev.sh help     # Show all available commands
```

## 📚 Deployment

### Automatic Deployment (Recommended)
The repository uses GitHub Actions for automatic deployment:

1. **Make changes to your notebooks**
2. **Commit and push:**
   ```bash
   git add .
   git commit -m "Update content"
   git push origin master
   ```
3. **GitHub Actions automatically deploys to: `https://ranjanchoubey.github.io/sql-notes/`**

### Manual Development
```bash
# Quick rebuild during development
./dev.sh build

# Start local server for testing
./dev.sh serve

# Watch for changes (auto-rebuild)
./dev.sh watch
```

## What You'll Learn

This interactive notebook covers essential SQL concepts from beginner to intermediate level:

- **Database Setup & Connection** - Setting up SQLite and connecting from Python
- **Table Creation** - Creating structured tables with proper data types
- **Data Insertion** - Adding sample data to work with
- **Basic Queries** - SELECT statements and data retrieval
- **Filtering & Sorting** - WHERE clauses, ORDER BY, and data organization
- **Aggregations** - COUNT, SUM, AVG, and other aggregate functions
- **Joins** - Combining data from multiple tables
- **Advanced Topics** - Subqueries and complex data manipulation

## Manual Setup (Local Development)

### Prerequisites
- Python 3.7+
- Jupyter Notebook or JupyterLab
- Git

### Installation Steps
1. **Clone this repository**
   ```bash
   git clone https://github.com/ranjanchoubey/sql-notes.git
   cd sql-notes
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Build the Jupyter Book**
   ```bash
   jupyter-book build .
   ```

4. **View the book**
   ```bash
   # Option 1: Open in browser
   open _build/html/README.html
   
   # Option 2: Start local server
   cd _build/html && python -m http.server 8000
   # Then visit: http://localhost:8000
   ```


## Features

- **Interactive Examples** - Run SQL queries directly in the notebook
- **Sample Database** - Pre-populated with realistic company data
- **Practice Exercises** - Test your knowledge with hands-on challenges
- **Progressive Learning** - Concepts build upon each other systematically
- **GitHub Codespaces Ready** - One-command setup for cloud development

## Database Schema

The notebook uses a sample company database with three main tables:
- **departments** - Company departments with locations
- **employees** - Employee information including salaries and department assignments  
- **projects** - Project data with budgets and timelines

## Available Scripts

| Command | Purpose |
|---------|---------|
| `./dev.sh setup` | Complete environment setup (run once) |
| `./dev.sh build` | Rebuild book after making changes |
| `./dev.sh serve` | Start local development server |
| `./dev.sh clean` | Clean build artifacts |
| `./dev.sh deploy` | Prepare for GitHub Pages deployment |
| `./dev.sh watch` | Watch for changes and auto-rebuild |
| `./dev.sh help` | Show all available commands |

## Troubleshooting

### Common Issues

**Build fails with missing packages:**
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

**Permission denied on scripts:**
```bash
chmod +x setup.sh serve.sh rebuild.sh
```

**Database connection issues:**
- The `my_database.db` file should be in the root directory
- Make sure you're running the notebook from the project root

**Codespace URL not working:**
- Make sure your codespace is running
- Try refreshing the page
- Check if port forwarding is enabled in VS Code

### Force Rebuild
If you need to completely rebuild everything:
```bash
# Clean build directory
rm -rf _build/

# Full rebuild
jupyter-book build . --all
```

## Contributing

Feel free to contribute by:
- Adding more SQL examples
- Improving explanations
- Fixing any issues you find
- Suggesting new topics to cover

### Development Setup
1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test with `./rebuild.sh`
5. Submit a pull request

## License

This project is open source and available under the MIT License.

## Support

- 📖 **Documentation**: Check the notebook cells for detailed explanations
- 🐛 **Issues**: Report bugs via GitHub Issues
- 💡 **Questions**: Start a discussion in GitHub Discussions
- 🚀 **Quick Start**: Just run `./setup.sh` in your codespace!