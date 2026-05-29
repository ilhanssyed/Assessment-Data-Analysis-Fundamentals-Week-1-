-- A query that displays the percentage of orders that had *any* discount applied.

-- The only column should be 'percentage_discounted'

SELECT
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN discount > 0 THEN order_id END)
        / COUNT(DISTINCT order_id),
        2
    ) AS percentage_discounted
FROM order_details;
-- The percentage should be rounded to 2 d.p.

