SELECT user_id, due_date
FROM items
WHERE due_date BETWEEN "2024-06-04" AND "2024-06-07"
AND !`high_priority`
LIMIT 1;

SELECT
	i.id AS id,
	i.description AS description,
    i.due_date AS due_date,
	i.high_priority AS "high_priority"
FROM users u
JOIN items i ON i.user_id = u.id
WHERE status = "IN_PROGRESS" AND u.id = 5;

SELECT
	i.id AS id,
	i.description AS description,
	i.due_date AS due_date,
	IF(i.`high_priority`
		OR i.due_date <= NOW() + INTERVAL 3 DAY,
			1, i.high_priority) AS "high_priority"
FROM users u
JOIN items i ON i.user_id = u.id
WHERE status = "IN_PROGRESS" AND u.id = 5;

SELECT
	i.id AS id,
	i.description AS description,
	i.due_date AS due_date,
	IF(i.`high_priority`
		OR i.due_date <= "2024-06-07" + INTERVAL 3 DAY,
			1, i.high_priority) AS "high_priority" -- hardcoded NOW for testing
FROM users u
JOIN items i ON i.user_id = u.id
WHERE status = "IN_PROGRESS" AND u.id = 5;

SELECT user_id, `high_priority` FROM items WHERE description LIKE "%urgent%";

SELECT
	i.id AS id,
	i.description AS description,
    i.due_date AS due_date,
	CASE
		WHEN i.due_date <= NOW() + INTERVAL 3 DAY THEN 1
		WHEN i.description LIKE "%urgent%" THEN 1
		ELSE i.high_priority
	END AS "high_priority"
FROM users u
JOIN items i ON i.user_id = u.id
WHERE status = "IN_PROGRESS" AND u.id = 46;

SELECT
	i.id AS id,
	i.description AS description,
    i.due_date AS due_date,
	CASE
		WHEN i.due_date <= "2024-06-07" + INTERVAL 3 DAY THEN 1 -- hardcoded NOW for testing
		WHEN i.description LIKE "%urgent%" THEN 1
		ELSE i.high_priority
	END AS "high_priority"
FROM users u
JOIN items i ON i.user_id = u.id
WHERE status = "IN_PROGRESS" AND u.id = 46;

SELECT
	p.name AS project,
	COUNT(*) AS total,
	COUNT(IF(i.status = "DONE", 1, NULL)) AS completed,
	COUNT(IF(i.status = "IN_PROGRESS", 1, NULL)) AS in_progress
FROM projects p
JOIN items i ON i.project_id = p.id
GROUP BY p.id;

SELECT
	p.name AS project,
	COUNT(*) AS total,
	COUNT(IF(i.status = "DONE", 7777, NULL)) AS completed,
	COUNT(IF(i.status = "IN_PROGRESS", 7777, NULL)) AS in_progress
FROM projects p
JOIN items i ON i.project_id = p.id
GROUP BY p.id;

SELECT
	p.name AS project,
	COUNT(*) AS total,
	COUNT(CASE WHEN i.status = "DONE" THEN 1 END) AS completed,
	COUNT(CASE WHEN i.status = "IN_PROGRESS" THEN 1 END) AS in_progress
FROM projects p
JOIN items i ON i.project_id = p.id
GROUP BY p.id;

SELECT
	p.name,
	COUNT(*) AS total,
	-- wrong usage of COUNT:
	COUNT(i.status = "DONE") AS completed,
	COUNT(i.status = "IN_PROGRESS") AS in_progress
FROM projects p
JOIN items i ON i.project_id = p.id
GROUP BY p.id;
