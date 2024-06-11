-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, category, revenue from
(select pt.name, pt.category, sum(p.price*od.quantity) as revenue,
rank() over(partition by pt.category order by revenue desc) as rn
from pizza_types pt
join pizzas p
join orders_details od
on pt.pizza_type_id = p.pizza_type_id
and p.pizza_id = od.pizza_id
group by pt.category, pt.name) as a
where rn<=3;