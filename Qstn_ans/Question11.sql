-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.category,
    ROUND((SUM(od.quantity * p.price) / (SELECT 
                    SUM(p.price * o.quantity) AS total_revenue
                FROM
                    pizzas p
                        LEFT JOIN
                    orders_details o ON p.pizza_id = o.pizza_id)) * 100,
            2) AS revenue_percentage
FROM
    pizza_types pt
        JOIN
    pizzas p
        JOIN
    orders_details od ON pt.pizza_type_id = p.pizza_type_id
        AND p.pizza_id = od.pizza_id
GROUP BY pt.category;