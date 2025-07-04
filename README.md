# SQL Learning Notes

A comprehensive Jupyter Book for learning SQL with hands-on examples using SQLite.

## 🌐 Live Book
📖 **[View the Live Book](https://yourusername.github.io/sql-notes/)**

## 🚀 Quick Start (GitHub Codespaces)

### Automated Setup
For the fastest setup in GitHub Codespaces, run:

```bash
# Make scripts executable
chmod +x setup.sh serve.sh rebuild.sh deploy.sh

# Run the complete setup
./setup.sh
```

This will automatically:
- ✅ Install all required Python packages
- ✅ Build the Jupyter Book
- ✅ Display your codespace access URL
- ✅ Set up development scripts

### Access Your Book
After running setup, your book will be available at:
- **Live Server**: `https://your-codespace-name-5500.app.github.dev/_build/html/index.html`
- **Python Server**: Run `./serve.sh` for `https://your-codespace-name-8000.app.github.dev/`

### Development Workflow
```bash
# After making changes to the notebook
./rebuild.sh

# Deploy to GitHub Pages
./deploy.sh

# Start local server (alternative to Live Server)
./serve.sh

# Watch for changes and auto-rebuild
watchmedo shell-command --patterns="*.ipynb;*.md" --recursive --command='./rebuild.sh' .
```

## 📚 Deployment

### Manual Deployment
```bash
# Build and deploy to GitHub Pages
./deploy.sh

# Commit and push
git add .
git commit -m "Deploy to GitHub Pages"
git push origin main
```

### Automatic Deployment
The repository includes GitHub Actions for automatic deployment on every push to main branch.

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

| Script | Purpose |
|--------|---------|
| `./setup.sh` | Complete environment setup (run once) |
| `./rebuild.sh` | Rebuild book after making changes |
| `./serve.sh` | Start local development server |

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