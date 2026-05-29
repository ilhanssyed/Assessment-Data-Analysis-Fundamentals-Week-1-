-- A query that creates or replaces a VIEW, customer_summary, containing an overview of all customers with more than 15 orders

-- The view should have columns company, city, and total_orders only

-- Rows should be sorted in ascending order by the date of the customer's earliest order

CREATE OR REPLACE VIEW customer_summary AS
SELECT
    c.company_name AS company,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name, c.city, c.customer_id
HAVING COUNT(o.order_id) > 15
ORDER BY MIN(o.order_date);