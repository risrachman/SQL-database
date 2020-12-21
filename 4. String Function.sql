CREATE database book_shop;
SHOW databases;
USE book_shop;
SELECT database();
SHOW TABLES;
DESC books;
SELECT * FROM books;
SELECT REVERSE (UPPER('why does my cat look at me so furiously'));

SELECT 
	REPLACE (title,' ','->') AS title 
FROM 
	books;

SELECT
  author_lname AS Forwards,
  REVERSE(author_lname) AS Backwards
FROM
  books;
  
SELECT
	UPPER (CONCAT ((author_fname),' ', (author_lname))) AS 'Full Name' 
FROM 
	books;

SELECT
  CONCAT (title, ' was released in ', released_year) AS blurb
FROM
  books;
  
SELECT 
	title AS title, 
	CHAR_LENGTH (title) AS 'Character Count' 
FROM 
	books;
  
SELECT
  CONCAT(SUBSTRING(title, 1, 10), '...') AS 'Short Title',
  CONCAT (author_lname, ',', author_fname) AS Author,
  CONCAT (stock_quantity, ' in stock') AS Quantity
FROM
  books;