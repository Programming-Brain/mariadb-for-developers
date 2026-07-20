-- this is only an example and doesn't work with our setup
XA START 'txn1';

UPDATE prizes SET quantity = quantity - 1 WHERE id = 8;

XA END 'txn1';
XA PREPARE 'txn1';
XA COMMIT 'txn1';
