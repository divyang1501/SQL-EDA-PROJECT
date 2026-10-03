/*Exploring database*/
SELECT *
FROM Gold.fact_sales;

SELECT *
FROM Gold.dim_customers;

SELECT *
FROM Gold.dim_products;

/*Identification of Dimension and Measures */
select distinct
category from
Gold.dim_products

/*ALways while analysing identify dimensions and measures*/

/*Now here the col category is a dimension coz we cannot measure or aggregate it*/

select
sales_amount
from gold.fact_sales
/*Since the sales amt can be aggregated it is a measure*/

select
product_name
from gold.dim_products
/*cannot be aggregated so its a dimension*/

select
avg(datediff(year,birthdate,GETDATE())) as Avg_age
from gold.dim_customers
/*Since it can be aggregated its a measure*/

select
customer_id
from gold.dim_customers
/*Since theres no use of aggregating it we consider it as dimension*/
 
 /*DATABASE EXPLORATION USING INFORMATION_SCHEMA*/
 select * from information_schema.tables

 /*To explore all coloumns*/
 select * from information_schema.columns
 where table_name='dim_customers'

