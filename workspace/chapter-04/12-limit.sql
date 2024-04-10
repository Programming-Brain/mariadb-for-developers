SELECT name AS Employee
FROM items
JOIN users on users.id = user_id
GROUP BY user_id
ORDER BY COUNT(*) ASC
LIMIT 3;
