# Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(p.price * o.quantity), 2) AS revenue
FROM
    pizzas p
        LEFT JOIN
    orders_details o ON p.pizza_id = o.pizza_id;