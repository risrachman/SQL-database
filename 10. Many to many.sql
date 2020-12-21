SHOW DATABASES;
CREATE DATABASE training;
USE training;
SELECT DATABASE();
    CREATE TABLE reviewers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100)
    );
    CREATE TABLE series(
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(100),
        released_year YEAR(4), #bisa pake INT tp kl ga sengaja masuk 99999 bahaya
        genre VARCHAR(100)
    );
    
CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
	rating DECIMAL(2,1),
	series_id INT,
	reviewer_id INT,
	FOREIGN KEY (series_id) REFERENCES series (id),
	FOREIGN KEY (reviewer_id) REFERENCES reviewers (id)
);
    
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

    INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
	SELECT * FROM series;
    SELECT * FROM reviewers;
    SELECT * FROM reviews;
    
    #TV Challenge 1
    SELECT title, rating
    FROM series INNER JOIN reviews
		ON series.id = reviews.series_id;
        
    #TV Challenge 2
    SELECT title, AVG(rating) AS average
    FROM series INNER JOIN reviews
		ON series.id = reviews.series_id
	GROUP BY title
	ORDER BY average;
    
	#TV Challenge 3
    SELECT first_name, last_name, rating
    FROM reviewers INNER JOIN reviews
		ON reviewers.id = reviews.reviewer_id
        
	#TV Challenge 4
    SELECT * 
    FROM series LEFT JOIN reviews
		ON series.id = reviews.series_id
    WHERE rating is NULL;
    
	SELECT 
		title AS unreviewed_title
    FROM series LEFT JOIN reviews
		ON series.id = reviews.series_id
    WHERE rating is NULL;
    
    #TV Challenge 5
    SELECT genre, AVG(rating) AS average_rating
    FROM SERIES INNER JOIN reviews
		ON series.id = reviews.series_id
	GROUP BY genre;
    
	SELECT 
		genre, 
        ROUND (AVG(rating),2) AS average_rating #round jd 2 digit
    FROM SERIES INNER JOIN reviews
		ON series.id = reviews.series_id
	GROUP BY genre;
    
    #TV Challenge 6
	SELECT * FROM series;
    SELECT * FROM reviewers;
    SELECT * FROM reviews;
    
    ## versi 1 ##
    SELECT 
		first_name,
        last_name,
        COUNT(rating) AS 'Rating Count',
        IFNULL(MIN(rating),0) AS 'Rating  MIN',
        IFNULL(MAX(rating),0) AS 'Rating MAX',
        IFNULL(AVG(rating),0) AS 'Rating Average',
        CASE
			WHEN rating is NOT NULL THEN 'ACTIVE'
            ELSE 'INACTIVE'
		END AS 'Status'
    FROM reviewers
    LEFT JOIN reviews
		ON reviewers.id = reviews.reviewer_id
	GROUP BY last_name, first_name;
    
    ## versi 2 ##
	SELECT 
		first_name,
        last_name,
        COUNT(rating) AS 'Rating Count',
        IFNULL(MIN(rating),0) AS 'Rating  MIN',
        IFNULL(MAX(rating),0) AS 'Rating MAX',
        IFNULL(AVG(rating),0) AS 'Rating Average',
		IF(COUNT(rating)>=1, 'ACTIVE', 'INACTIVE') AS 'Status'
    FROM reviewers
    LEFT JOIN reviews
		ON reviewers.id = reviews.reviewer_id
	GROUP BY last_name, first_name;
    
    #TV Challenge 7
    SELECT 
		title, 
        rating, 
        CONCAT (first_name, ' ',last_name) AS 'reviewer'
	FROM reviews 
    INNER JOIN series
		ON reviews.series_id = series.id
    INNER JOIN reviewers
		ON reviews.reviewer_id = reviewers.id
	ORDER BY title;