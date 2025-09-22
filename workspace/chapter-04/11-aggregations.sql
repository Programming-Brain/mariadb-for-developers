INSERT INTO users (name, password) VALUES 
    ('Cee Sharp', 'dotnet789'),
    ('Harry Scripter', 'magicMethods'),
    ('Sally Sequel', 'joinTheFun'),
    ('Rick Rollback', 'neverGonnaCommitYouUp');

INSERT INTO items (user_id, description) VALUES
    (1, 'Escape the office maze'),
    (1, 'Rename variables to emojis'),
    (1, 'Install light theme'),
    (2, 'Reboot the refrigerator'),
    (3, 'Ping the pizza delivery'),
    (3, 'Commit to gym'),
    (6, 'Merge breakfast and lunch'),
    (6, 'Rollback bedtime'),
    (7, 'Checkout the weekend'),
    (8, 'Push code to production on Friday'),
    (8, 'Pull request for vacation'),
    (9, 'Branch out hobbies'),
    (9, 'Archive old emails'),
    (9, 'Fetch coffee'),
    (9, 'Stash snacks in desk');

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
