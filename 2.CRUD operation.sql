SHOW databases;
SELECT database();
SHOW TABLES;
USE cat;
DROP TABLE cat;
CREATE TABLE cats (
	cat_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	breed VARCHAR(100),
	age INT,
	PRIMARY KEY (cat_id)
); 
SHOW TABLES;
DESC cats;
INSERT INTO cats (name, breed, age)
VALUES  ('Ringo', 'Tabby', 4),
		('Cindy','Maine Coon',10),
		('Dumbledore','Maine Coon', 11),
		('Egg','Persian',4),
		('Misty','Tabby',13),
		('George Michael','Ragdoll',9),
		('Jackson','Sphynx',7);
SELECT * FROM cats;
SELECT name FROM cats;
SELECT breed FROM cats;
SELECT name, age FROM cats;
SELECT name, age, breed, cat_id FROM cats;
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='Egg';
SELECT cat_id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;
SELECT name AS cat_name, breed AS kitty_breed FROM cats;
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
DESC cats;
SELECT * FROM cats;
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET age=14 WHERE name='misty';
UPDATE cats SET name='Jack' WHERE name='jackson';
UPDATE cats SET breed='British Shorthair' WHERE name='ringo';
UPDATE cats SET age=12 WHERE breed='maine coon';
SELECT * FROM cats;
DELETE FROM cats WHERE name='egg';
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats;
SELECT * FROM cats;