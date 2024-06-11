-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category, SUM(o.quantity) AS order_quantity
FROM
    pizza_types pt
        JOIN
    pizzas p
        JOIN
    orders_details o ON pt.pizza_type_id = p.pizza_type_id
        AND p.pizza_id = o.pizza_id
GROUP BY pt.category;