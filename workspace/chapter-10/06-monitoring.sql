SHOW GLOBAL STATUS;

SHOW GLOBAL STATUS
WHERE Variable_name IN
    ('Threads_connected', 'Threads_running', 'Slow_queries');

SHOW GLOBAL STATUS
WHERE Variable_name IN(
    'Innodb_buffer_pool_reads',
    'Innodb_buffer_pool_read_requests');

SHOW GLOBAL STATUS
WHERE Variable_name IN(
    'Aborted_connects',
    'Created_tmp_disk_tables');

SHOW GLOBAL STATUS
WHERE Variable_name IN(
    'Innodb_row_lock_waits',
    'Innodb_row_lock_time_avg');

SELECT table_name,
       ROUND((data_length + index_length) / 1024 / 1024, 1) AS total_mb,
       ROUND(index_length / 1024 / 1024, 1) AS index_mb,
       table_rows
FROM information_schema.TABLES
WHERE table_schema = 'todo'
ORDER BY data_length + index_length DESC;

SHOW FULL PROCESSLIST\G
