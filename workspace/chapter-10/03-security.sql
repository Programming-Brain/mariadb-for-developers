-- execute the statements in this file with the root user

CREATE USER 'todo_app'@'10.0.0.%'
IDENTIFIED BY 'a-long-random-generated-password';

GRANT SELECT, INSERT, UPDATE, DELETE
ON todo.*
TO 'todo_app'@'10.0.0.%';

CREATE USER 'todo_migrations'@'10.0.0.%'
IDENTIFIED BY 'another-long-random-password';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP,
    INDEX, REFERENCES
ON todo.*
TO 'todo_migrations'@'10.0.0.%';

CREATE ROLE todo_readonly;

GRANT SELECT ON todo.* TO todo_readonly;

CREATE USER 'moe'@'10.0.0.%' IDENTIFIED BY 'moes-own-password';
GRANT todo_readonly TO 'moe'@'10.0.0.%';
SET DEFAULT ROLE todo_readonly FOR 'moe'@'10.0.0.%';

INSTALL SONAME 'simple_password_check';

ALTER USER 'moe'@'10.0.0.%'
IDENTIFIED BY 'pass'; -- error

ALTER USER 'moe'@'10.0.0.%'
IDENTIFIED BY 'P4ssw0rd321!'; -- ok

INSTALL SONAME 'server_audit';
SET GLOBAL server_audit_logging = ON;

SHOW GLOBAL VARIABLES LIKE 'have_ssl';

ALTER USER 'todo_app'@'10.0.0.%' REQUIRE SSL;

SHOW SESSION STATUS LIKE 'Ssl_cipher';

SET SESSION sql_safe_updates = ON;
UPDATE users SET blocked = TRUE;

