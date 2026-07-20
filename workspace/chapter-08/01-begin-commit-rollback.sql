SELECT @@autocommit;

SET @@autocommit = OFF;

SELECT @@autocommit;

INSERT INTO tags(name) VALUES ("just testing");

SELECT * FROM tags WHERE name = "just testing";

COMMIT;

SET @@autocommit = ON;

START TRANSACTION;

INSERT INTO tags(name) VALUES ('some tag');
UPDATE projects SET status = 'DEACTIVATED' WHERE id = 1;

ROLLBACK;

SELECT * FROM tags WHERE name = "some tag";

SELECT status FROM projects WHERE id = 1;
