DELIMITER $$

CREATE OR REPLACE TRIGGER items_set_completed
BEFORE UPDATE ON items
FOR EACH ROW
BEGIN
    IF NEW.status = "DONE" AND OLD.status <> "DONE" THEN
        SET NEW.completed_at = NOW();
    END IF;
END$$

DELIMITER ;

UPDATE items SET status = "DONE" WHERE id = 3;
SELECT id, status, completed_at FROM items WHERE id = 3;

DELIMITER $$

CREATE OR REPLACE TRIGGER winners_check_prize
BEFORE INSERT ON winners
FOR EACH ROW
BEGIN
    DECLARE available INT;

    SELECT quantity INTO available
    FROM prizes
    WHERE id = NEW.prize_id;

    IF available < 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot award a prize with no units left';
    END IF;
END$$

DELIMITER ;

UPDATE prizes SET quantity = 0 WHERE id = 17;
INSERT INTO winners(user_id, prize_id, awarded_date)
VALUES (5, 17, CURDATE()); -- error 1644
