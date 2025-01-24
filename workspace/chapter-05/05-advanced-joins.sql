INSERT INTO projects(parent_id, name, description, status)
VALUES (NULL, "Project Unicorn", "Transform the whole company", "NOT_STARTED");

SELECT name FROM projects WHERE status = "NOT_STARTED";

SELECT id FROM projects
EXCEPT
SELECT project_id FROM items;

SELECT name
FROM projects
WHERE id IN(
	SELECT id FROM projects
	EXCEPT
	SELECT project_id FROM items
);

SELECT "Hello, ", (SELECT "World!");

SELECT * FROM items WHERE status = (SELECT "DONE");

SELECT
	p.name AS project,
	COUNT(*) AS total,
	COUNT(CASE WHEN i.status = "DONE" THEN 1 END) AS completed,
	COUNT(CASE WHEN i.status = "IN_PROGRESS" THEN 1 END) AS in_progress
FROM projects p
JOIN items i ON i.project_id = p.id
GROUP BY p.id;

SELECT
	p.name AS project,
	COUNT(*) AS total,
	COUNT(CASE WHEN i.status = "DONE" THEN 1 END) AS completed,
	COUNT(CASE WHEN i.status = "IN_PROGRESS" THEN 1 END) AS in_progress
FROM projects p
LEFT JOIN items i ON i.project_id = p.id
GROUP BY p.id;

SELECT
	p.name AS project,
	COUNT(i.id) AS total,
	COUNT(CASE WHEN i.status = "DONE" THEN 1 END) AS completed,
	COUNT(CASE WHEN i.status = "IN_PROGRESS" THEN 1 END) AS in_progress
FROM projects p
LEFT JOIN items i ON i.project_id = p.id
GROUP BY p.id;

CREATE TEMPORARY TABLE table1(color TEXT, data1 CHAR);
CREATE TEMPORARY TABLE table2(color TEXT, data2 CHAR);

INSERT INTO table1 VALUES
	("grey", "A"),
	("green", "B"),
	("white", "C");

INSERT INTO table2 VALUES
	("green", "D"),
	("white", "E"),
	("red", "F");

SELECT table1.data1, table2.data2, table1.color, table2.color
FROM table1 CROSS JOIN table2;

SELECT table1.data1, table2.data2, table1.color, table2.color
FROM table1 INNER JOIN table2 ON table1.color = table2.color;

SELECT table1.data1, table2.data2, table1.color, table2.color
FROM table1 LEFT JOIN table2 ON table1.color = table2.color;

SELECT table1.data1, table2.data2, table1.color, table2.color
FROM table1 RIGHT JOIN table2 ON table1.color = table2.color;
