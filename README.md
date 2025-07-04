# SQL Learning Notes

A comprehensive Jupyter Book for learning SQL with hands-on examples using SQLite.

## 📚 Table of Contents

This interactive learning journey is organized into three progressive chapters:

### [Chapter 1: SQL Basics](chapters/chapter1.ipynb)
- Database Setup and Connection
- Creating Tables and Data Types
- Inserting Data
- Basic SELECT Queries
- Filtering with WHERE
- Sorting Data with ORDER BY

### [Chapter 2: Intermediate SQL](chapters/chapter2.ipynb)
- GROUP BY and Aggregate Functions
- INNER JOINs - Combining Tables
- LEFT and RIGHT JOINs
- Advanced Filtering with HAVING
- Multiple Table Operations
- Practical Data Analysis Examples

### [Chapter 3: Advanced SQL](chapters/chapter3.ipynb)
- Subqueries and Correlated Queries
- Common Table Expressions (CTEs)
- Window Functions in Detail
- Advanced Data Manipulation
- Query Optimization Techniques
- Real-world Analysis Scenarios

## 🚀 Quick Start

Choose your preferred learning environment:

### Option 1: GitHub Codespaces (Recommended)
1. Open this repository in GitHub Codespaces
2. Run the setup script:
   ```bash
   chmod +x setup.sh && ./setup.sh
   ```
3. Start with [Chapter 1: SQL Basics](chapters/chapter1.ipynb)

### Option 2: Local Development
1. Clone the repository:
   ```bash
   git clone https://github.com/ranjanchoubey/sql-notes.git
   cd sql-notes
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Start Jupyter:
   ```bash
   jupyter notebook
   ```

## 🎯 Learning Path

**For Beginners**: Start with Chapter 1 and work through each concept systematically.

**For Intermediate Users**: Jump to Chapter 2 if you're familiar with basic SQL syntax.

**For Advanced Practice**: Go directly to Chapter 3 for complex queries and optimization techniques.

## 📊 Database Schema

All chapters use a consistent sample database with realistic company data:

```sql
-- Departments table
departments (dept_id, dept_name, location)

-- Employees table  
employees (emp_id, first_name, last_name, email, hire_date, salary, dept_id)

-- Projects table
projects (project_id, project_name, start_date, end_date, budget, dept_id)

-- Performance data (Chapter 3)
employee_performance (emp_id, year, performance_score, bonus)
```

## 🛠️ Interactive Features

- **Live SQL Execution**: Run queries directly in the browser
- **Sample Data**: Pre-populated realistic dataset
- **Practice Exercises**: Hands-on challenges with solutions
- **Progressive Difficulty**: Each chapter builds on the previous
- **Visual Results**: Query outputs displayed as formatted tables

## 📖 How to Use This Book

1. **Read the explanations** for each SQL concept
2. **Run the example code** to see results
3. **Experiment** by modifying queries
4. **Complete practice exercises** to test your understanding
5. **Check your solutions** against provided examples

## 🎓 What You'll Learn

By the end of this course, you'll be able to:

- Set up and connect to SQL databases
- Write complex queries with multiple joins
- Perform data analysis using aggregate functions
- Optimize query performance
- Handle real-world business scenarios
- Build executive dashboards and reports

## 🤝 Contributing

We welcome contributions! You can:
- Add more examples or exercises
- Improve explanations
- Fix any issues
- Suggest new topics

## 🆘 Getting Help

- **Stuck on a concept?** Check the practice exercises for similar examples
- **Technical issues?** Create an issue on GitHub
- **Want to discuss?** Start a discussion in the repository

## 📄 License

This project is open source and available under the MIT License.

---

**Ready to start learning?** Begin with [Chapter 1: SQL Basics](chapters/chapter1.ipynb) 🚀