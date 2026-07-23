SELECT description FROM items WHERE status = 'IN_PROGRESS';

EXPLAIN
SELECT * FROM users
WHERE name = 'Moe Piddick'\G

CREATE INDEX idx_users_name ON users(name);

EXPLAIN
SELECT * FROM users
WHERE name = 'Moe Piddick'\G

ANALYZE
SELECT * FROM users
WHERE name = 'Moe Piddick'\G
