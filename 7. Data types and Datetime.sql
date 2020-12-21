#date time
SELECT database();
SHOW tables;
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthDT DATETIME);
DESC people;

INSERT INTO people (name, birthdate, birthtime, birthDT)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35'),
		('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
        
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(CURDATE(),'%m/%d/%Y');
SELECT DATE_FORMAT(NOW(),'%M %D at %H:%i');

INSERT INTO people (name, birthdate, birthtime, birthDT)
VALUES('Toaster',CURDATE(),CURTIME(),NOW());
SELECT * FROM people;
SELECT name, birthdate FROM people;
SELECT name, DAY(birthdate) FROM people;
SELECT name, DAYOFMONTH(birthdate) FROM people;
SELECT name, DAYNAME(birthdate) FROM people;
SELECT name, YEAR(birthdate) FROM people;

SELECT name, birthDT, DATEDIFF(NOW(),birthDT) AS 'Day_Diff' FROM people;

#create comment
CREATE TABLE comments (content VARCHAR(100), created_at TIMESTAMP DEFAULT now());
SELECT * FROM comments;
INSERT INTO comments (content) VALUES ('what lol, thats funny');
INSERT INTO comments (content) VALUES ('lmafaooo');
INSERT INTO comments (content) VALUES ('no wayyyy hahaha');
SELECT * FROM comments ORDER BY created_at DESC;

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
SELECT * FROM comments2;
INSERT INTO comments2 (content) VALUES ('what lol, thats funny');
INSERT INTO comments2 (content) VALUES ('lmafaooo');
INSERT INTO comments2 (content) VALUES ('no wayyyy hahaha');
UPDATE comments2 SET content='i am sorry, doesnt mean to' WHERE content='lmafaooo';