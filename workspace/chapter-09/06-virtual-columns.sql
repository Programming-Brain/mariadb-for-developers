ALTER TABLE items
ADD COLUMN priority_score DECIMAL(6,2) AS(
  (100 - DATEDIFF(due_date, created_at)) * (1 + `high_priority`)
) VIRTUAL;

ALTER TABLE items
ADD INDEX idx_priority (priority_score);

SELECT * FROM items WHERE priority_score > 95.0;
