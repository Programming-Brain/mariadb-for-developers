SELECT i.id, i.due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE i.description LIKE "%API%"
AND u.email = "rmanilo11@amazzon.de"

SELECT i.id, u.name, i.description, i.due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE NOW() > i.due_date
ORDER BY i.due_date, u.name;

SELECT i.id, u.name, i.description, i.due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE NOW() > i.due_date AND i.id = 134
ORDER BY i.due_date, u.name;

SELECT i.id, u.name, i.description, i.due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE '2024-06-08 00:44:12' > i.due_date AND i.id = 134 -- hardcoded "NOW()" for simulating
ORDER BY i.due_date, u.name;

SELECT NOW();

SELECT i.id, u.name, i.description, i.due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE '2024-06-07' > i.due_date -- hardcoded "client date" for simulating
ORDER BY i.due_date, u.name;

SELECT CONVERT_TZ("2024-06-29 20:00", "+3:00", "-5:00") AS 'Colombian time';

ALTER TABLE users ADD COLUMN time_zone CHAR(6);

UPDATE users SET time_zone = "+03:00" WHERE id = 2;

SELECT CONCAT(LEFT(i.description, 10), "...") description,
    i.created_at created_at, i.due_date due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE i.status = "IN_PROGRESS"
AND u.id = 2
ORDER BY i.created_at;

SELECT CONCAT(LEFT(i.description, 10), "...") description,
    CONVERT_TZ(i.created_at, "+0:00", "+3:00") created_at,
    CONVERT_TZ(i.due_date, "+0:00", "+3:00") due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE i.status = "IN_PROGRESS"
AND u.id = 2
ORDER BY i.created_at;

SELECT CONCAT(LEFT(i.description, 10), "...") description,
    CONVERT_TZ(i.created_at, "+0:00", u.time_zone) created_at,
    CONVERT_TZ(i.due_date, "+0:00", u.time_zone) due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE i.status = "IN_PROGRESS"
AND u.id = 2
ORDER BY i.created_at;

SELECT CONCAT(LEFT(i.description, 10), "...") description,
    CONVERT_TZ(i.created_at, "+0:00", u.time_zone) created_at,
    DATE(CONVERT_TZ(i.due_date, "+0:00", u.time_zone)) due_date
FROM items i
JOIN users u ON u.id = i.user_id
WHERE i.status = "IN_PROGRESS"
AND u.id = 2
ORDER BY i.created_at;
