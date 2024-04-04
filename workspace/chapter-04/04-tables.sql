CREATE TABLE todo.some_table(col1 TEXT, col2 TEXT);
USE todo;
CREATE TABLE another_table(col1 TEXT);
CREATE TABLE todo.another_table(col1 TEXT); -- error
CREATE OR REPLACE TABLE todo.another_table(col1 TEXT);
CREATE TABLE IF NOT EXISTS yet_another_table(col1 TEXT);
CREATE TABLE some_table2 LIKE some_table;
DESCRIBE some_table2;
DESC some_table2;
CREATE TEMPORARY TABLE temp(col1 TEXT);
CREATE TEMPORARY TABLE temp2 LIKE some_table;
SHOW TABLES IN todo;
ALTER TABLE some_table
  ADD COLUMN col3 INT;
ALTER TABLE some_table
  ADD COLUMN col4 INT,
  ADD COLUMN col5 INT;
ALTER TABLE some_table MODIFY COLUMN col5 TEXT;
ALTER TABLE some_table CHANGE COLUMN col5 col_five TEXT;
ALTER TABLE some_table DROP COLUMN col_five;
RENAME TABLE some_table2 TO some_table_too;
DROP TABLE some_table_too;
DROP TABLE
  some_table,
  another_table,
  yet_another_table;