SELECT SLEEP(10); -- seconds

-- run with root user
SELECT
    SCHEMA_NAME,
    DIGEST_TEXT AS query,
    COUNT_STAR AS execution_count,
    SUM_TIMER_WAIT / 1000000000000 AS total_seconds,
    AVG_TIMER_WAIT / 1000000000000 AS average_seconds
FROM performance_schema.events_statements_summary_by_digest
WHERE DIGEST_TEXT IS NOT NULL
ORDER BY SUM_TIMER_WAIT DESC
LIMIT 3\G
