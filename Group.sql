-- Список товарів через кому для кожного виробника
WITH product_list AS (
    SELECT
        g.manufacturer_code,
        GROUP_CONCAT(g.name, ', ') AS products
    FROM goods g
    GROUP BY g.manufacturer_code
)
SELECT
    m.name AS manufacturer,
    p.products
FROM manufacturers m
LEFT JOIN product_list p ON m.code = p.manufacturer_code;


-- Кількість товарів до 20 грн для кожного виробника
WITH cheap_goods AS (
    SELECT
        manufacturer_code,
        COUNT(*) AS cheap_count
    FROM goods
    WHERE price < 20
    GROUP BY manufacturer_code
)
SELECT
    m.name AS manufacturer,
    c.cheap_count
FROM manufacturers m
LEFT JOIN cheap_goods c ON m.code = c.manufacturer_code;


-- Середня ціна товарів
SELECT ROUND(AVG(price), 2) AS average_price FROM goods;


-- Виробники, які мають більше одного товару дешевше 20 грн
WITH cheap_goods_grouped AS (
    SELECT
        manufacturer_code,
        COUNT(*) AS cheap_count
    FROM goods
    WHERE price < 20
    GROUP BY manufacturer_code
)
SELECT
    m.name AS manufacturer,
    c.cheap_count
FROM cheap_goods_grouped c
JOIN manufacturers m ON m.code = c.manufacturer_code
WHERE c.cheap_count > 1;