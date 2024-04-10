ALTER TABLE users
MODIFY COLUMN name TEXT NOT NULL,
MODIFY COLUMN password TEXT NOT NULL;

ALTER TABLE items
MODIFY COLUMN user_id INT NOT NULL;

INSERT INTO users(name, password) VALUES(NULL, "pass"); -- error

INSERT INTO users(name, password) VALUES("", "pass");

DELETE FROM users WHERE name = "";

ALTER TABLE users
ADD CONSTRAINT users_name_not_empty CHECK (TRIM(name) <> "");

INSERT INTO users(name, password) VALUES("  ", "pass"); -- error

ALTER TABLE users
ADD CONSTRAINT users_password_valid
    CHECK (LENGTH(password) >= 5);

ALTER TABLE users
ADD UNIQUE KEY uq_users_name(name);

INSERT INTO users(name, password) VALUES("Maria", "pass1"); -- error
