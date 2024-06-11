-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name, SUM(o.quantity) AS order_quantity
FROM
    pizza_types pt
        JOIN
    pizzas p
        JOIN
    orders_details o ON pt.pizza_type_id = p.pizza_type_id
        AND p.pizza_id = o.pizza_id
GROUP BY pt.name
ORDER BY order_quantity DESC
LIMIT 5;