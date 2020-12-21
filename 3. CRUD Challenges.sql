SELECT database();
SHOW databases;
CREATE database shirts_db;
USE shirts_db;
SELECT database();
CREATE TABLE shirts(
shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
article VARCHAR(50),
color VARCHAR(50),
shirt_size VARCHAR(10),
last_worn VARCHAR(50)
);
SHOW COLUMNS FROM shirts;
DESC shirts;
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES  ('t-shirt', 'white', 'S', 10),
		('t-shirt', 'green', 'S', 200),
		('polo shirt', 'black', 'M', 10),
		('tank top', 'blue', 'S', 50),
		('t-shirt', 'pink', 'S', 0),
		('polo shirt', 'red', 'M', 5),
		('tank top', 'white', 'S', 200),
		('tank top', 'blue', 'M', 15);
SELECT * FROM shirts;
INSERT INTO shirts (article, shirt_size, last_worn)
VALUES  ('polo shirt', 'M', 50);
SELECT article, color FROM shirts;
SELECT shirt_id FROM shirts WHERE shirt_size='M';

SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';

SELECT * FROM shirts;
SELECT * FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE last_worn=200;
SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';
DELETE FROM shirts;
DROP TABLE shirts;