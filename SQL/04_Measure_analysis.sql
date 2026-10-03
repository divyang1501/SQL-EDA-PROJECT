/*MEASURE EXPLORATION*/

/*Calculate the key metric of the business(BIG NUMBERS)
 Highest level of Aggregation | Lowest level of details*/
 
--Find the Total Sales
select
sum(sales_amount)as Total_sales
from gold.fact_sales

--Find how many items are sold
select
sum(quantity) as total_items
from gold.fact_sales

--Find avg selling price
select
avg(price) as avg_price
from gold.fact_sales

--FInd the total number of Orders
select
count(distinct order_number) as total_orders 
/*Here always use distinct keyword because there may be multiple product within same order*/
from gold.fact_sales

--Find the total number of products
select
count(distinct(product_key)) as total_products
from gold.dim_products

--Find the total number of customers
select
count(distinct(customer_key)) as total_customers
from gold.dim_customers

--find the total number of customers that has placed an order
select
count(distinct(customer_key)) as total_customers
from gold.fact_sales

/*Generate a Report that shows all key metric of the business*/
/*we can do this by generating a static coloumn before each query */

select 'Total_sales' as measure_name,
sum(sales_amount) as measure_value from gold.fact_sales
UNION ALL 
select 'Total_items'as measure_name,
sum(quantity) as measure_value from gold.fact_sales
UNION ALL
select 'Avg_price' as measure_name,
avg(price) as measure_value from gold.fact_sales
UNION ALL
select 'Total_orders' as measure_name,
count(distinct order_number) as measure_value 
from gold.fact_sales
UNION ALL
select 'total_products' as measure_name,
count(distinct(product_key)) as measure_value
from gold.dim_products
UNION ALL
select 'total_customers' as measure_name,
count(distinct(customer_key)) as measure_value
from gold.dim_customers
UNION ALL
select 'Customer_Placed' as measure_name,
count(distinct(customer_key)) as measure_value
from gold.fact_sales