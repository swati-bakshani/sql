--latest 20 orders based on order date.. if there is a tied then as per order VALUES

select order_id, order_date,customer_id,sum(sales) as total_sales
from agoda_orders
group by order_id, order_date,customer_id
order by order_date desc, total_sales desc