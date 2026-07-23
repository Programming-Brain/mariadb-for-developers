SELECT status, COUNT(*)
FROM items
WHERE user_id = 11
GROUP BY status;

EXPLAIN
SELECT status, COUNT(*)
FROM items
WHERE user_id = 11
GROUP BY status\G
