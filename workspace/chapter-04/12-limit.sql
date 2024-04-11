SELECT name AS Employee, COUNT(*) AS Tasks
FROM items
JOIN users on users.id = user_id
GROUP BY user_id
ORDER BY Tasks ASC
LIMIT 3;

SELECT name AS Employee, COUNT(*) AS Tasks
FROM items
JOIN users on users.id = user_id
GROUP BY user_id
HAVING Tasks > 1
ORDER BY Tasks ASC
LIMIT 3;

INSERT INTO users(name, password)
VALUES("Alias McAlias", "imposterSyndrome");

SET @id = (SELECT id FROM users WHERE name = "Alias McAlias");

INSERT INTO items(description, user_id)
VALUES ("Fix name", @id), ("Fake it until I make it", @id);

SELECT name AS Employee, COUNT(*) AS Tasks
FROM items
JOIN users on users.id = user_id
GROUP BY user_id
HAVING Tasks > 1
ORDER BY Tasks ASC
OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY;

SELECT name AS Employee, COUNT(*) AS Tasks
FROM items
JOIN users on users.id = user_id
GROUP BY user_id
HAVING Tasks > 1
ORDER BY Tasks ASC
OFFSET 0 ROWS FETCH FIRST 3 ROWS WITH TIES;
