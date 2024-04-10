CREATE TABLE items(
  description TEXT
);

INSERT INTO items(description)
VALUES ("Debug coffee machine");

SELECT description FROM items;

UPDATE items
SET description = "Debug coffee machine (again)"
WHERE description = "Debug coffee machine";

DELETE FROM items
WHERE description = "Debug coffee machine (again)";
