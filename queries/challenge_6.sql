-- A query that displays the average product price (average_price) for each category from each supplier when the category name contains the letter 'm' (case-insensitive).

-- The columns should be supplier, category, average_price.

-- average_price should be an integer.

-- Results should be sorted alphabetically by supplier and category.


WITH avg_prices AS (
    SELECT
        s.company_name AS supplier,
        c.category_name AS category,
        AVG(p.unit_price) AS average_price
    FROM products p
    JOIN suppliers s
        USING (supplier_id)
    JOIN categories c
       USING (category_id)
    WHERE c.category_name ILIKE '%m%'
    GROUP BY s.company_name, c.category_name
)

SELECT
    supplier,
    category,
    average_price::INTEGER
FROM avg_prices
ORDER BY supplier, category;