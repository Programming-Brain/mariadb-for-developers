SELECT name AS Employee, description AS Task
FROM items
JOIN users ON users.id = items.user_id
ORDER BY name;

SELECT name AS Employee, description AS Task
FROM items
JOIN users ON users.id = items.user_id
ORDER BY name, description;

SELECT name AS Employee, description AS Task
FROM items
JOIN users ON users.id = items.user_id
ORDER BY Employee, Task;

SELECT name AS Employee, description AS Task
FROM items
JOIN users ON users.id = items.user_id
ORDER BY Employee DESC, Task;
