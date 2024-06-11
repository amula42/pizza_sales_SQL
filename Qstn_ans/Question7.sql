-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS per_hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY per_hour
ORDER BY order_count DESC;