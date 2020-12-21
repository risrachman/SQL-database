#challenge 1
#find the 5 oldest users!
SELECT * FROM users ORDER BY created_at LIMIT 5;

#challenge 2
#we need to know what day of the week most users register!
SELECT 
	DAYNAME(created_at) AS day,  
	COUNT(*) AS total
FROM users GROUP BY day ORDER BY total DESC;

#Challenge 3
#Find the users who have never posted a photo!
#version 1
SELECT username
FROM users LEFT JOIN photos
	ON users.id = photos.user_id
WHERE image_url is NULL;
#version 2
SELECT username
FROM users LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.id is NULL;

#Challenge 4
#We are runnig a contest to see who can get the most like on a single photo!
SELECT 
	username,
    image_url,
    COUNT(*) AS total_like
FROM photos
INNER JOIN likes
	ON photos.id = likes.photo_id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total_like DESC;

#Challenge 5
#How many times does the average users post
SELECT 
(SELECT COUNT(*) FROM   photos) / 
(SELECT COUNT(*) FROM   users) AS avg; 
SELECT 
	username,
    image_url,
    COUNT(image_url) as jumlah_foto
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
GROUP BY username
ORDER BY jumlah_foto DESC;

#Challenge 6
#What are the top 5 most commonly used hashtags?
SELECT 
	tags.tag_name,
    COUNT(*) AS total_count
FROM photo_tags
INNER JOIN tags
	ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total_count DESC
LIMIT 5;

#Challenge 7
#we have problem with bots
#find user who have liked all photos in our site
SELECT * FROM likes; # jumlahnya aslinya 8000, bisa dilihat di command line, hanya saja di result grid tdk kelihatan 
SELECT COUNT(*) FROM likes; #bisa dibuktikan disini
SELECT
	username,
    COUNT(*) AS total_like
FROM users
INNER JOIN likes
	ON likes.user_id = users.id
GROUP BY username
ORDER BY total_like DESC; #dapat menunjukan user yg ngelike terbanyak, tapi tidak bisa menentukan bahwa user telah ngelike semua post
SELECT 
	username, 
	Count(*) AS total_like
FROM users 
INNER JOIN likes 
	ON users.id = likes.user_id 
GROUP  BY username 
HAVING total_like = (SELECT Count(*) 
					FROM photos); #PAKE HAVING yang bener




