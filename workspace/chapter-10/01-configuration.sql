SELECT @@innodb_buffer_pool_size / 1024 / 1024 AS size_MB;

SHOW GLOBAL STATUS LIKE 'Max_used_connections';

SHOW GLOBAL STATUS LIKE 'Innodb_buffer_pool_read%';
