/*STEP3 : DATE EXPLORATION*/

/*Identifying the earliest dates and latest dates(boundaries)
 Understood the scope of data and the timespan*/
 select 
 start_date,
 shipping_date,
 due_date
 from gold.dim_products as p
 left join gold.fact_sales as f
 on p.product_key=f.product_key

 /*Find the date of first and last order*/
 /*Also find sales duration*/
 select min(order_date) as first_order,
 max(order_date) as last_order,
 datediff(year,min(order_date),max(order_date)) as TotalSalesDuration
 from gold.fact_sales

/*Find youngest and oldest customer*/
select
min(datediff(year,birthdate,getdate())) as youngest_customer,
max(datediff(year,birthdate,getdate())) as oldest_customer
from gold.dim_customers