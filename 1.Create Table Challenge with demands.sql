SHOW databases;
CREATE database quiz;
USE quiz;
SELECT database();
CREATE TABLE Employees (
	id INT AUTO_INCREMENT NOT NULL, 
	Last_name VARCHAR(50) NOT NULL, 
	First_name VARCHAR(50) NOT NULL, 
	Middle_name VARCHAR (50), 
	age INT NOT NULL, 
	current_status VARCHAR (100) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
);
SHOW TABLES;
DESC Employees;
INSERT INTO Employees (First_name, Last_name, age)
VALUES ('Dora','The Explorer', 12),
		("John", "Smith", 43),
        ('Alex','Turner',55);
SELECT * FROM Employees;