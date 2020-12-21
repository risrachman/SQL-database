USE join_us;
Show tables;
SELECT COUNT(*) FROM users;

#Find earliset date a user join!
SELECT created_at AS earliest_data FROM users ORDER BY created_at LIMIT 1;
SELECT DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date FROM users;

#Find email at the first (earliest) user!
SELECT email, created_at FROM users 
WHERE created_at = (SELECT MIN(created_at) FROM users);

#Users registered according to the month they joined (order dr yg terbanyak diatas)
SELECT 
	MONTHNAME(created_at) AS month,
    COUNT(*) AS total
FROM users
GROUP BY month ORDER BY total DESC;

#Count the number of users using yahoo mail!
SELECT COUNT(*) AS 'yahoo users total' FROM users WHERE email LIKE '%yahoo%';

#Calculate the total number of user for each email have!!
SELECT 
	CASE
		WHEN email LIKE '%yahoo%' THEN 'Yahoo'
        WHEN email LIKE '%gmail%' THEN 'Gmail'
        WHEN email LIKE '%hotmail%' THEN 'Hotmail'
        ELSE 'Other'
	END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;

