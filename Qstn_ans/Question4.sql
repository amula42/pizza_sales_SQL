-- Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(order_details_id) AS order_count
FROM
    pizzas p
        LEFT JOIN
    orders_details o ON p.pizza_id = o.pizza_id
GROUP BY p.size
ORDER BY order_count DESC
LIMIT 1;