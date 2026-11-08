# student-results--MY-sql-project
MySQL project: student results database with joins, grouping and aggregate queries
# Student Results System (MySQL)

A relational database that stores students, departments, courses and exam results, with SQL queries that answer common questions a college would ask.

# Database design
Four related tables:
- `departments`
- `students` (linked to departments)
- `courses` (linked to departments)
- `results` (linked to students and courses)

Design choices:
- Deleting a department keeps its students and courses (`ON DELETE SET NULL`)
- Deleting a student also removes their results (`ON DELETE CASCADE`)
- A `CHECK` rule keeps marks between 0 and 100
- A `UNIQUE` rule stops the same result being entered twice

# Sample data
5 departments, 16 courses, 40 students and 122 results (all names are made up). The data includes a student with no department, a student with no results and a course nobody has taken, so the queries handle missing data properly.

# Queries
1. Every student with their department (`LEFT JOIN`)
2. Each result with student, course, marks and semester (3-table join)
3. Average marks per course (`GROUP BY`)
4. Courses with an average below 50 (`HAVING`)
5. Students per department, including those with none (`LEFT JOIN`, `COALESCE`)

# How to run
1. Open MySQL Workbench (MySQL 8.0+)
2. Run `01_schema.sql`, then `02_sample_data.sql`, then `03_queries.sql`

## Skills used
MySQL, primary and foreign keys, constraints, joins, GROUP BY / HAVING, aggregate functions
