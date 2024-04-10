SELECT user_id, description FROM items;

SELECT name, description FROM items; -- error

SELECT name, description FROM items, users;

SELECT name, description, user_id, users.id FROM items, users;

SELECT name, description, user_id, users.id
FROM items
JOIN users ON users.id = items.user_id
WHERE user_id = users.id;

SELECT name, description
FROM items
JOIN users ON users.id = items.user_id;

SELECT name AS Employee, description AS Task
FROM items
JOIN users ON users.id = items.user_id;

SELECT name Employee, description Task
FROM items
JOIN users ON users.id = items.user_id;
