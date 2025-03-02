CREATE DATABASE IF NOT EXISTS hello_db;
USE hello_db;

CREATE TABLE IF NOT EXISTS hello_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL
);

INSERT INTO hello_table (message) VALUES ('Hello, World! from CodeFrontier');
