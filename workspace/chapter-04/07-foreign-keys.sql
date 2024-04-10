CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name TEXT,
    password TEXT
);

ALTER TABLE items
ADD COLUMN user_id INT,
ADD FOREIGN KEY fk_items_user_id(user_id)
    REFERENCES users(id);

-- Insert some users (with ids 1, 2, 3 - AUTO_INCREMENT)
INSERT INTO users(name, password)
VALUES
    ("Maria", "pass1"),
    ("John", "pass2"),
    ("Jane", "pass3");

INSERT INTO items(description, user_id)
VALUES("Use the rubber duck", 999); -- error

INSERT INTO items(description, user_id)
VALUES("Use the rubber duck", 1);

UPDATE items SET user_id = 1 WHERE id = 1;
UPDATE items SET user_id = 2 WHERE id = 2;
UPDATE items SET user_id = 3 WHERE id = 3;
UPDATE items SET user_id = 3 WHERE id = 4;

SELECT description FROM items WHERE user_id = 1;