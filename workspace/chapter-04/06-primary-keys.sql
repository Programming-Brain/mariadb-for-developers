INSERT INTO items
VALUES
    ('Turn bugs into "features"'),
    ("Refactor lunch plans"),
    ("Fork the kitchen"),
    ("Fork the kitchen");

UPDATE items
SET description = "Automate kitchen cleanup"
WHERE description = "Fork the kitchen";

UPDATE items
SET description = "Fork the kitchen"
WHERE description = "Automate kitchen cleanup";

ALTER TABLE items
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

SELECT * FROM items;

INSERT INTO items(description)
VALUES("Sprint for coffee");

SELECT * FROM items;

INSERT INTO items(id, description)
VALUES(1, "Buy coffee for sprint"); -- error

UPDATE items
SET description = "Automate kitchen cleanup"
WHERE id = 4;

SELECT * FROM items;

DELETE FROM items WHERE id = 5;
