{{
    config(
        materialized='table'
    )
}}
WITH Total_Product_Revenue_cte AS (
    SELECT *
    FROM  {{ ref('fct_sales') }} sf
)
 SELECT 
        prod.product_name,
        prod.product_id,
        ROUND(SUM((Unit_Price * Order_Quantity) * (1 - Discount_Applied)), 0) AS Total_Product_Revenue
    FROM 
         {{ ref('fct_sales') }} sf
    LEFT JOIN 
         {{ ref('dim_products') }}  AS prod ON prod.product_id = sf.product_id
    LEFT JOIN 
       {{ ref('dim_sales_team') }} st ON st.team_id = sf.team_id
    LEFT JOIN 
         {{ ref('dim_store_location') }} AS sl ON sl.store_id = sf.store_id
    GROUP BY 
        prod.product_name, prod.product_id
    ORDER BY 
        Total_Product_Revenue DESC