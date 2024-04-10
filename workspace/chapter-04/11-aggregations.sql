INSERT INTO users (name, password) VALUES 
('Cee Sharp', 'dotnet789'),
('Harry Scripter', 'magicMethods'),
('Sally SQL', 'joinTheFun'),
('Rick Rollback', 'neverGonnaCommitYouUp');

INSERT INTO items (user_id, description) VALUES
(1, 'Escape the office maze'),
(1, 'Rename variables to emojis'),
(1, 'Install light theme'),
(2, 'Reboot the refrigerator'),
(3, 'Ping the pizza delivery'),
(3, 'Commit to gym'),
(5, 'Merge breakfast and lunch'),
(5, 'Rollback bedtime'),
(6, 'Checkout the weekend'),
(7, 'Push code to production on Friday'),
(7, 'Pull request for vacation'),
(8, 'Branch out hobbies'),
(8, 'Archive old emails'),
(8, 'Fetch coffee'),
(8, 'Stash snacks in desk');

SELECT COUNT(*) FROM items;

SELECT COUNT(*) FROM items WHERE user_id = 1;

SELECT user_id, COUNT(*) FROM items WHERE user_id = 1;

SELECT user_id, COUNT(*) FROM items GROUP BY user_id;

SELECT name, COUNT(*)
FROM items
JOIN users on users.id = user_id
GROUP BY user_id;

SELECT name AS Employee, COUNT(*) AS Tasks
FROM items
JOIN users on users.id = user_id
GROUP BY user_id
ORDER BY Tasks DESC;
