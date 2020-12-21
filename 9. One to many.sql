    #precheck
    SELECT database();
    SHOW TABLES;
    
    # Creating table
    CREATE TABLE customers(
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        email VARCHAR(100)
    );
    CREATE TABLE orders(
        id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE,
        amount DECIMAL(8,2),
        customer_id INT,
        FOREIGN KEY(customer_id) REFERENCES customers(id)
    );
    
    # Inputing data
        INSERT INTO customers (first_name, last_name, email) 
    VALUES ('Boy', 'George', 'george@gmail.com'),
           ('George', 'Michael', 'gm@gmail.com'),
           ('David', 'Bowie', 'david@gmail.com'),
           ('Blue', 'Steele', 'blue@gmail.com'),
           ('Bette', 'Davis', 'bette@aol.com');
           
    INSERT INTO orders (order_date, amount, customer_id)
    VALUES ('2016/02/10', 99.99, 1),
           ('2017/11/11', 35.50, 1),
           ('2014/12/12', 800.67, 2),
           ('2015/01/03', 12.50, 2),
           ('1999/04/11', 450.25, 5);
    SELECT * FROM customers;
    SELECT * FROM orders;
    SELECT * FROM customers, orders; #ga karuan
    
	# IMPLICIT INNER JOINS
    SELECT * FROM customers, orders
    WHERE customers.id = orders.customer_id;
    
	SELECT * FROM orders, customers
    WHERE customers.id = orders.customer_id;
    
    # EXPLICIT INNER JOINS
	SELECT * FROM customers
    JOIN orders
        ON customers.id = orders.customer_id;
	SELECT * FROM orders
    JOIN customers
        ON customers.id = orders.customer_id;
        
    SELECT first_name, last_name, order_date, amount 
    FROM customers
    JOIN orders
        ON customers.id = orders.customer_id;
        
    SELECT *
	FROM orders
    JOIN customers
        ON customers.id = orders.customer_id;
	
    #Refining the syntax
	SELECT
		first_name,
        last_name,
        SUM(amount) AS total_amount
	FROM orders JOIN customers ON customers.id = orders.customer_id
    GROUP BY customers.id
    ORDER BY total_amount DESC;
    
    # INNER JOIN
	SELECT * FROM customers
	INNER JOIN orders
        ON customers.id = orders.customer_id;
    #LEFT JOIN
    SELECT * FROM customers
	LEFT JOIN orders
        ON customers.id = orders.customer_id;
	#RIGHT JOIN
    SELECT * FROM customers
	RIGHT JOIN orders
        ON customers.id = orders.customer_id;
        
	SELECT * FROM customers;
    SELECT * FROM orders;
    
    #LEFT JOIN with advanced config
	SELECT
		first_name,
        last_name,
        SUM(amount) AS total_amount
	FROM customers
    LEFT JOIN orders
		ON customers.id = orders.customer_id
    GROUP BY customers.id
    ORDER BY total_amount DESC;
    
    # CHALLENGE
    CREATE TABLE students(
		id INT AUTO_INCREMENT PRIMARY KEY,
		first_name VARCHAR(100)
    );
    CREATE TABLE papers(
		title VARCHAR(100),
		grade INT,
		student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
		ON DELETE CASCADE
    );
    
    DESC students;
    DESC papers;
    
    INSERT INTO students (first_name) VALUES 
		('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

	INSERT INTO papers (student_id, title, grade ) VALUES
		(1, 'My First Book Report', 60),
		(1, 'My Second Book Report', 75),
		(2, 'Russian Lit Through The Ages', 94),
		(2, 'De Montaigne and The Art of The Essay', 98),
		(4, 'Borges and Magical Realism', 89);
        
	SELECT * FROM students;
    SELECT * FROM papers;
    
    SELECT first_name, title, grade
    FROM students INNER JOIN papers ON papers.student_id = students.id
    ORDER BY grade DESC;
    
	SELECT first_name, title, grade
    FROM students LEFT JOIN papers ON papers.student_id = students.id;
    
	SELECT 
		first_name, 
		IFNULL(title,'Missing') AS title,
		IFNULL(grade, 0) AS grade
    FROM students LEFT JOIN papers 
		ON papers.student_id = students.id;
        
	SELECT
		first_name,
		IFNULL(AVG (grade),'0') AS average
    FROM students LEFT JOIN papers 
		ON papers.student_id = students.id
	GROUP BY students.id
    ORDER BY average DESC;
    
	SELECT
		first_name,
		IFNULL(AVG (grade),'0') AS average,
        CASE
			WHEN AVG (grade) >= 75 THEN 'PASSING'
			WHEN AVG (grade) is NULL THEN 'FAILING'
            ELSE 'FAILING'
		END AS passing_status
    FROM students LEFT JOIN papers 
		ON papers.student_id = students.id
	GROUP BY students.id
    ORDER BY average DESC;