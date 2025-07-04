# SQL Learning Chapters

This directory contains the structured chapter system for the SQL Learning Jupyter Book.

## Chapter Structure

### Chapter 1: SQL Fundamentals (`chapter1.ipynb`)
- Database setup and connection
- Creating tables and inserting data
- Basic SELECT queries
- WHERE clause filtering
- ORDER BY sorting
- Foundation exercises

### Chapter 2: Advanced SQL Operations (`chapter2.ipynb`)
- GROUP BY and aggregate functions
- JOIN operations (INNER, LEFT)
- HAVING clause for group filtering
- Subqueries and correlated queries
- Complex multi-table analysis
- Advanced exercises

## Adding New Chapters

### Quick Start
1. Copy `chapter_template.ipynb` to create a new chapter file
2. Rename to `chapterN.ipynb` (where N is the chapter number)
3. Update the content following the template structure
4. Add the new chapter to `_toc.yml` in the root directory

### Template Structure
Each chapter should follow this structure:
```
# Chapter Title
- Learning objectives
- Prerequisites

## Sections
- Concept introduction
- Code examples  
- Practice exercises
- Chapter summary
```

### Best Practices
- **Progressive Difficulty**: Each chapter should build on previous knowledge
- **Hands-on Examples**: Include practical code examples with real data
- **Practice Exercises**: Provide exercises that reinforce learning
- **Clear Explanations**: Explain both the "how" and "why" of concepts
- **Database Continuity**: Use the same sample database across chapters

## Future Chapter Ideas

### Chapter 3: Window Functions and Analytics
- ROW_NUMBER(), RANK(), DENSE_RANK()
- LAG() and LEAD() functions
- Moving averages and cumulative sums
- Partitioning and ordering

### Chapter 4: Advanced Data Analysis
- Common Table Expressions (CTEs)
- Recursive queries
- CASE statements and conditional logic
- Date/time functions and analysis

### Chapter 5: Database Design and Optimization
- Normalization principles
- Index creation and optimization
- Query performance analysis
- Best practices for schema design

### Chapter 6: Real-World Projects
- Data cleaning and preparation
- Business analytics scenarios
- Reporting and dashboard queries
- Integration with Python/pandas

## Building the Book

After adding new chapters:

1. Update `_toc.yml` to include the new chapter:
```yaml
- file: chapters/chapterN
  title: "Chapter N: Your Title"
```

2. Rebuild the Jupyter Book:
```bash
./rebuild.sh
```

3. Serve locally to test:
```bash
./serve.sh
```

## Contributing

When adding new chapters:
- Follow the established naming convention
- Maintain consistent formatting and style
- Include comprehensive examples and exercises
- Test all code before committing
- Update this README with new chapter descriptions

Happy learning! 📚🚀
