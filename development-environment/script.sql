DELETE FROM mysql.user
WHERE user = 'root'
	AND host NOT IN ('localhost', '127.0.0.1', '::1');
