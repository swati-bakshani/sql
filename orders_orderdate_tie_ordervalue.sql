--latest 20 orders based on order date.. if there is a tied then as per order VALUES

select order_id, order_date,customer_id,sum(sales) as total_sales
from agoda_orders
group by order_id, order_date,customer_id
order by order_date desc, total_sales desc

--Total values of all retured values, group by category and then sub category.
sort the table by the total values showing the highest salary first.

select ap.category,ap.sub_category,sum(r.sales) as total_returns_sales
from agoda_orders o
inner join returns r on o.order_id = r.order_id
inner join agoda_products ap on ap.product_id = o.product_id
group by ap.category,ap.sub_category
order by total_returns_sales desc