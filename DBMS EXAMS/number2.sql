DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
id INT PRIMARY KEY,
Name VARCHAR(255),
age INT,
Address VARCHAR(255)

);
INSERT INTO employees (id, Name, Age, Address)
VALUES
(1001, 'Rohan', 26, 'Delhi'),
(1002, 'Ankit', 30, 'Gurgaon'),
(1003, 'Gaurav', 27, 'Mumbai'),
(1004, 'Raja', 32, 'Nagpur');

SELECT * FROM employees;

SELECT * FROM employees WHERE id = 1004;
SELECT *
FROM employees
WHERE name ILIKE 'R%';

SELECT 
id,
age,
name
FROM
employees
ORDER BY
age DESC;

SELECT DISTINCT 
address
FROM
employees;

