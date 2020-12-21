SHOW databases;
SELECT database();
SHOW TABLES;
DESC books;
SELECT * FROM books;
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) AS 'Number of author' FROM books;
SELECT 
	COUNT(DISTINCT author_fname) AS 'N_first name author',
	COUNT(DISTINCT author_lname) AS 'N_last name author' , 
	COUNT(DISTINCT author_lname, author_fname) AS 'N_real name author'  
FROM books;
SELECT title, author_fname, author_lname FROM books;
SELECT 
	author_fname, 
	author_lname, 
	COUNT(*) AS 'N_title' 
FROM books 
GROUP BY author_lname, author_fname;
SELECT 
	released_year, 
	COUNT(*) AS quantity 
FROM books 
GROUP BY released_year ORDER BY released_year; 

SELECT 
	CONCAT('In ',released_year, ' ',COUNT(*), ' book(s) released') AS 'year'
FROM books 
GROUP BY released_year ORDER BY released_year; 

SELECT title, 
CONCAT(author_fname,' ',author_lname), pages 
FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname,' ',author_lname) AS author, MAX(pages) AS 'longest book' 
FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, COUNT(*), AVG(stock_quantity) FROM books
GROUP BY released_year;

SELECT 
	author_fname AS 'first name', 
	author_lname AS 'last name', 
	COUNT(*) AS N_book,
    SUM(stock_quantity),
	AVG(stock_quantity) 
FROM books GROUP BY released_year;
