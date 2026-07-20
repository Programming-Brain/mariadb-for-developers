SELECT @@transaction_isolation;

-- only for the next transaction:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- for every transaction in the current session:
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

CREATE OR REPLACE TABLE t(
    id SERIAL PRIMARY KEY,
    c TEXT
);

INSERT INTO t(c) VALUES ("A"), ("B"), ("C");
