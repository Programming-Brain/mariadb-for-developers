DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    UNIQUE KEY uq_users_name (name),
    CONSTRAINT users_name_not_empty CHECK (TRIM(name) <> ''),
    CONSTRAINT users_password_valid CHECK (LENGTH(password) >= 5)
);

CREATE TABLE items (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(250),
    user_id INT NOT NULL,
    FOREIGN KEY fk_items_user_id (user_id),
    CONSTRAINT fk_items_user_id FOREIGN KEY (user_id)REFERENCES users (id)
);

INSERT INTO users(id, name, password) VALUES
    (1, 'Maria', 'pass1'),
    (2, 'John', 'pass2'),
    (3, 'Jane', 'pass3'),
    (5, 'Cee Sharp', 'dotnet789'),
    (6, 'Harry Scripter', 'magicMethods'),
    (7, 'Sally Sequel', 'joinTheFun'),
    (8, 'Rick Rollback', 'neverGonnaCommitYouUp'),
    (9, 'Alias McAlias', 'imposterSyndrome');

INSERT INTO items(description, id, user_id) VALUES
    ('Turn bugs into "features"', 1, 1),
    ('Refactor lunch plans', 2, 2),
    ('Fork the kitchen', 3, 3),
    ('Automate kitchen cleanup', 4, 3),
    ('Use the rubber duck', 6, 1),
    ('Escape the office maze', 7, 1),
    ('Rename variables to emojis', 8, 1),
    ('Install light theme', 9, 1),
    ('Reboot the refrigerator', 10, 2),
    ('Ping the pizza delivery', 11, 3),
    ('Commit to gym', 12, 3),
    ('Merge breakfast and lunch', 13, 5),
    ('Rollback bedtime', 14, 5),
    ('Checkout the weekend', 15, 6),
    ('Push code to production on Friday', 16, 7),
    ('Pull request for vacation', 17, 7),
    ('Branch out hobbies', 18, 8),
    ('Archive old emails', 19, 8),
    ('Fetch coffee', 20, 8),
    ('Stash snacks in desk', 21, 8),
    ('Fix name', 22, 9),
    ('Fake it until I make it', 23, 9);
