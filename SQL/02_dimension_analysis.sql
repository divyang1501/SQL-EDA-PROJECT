 /*Dimensions Exploration*/

 /*Find all unique values*/
 select distinct country
 from gold.dim_customers

 /*INSIGHT 1: customers are from 6 distinct countries*/

 select distinct
 category,subcategory ,product_name
 from gold.dim_products
 order by 1, 2,3
/*Therefore we get to know more details about product*/
