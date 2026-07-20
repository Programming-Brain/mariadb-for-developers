-- use the root user to run this:
SET GLOBAL event_scheduler = ON;

CREATE OR REPLACE EVENT purge_test_tags
ON SCHEDULE EVERY 1 DAY
DO
    DELETE FROM tags WHERE name = "just testing";
