-- Analyze the cumulative revenue generated over time.

select o.order_date, round(sum(p.price*od.quantity),2) as revenue,
round(SUM(sum(p.price*od.quantity)) OVER (ORDER BY o.order_date),2) AS CumulativeRevenue
from orders o
join pizzas p
join orders_details od
on o.order_id = od.order_id
and p.pizza_id = od.pizza_id
group by o.order_date;