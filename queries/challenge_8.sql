-- A query that displays the first ten orders where the total price is more than the price of the most expensive product in the database.

-- The columns should be order_id and total_price only.

-- total_price should be displayed as an integer.

-- Results should be ordered by descending order_id

-- When calculating the order price, ignore any discounts and use the warehouse-standard price for the products only

WITH max_product_price AS (
    SELECT MAX(unit_price) AS max_price
    FROM products
),

order_totals AS (
    SELECT
        order_id,
        SUM(unit_price * quantity) AS total_price
    FROM order_details
    GROUP BY order_id
)

SELECT
    ot.order_id,
    ROUND(ot.total_price) AS total_price
FROM order_totals ot
JOIN max_product_price m
WHERE ot.total_price > m.max_price
ORDER BY ot.order_id DESC
LIMIT 10;