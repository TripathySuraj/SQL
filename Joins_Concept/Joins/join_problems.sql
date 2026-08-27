use company_db;
-- =========================================
-- SQL JOIN & SET OPERATIONS PRACTICE
-- =========================================

-- Q1. Write a SQL query to display EmployeeID, FirstName, LastName,
-- and DepartmentName for employees who belong to a department.
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM employees e INNER JOIN departments d 
ON e.DepartmentID=d.DepartmentID;

-- Q2. Write a SQL query to display EmployeeID, FirstName, and Salary
-- for employees who have a salary record.
SELECT e.EmployeeID, e.FirstName, s.Salary
FROM employees e INNER JOIN salaries s
ON e.EmployeeID=s.EmployeeID;

-- Q3. Write a SQL query to display EmployeeID, FirstName,
-- and DepartmentName for all employees, even if they do not belong to any department.
SELECT e.EmployeeID, e.FirstName, d.DepartmentName
FROM employees e LEFT JOIN departments d 
ON e.DepartmentID=d.DepartmentID;

-- Q4. Write a SQL query to display all departments along with employees
-- working in them. Departments without employees should also appear.
DROP VIEW IF EXISTS v1;
CREATE VIEW v1 AS (
SELECT e.EmployeeID, e.FirstName, d.DepartmentName
FROM employees e RIGHT JOIN departments d
ON e.DepartmentID=d.DepartmentID);

SELECT * FROM v1;

-- Q5. Write a SQL query to display EmployeeID, FirstName,
-- DepartmentName, and Salary for employees who have both
-- department and salary information.
SELECT e.EmployeeID, e.FirstName, d.DepartmentName, s.Salary
FROM employees e 
INNER JOIN departments d
ON e.DepartmentID=d.DepartmentID
INNER JOIN salaries s
ON e.EmployeeID=s.EmployeeID;

-- Q6. Write a SQL query to display all employees and their salary.
-- Employees without salary should also appear.
SELECT e.EmployeeID,e.FirstName,s.Salary
FROM employees e LEFT JOIN salaries s
ON e.EmployeeID=s.EmployeeID;

-- Q7. Write a SQL query to display employees who do not have a salary record.
SELECT e.EmployeeID,e.FirstName,s.Salary
FROM employees e LEFT JOIN salaries s
ON e.EmployeeID=s.EmployeeID
WHERE s.EmployeeID IS NULL;

-- Q8. Write a SQL query to display all departments and employees working in them.
-- Departments with no employees should also be displayed.
SELECT d.DepartmentName, e.EmployeeID, e.FirstName
FROM departments d
LEFT JOIN employees e
ON d.DepartmentID = e.DepartmentID;

-- Q9. Write a SQL query using UNION to combine
-- the FirstName of employees and the DepartmentName from departments.
SELECT FirstName FROM employees
UNION
SELECT DepartmentName FROM departments;

-- Q10. Write a SQL query to find employees who appear
-- in both employees and salaries tables (common EmployeeID).
SELECT e.EmployeeID, e.FirstName
FROM employees e INNER JOIN salaries s
ON e.EmployeeID=s.EmployeeID;

-- Q11. Write a SQL query to generate all possible combinations
-- of employees and departments.
SELECT e.*, d.*
FROM employees e 
CROSS JOIN departments d;

-- Q12. Write a SQL query using SELF JOIN to display pairs of employees
-- who work in the same department.
SELECT e1.FirstName, e2.FirstName, e1.DepartmentID
FROM employees e1
JOIN employees e2
ON e1.DepartmentID=e2.DepartmentID
AND e1.EmployeeID>e2.EmployeeID;   -- to remove repeatations
				    -- Vijay(id-2) and Rohit(id-1) --> selected
                                    -- Vijay(id-2) and Vijay(id-2) --> not selected
                                    -- Rohit(id-1) and Vijay(id-2) --> not selected
                                    -- Rohit(id-1) and Rohit(id-1) --> not selected
