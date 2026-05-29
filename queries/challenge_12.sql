-- A query that returns details on the difference in price between individual orders (including discount) and the standard warehouse price

-- Products have a standard price, but an additional percentage discount may be applied to the product total

-- The columns should be order_id, expected_price, actual_price, and price_difference

-- Only the top five rows (in descending order of price_difference) should be displayed

-- All values should be rounded to 2 d.p. for display (but otherwise kept at full precision)

SELECT order_id, 
    ROUND(unit_price * quantity) AS expected_price,
    ROUND(unit_price * quantity * (1-discount)) AS actual_price,
    ROUND ( (unit_price * quantity) - (unit_price * quantity * (1-discount))) AS price_difference

From order_details
ORDER BY price_difference DESC LIMIT 5;