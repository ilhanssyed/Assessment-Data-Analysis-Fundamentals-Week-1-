-- A query that displays the name of the third most expensive product(s) for each category.

-- The columns should be category_name, product_name.

-- Results should be sorted alphabetically by category.

WITH ranked_products AS (
    SELECT
        c.category_name,
        p.product_name,
        p.unit_price,
        RANK() OVER (
            PARTITION BY c.category_id
            ORDER BY p.unit_price DESC
        ) AS price_rank
    FROM products p
    JOIN categories c
        ON p.category_id = c.category_id
)

SELECT
    category_name,
    product_name
FROM ranked_products
WHERE price_rank = 3
ORDER BY category_name;