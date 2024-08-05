
CREATE TABLE IF NOT EXISTS employee_data (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employee_data (first_name, last_name, position, salary, hire_date) VALUES
('Alice', 'Johnson', 'Software Engineer', 80000.00, '2020-01-15'),
('Bob', 'Smith', 'Data Scientist', 95000.00, '2019-06-20'),
('Charlie', 'Brown', 'Product Manager', 105000.00, '2018-07-30'),
('David', 'Williams', 'Data Engineer', 85000.00, '2021-03-10'),
('Eve', 'Davis', 'UX Designer', 75000.00, '2022-11-25');
