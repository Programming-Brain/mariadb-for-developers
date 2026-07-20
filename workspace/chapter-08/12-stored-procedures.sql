DELIMITER $$

CREATE OR REPLACE PROCEDURE grant_prize(
    IN p_user_id INT,
    IN p_prize_id INT
)
BEGIN
    DECLARE available INT;

    START TRANSACTION;

    SELECT quantity INTO available
    FROM prizes
    WHERE id = p_prize_id
    FOR UPDATE;

    IF available < 1 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No units of this prize are left';
    END IF;

    UPDATE prizes SET quantity = quantity - 1
    WHERE id = p_prize_id;

    INSERT INTO winners(user_id, prize_id, awarded_date)
    VALUES (p_user_id, p_prize_id, CURDATE());

    COMMIT;
END$$

DELIMITER ;

CALL grant_prize(5, 8);
SELECT quantity FROM prizes WHERE id = 8;