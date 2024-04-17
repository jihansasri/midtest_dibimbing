CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought

SELECT item
FROM (
    SELECT item, COUNT(*) AS num_items
    FROM item_bought
    GROUP BY item
    ORDER BY num_items
) AS item_counts
WHERE num_items != (SELECT MAX(num_items) FROM (SELECT COUNT(*) AS num_items FROM item_bought GROUP BY item) AS max_count)
  AND num_items != (SELECT MIN(num_items) FROM (SELECT COUNT(*) AS num_items FROM item_bought GROUP BY item) AS min_count);
