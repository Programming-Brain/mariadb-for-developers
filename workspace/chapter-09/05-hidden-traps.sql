SHOW INDEX FROM items;

CREATE INDEX idx_items_completed_at ON items(completed_at);

SELECT id, description
FROM items
WHERE YEAR(completed_at) = 2024;

SELECT id, description
FROM items
WHERE completed_at >= '2024-01-01 00:00:00'
AND completed_at < '2025-01-01 00:00:00';

EXPLAIN
SELECT id, description
FROM items
WHERE YEAR(completed_at) = 2024;
