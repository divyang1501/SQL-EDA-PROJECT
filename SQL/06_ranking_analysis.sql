/*Ranking Analysis*/

--Order the values of dimensions by measures
--Top performer and bottom performer
--formula: rank[dimesnion] by agg[measure]

--Which 5 products generate the highest revenue
select top 5
t.product_name,
t.total_sales
from(
select
product_name,
sum(s.quantity) as total_distribution,
sum(s.sales_amount) as total_sales
from gold.fact_sales as s
left join gold.dim_products as p
on s.product_key=p.product_key
group by product_name
)t
order by t.total_sales desc

--What are 5 worst-performing products in terms of sales?
select top 5
t.product_name,
t.total_sales
from(
select
product_name,
sum(s.quantity) as total_distribution,
sum(s.sales_amount) as total_sales
from gold.fact_sales as s
left join gold.dim_products as p
on s.product_key=p.product_key
group by product_name
)t
order by t.total_sales asc

--Use window function and rank product based on their sales
select
p.product_name,
sum(sales_amount) as total_revenue,
rank() over(order by sum(sales_amount) desc) as rank_products
from gold.fact_sales as s
left join gold.dim_products as p
on s.product_key=p.product_key
group by p.product_name

/*FInd top10 customers who have generated highest revenue and 
3 customers with fewest orders placed*/
select
t.customer_key,
t.First_name,
t.last_name,
t.total_revenue
from(
select
c.customer_key,
c.first_name as First_name, 
c.last_name as last_name,
sum(s.sales_amount) as total_revenue,
row_number() over(order by sum(s.sales_amount)desc) as top_performer
from gold.fact_sales as s
left join gold.dim_customers as c
on s.customer_key=c.customer_key
group by c.customer_key,c.first_name,c.last_name
)t 
where t.top_performer<=10

--for top 3 customer with fewest orders
select
t.customer_key,
t.First_name,
t.last_name,
t.total_placed_order
from(
select
c.customer_key,
c.first_name as First_name, 
c.last_name as last_name,
sum(s.quantity) as total_placed_order,
row_number() over(order by sum(s.quantity)asc) as top_performer
from gold.fact_sales as s
left join gold.dim_customers as c
on s.customer_key=c.customer_key
group by c.customer_key,c.first_name,c.last_name
)t 
where t.top_performer<=3
