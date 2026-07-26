-- execute the statements in this file with the root user

CREATE USER 'backup'@'localhost'
IDENTIFIED BY 'backup-account-password';

GRANT RELOAD, PROCESS, LOCK TABLES, BINLOG MONITOR
ON *.*
TO 'backup'@'localhost';
