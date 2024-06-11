-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name, SUM(p.price * od.quantity) AS revenue
FROM
    pizza_types pt
        JOIN
    pizzas p
        JOIN
    orders_details od ON pt.pizza_type_id = p.pizza_type_id
        AND p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;