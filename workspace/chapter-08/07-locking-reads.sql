START TRANSACTION;

SELECT quantity FROM prizes WHERE id = 8 FOR UPDATE;
-- application checks that quantity > 0

UPDATE prizes SET quantity = quantity - 1 WHERE id = 8;

INSERT INTO winners(user_id, prize_id, awarded_date)
VALUES (5, 8, CURDATE());

COMMIT;
