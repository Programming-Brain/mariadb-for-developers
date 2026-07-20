-- session 1
START TRANSACTION;
UPDATE prizes SET quantity = quantity - 1 WHERE id = 8;

-- session 2
START TRANSACTION;
UPDATE prizes SET quantity = quantity - 1 WHERE id = 15;

-- session 1 (now wants prize 15, held by session 2)
UPDATE prizes SET quantity = quantity - 1 WHERE id = 15;

-- session 2 (now wants prize 8, held by session 1)
UPDATE prizes SET quantity = quantity - 1 WHERE id = 8;

SHOW ENGINE INNODB STATUS\G;