CREATE DATABASE IF NOT EXISTS pyspark_db;

-- Создаем таблицу employees
CREATE TABLE IF NOT EXISTS pyspark_db.employees (
    emp_id UInt32,
    first_name String,
    last_name String,
    position String,
    salary Float64,
    hire_date Date
) ENGINE = MergeTree()
ORDER BY emp_id;