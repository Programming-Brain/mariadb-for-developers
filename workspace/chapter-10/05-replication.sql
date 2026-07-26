-- execute the statements in this file with the root user

CREATE USER 'repl'@'10.0.0.%'
IDENTIFIED BY 'replication-account-password';

GRANT REPLICATION REPLICA ON *.* TO 'repl'@'10.0.0.%';

SET GLOBAL gtid_slave_pos = '0-1-6677';

CHANGE MASTER TO
	MASTER_HOST = '10.0.0.10',
	MASTER_PORT=3306,
	MASTER_USER = 'repl',
	MASTER_PASSWORD = 'replication-account-password',
	MASTER_USE_GTID = slave_pos;

START REPLICA;

SHOW REPLICA STATUS\G

INSERT INTO tags(name) VALUES ('replicated');

SELECT * FROM tags WHERE name = 'replicated';

SET GLOBAL rpl_semi_sync_master_enabled = ON;

SET GLOBAL rpl_semi_sync_slave_enabled = ON;
STOP REPLICA IO_THREAD;
START REPLICA IO_THREAD;

STOP REPLICA;
RESET REPLICA ALL;
SET GLOBAL read_only = OFF;

STOP REPLICA;
CHANGE MASTER TO MASTER_DELAY = 3600;
START REPLICA;

