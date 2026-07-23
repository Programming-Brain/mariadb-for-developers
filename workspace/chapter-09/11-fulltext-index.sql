SELECT id, description 
FROM items 
WHERE description LIKE '%network is down%';

ALTER TABLE items ADD FULLTEXT(description);

SELECT id, description 
FROM items 
WHERE MATCH(description) AGAINST("network down");
