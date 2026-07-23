SELECT id, description, status
FROM items
ORDER BY created_at DESC
LIMIT 50 OFFSET 50;

SELECT id, description, status
FROM items
ORDER BY created_at DESC
LIMIT 50 OFFSET 499950;

CREATE INDEX idx_items_created_id ON items(created_at, id);

SELECT id, description, status, created_at
FROM items
ORDER BY created_at DESC, id DESC
LIMIT 50;

SELECT id, description, status, created_at
FROM items 
WHERE (created_at, id) < ('2024-03-03 00:00:00', 62)
ORDER BY created_at DESC, id DESC 
LIMIT 50;