DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  salary DECIMAL(10, 2),
  department_id INT,
  hire_date DATE
);

CREATE TABLE departments(
id SERIAL PRIMARY KEY,
name VARCHAR(255)
);

INSERT INTO departments(name) VALUES('Engineering');
INSERT INTO departments(name) VALUES('Sales');
INSERT INTO departments(name) VALUES('Marketing');
INSERT INTO departments(name) VALUES('HR');

INSERT INTO employees(name, salary, department_id, hire_date) VALUES('Alice', 60000.00, 1, '2020-01-01');
INSERT INTO employees(name, salary, department_id, hire_date) VALUES('Bob', 70000.00, 1, '2020-01-05');
INSERT INTO employees(name, salary, department_id, hire_date) VALUES('Charlie', 80000.00, 2, '2020-02-01');
INSERT INTO employees(name, salary, department_id, hire_date) VALUES('Dave', 90000.00, 3, '2020-02-15');
INSERT INTO employees(name, salary, department_id, hire_date) VALUES('Eve', 100000.00, 4, '2020-03-01');


SELECT d.name AS department, e.name AS employee_name, e.salary
FROM (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
) AS max_salaries
INNER JOIN employees AS e ON e.department_id = max_salaries.department_id AND e.salary = max_salaries.max_salary
INNER JOIN departments AS d ON e.department_id = d.id;


WITH OldestInEachDepartment AS (
    SELECT
        d.name AS department,
        e.name AS employee_name,
        e.hire_date,
        ROW_NUMBER() OVER (PARTITION BY e.department_id ORDER BY e.hire_date) AS row_num
    FROM
        employees e
    JOIN
        departments d ON e.department_id = d.id
)
SELECT department, employee_name, hire_date FROM OldestInEachDepartment WHERE row_num = 1;

SELECT e.name AS employee_name, e.salary FROM employees e
JOIN
    (
        SELECT
           department_id,
           AVG(salary) AS avg_salary
        FROM
            employees
        GROUP BY
          department_id
    ) AS avg_salaries ON e.department_id = avg_salaries.department_id
WHERE
    e.salary > avg_salaries.avg_salary;

