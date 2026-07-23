-- Tune histogram granularity for highly skewed tables
SET histogram_size = 100;

-- Collect statistics
ANALYZE TABLE items;
