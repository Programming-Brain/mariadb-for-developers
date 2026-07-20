SELECT t.name AS tag_name, count(i.id) AS items_per_tag
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
GROUP BY t.name;

SELECT t.name AS tag_name, count(i.id) AS items_per_tag,
    ROW_NUMBER() OVER() AS number
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
GROUP BY t.name
ORDER BY items_per_tag DESC;

SELECT t.name AS tag_name, count(i.id) AS items_per_tag,
    ROW_NUMBER() OVER(ORDER BY items_per_tag DESC) AS number
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
GROUP BY t.name;

SELECT t.name AS tag_name, count(i.id) AS items_per_tag,
    RANK() OVER(ORDER BY items_per_tag DESC) AS rank
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
GROUP BY t.name;

SELECT t.name AS tag_name, count(i.id) AS items_per_tag,
    DENSE_RANK() OVER(ORDER BY items_per_tag DESC) AS rank
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
GROUP BY t.name;

SELECT t.name AS tag_name, p.name AS project,
    count(i.id) AS items_per_tag,
    ROW_NUMBER() OVER(
        PARTITION BY t.name ORDER BY items_per_tag DESC
    ) AS rank
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
JOIN projects p ON p.id = i.project_id
GROUP BY t.name, p.name;

SELECT t.name AS tag_name, p.name AS project,
    count(i.id) AS items_per_tag,
    ROW_NUMBER() OVER(
        PARTITION BY t.name ORDER BY items_per_tag DESC
    ) AS rank
FROM tags t
JOIN items_tags it ON it.tag_id = t.id
JOIN items i ON i.id = it.item_id
JOIN projects p ON p.id = i.project_id
GROUP BY t.name, p.name
ORDER BY t.name, rank;
