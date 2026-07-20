-- before continuing, you might need to use the root user to run:
-- set global log_bin_trust_function_creators=1;

DELIMITER $$

CREATE OR REPLACE FUNCTION pending_items(uid INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM items
    WHERE user_id = uid AND status = "IN_PROGRESS";

    RETURN total;
END$$

DELIMITER ;

SELECT u.id, u.name, pending_items(u.id) AS pending
FROM users u
WHERE u.id IN (5, 11, 22);
