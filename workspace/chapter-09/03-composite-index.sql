SELECT id, description, due_date
FROM items
WHERE user_id = 11 AND status = 'IN_PROGRESS';

CREATE INDEX idx_items_user_status ON items(user_id, status);
