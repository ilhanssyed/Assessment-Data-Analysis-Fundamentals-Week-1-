-- A query that displays the number of orders that involved 2 or more products

-- The column should be called count_of_multiple_orders


SELECT count(*) AS count_of_multiple_orders

FROM (
    SELECT order_id FROM order_details
    GROUP BY order_id 
    HAVING COUNT(product_id) >= 2
)

