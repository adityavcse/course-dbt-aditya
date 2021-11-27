{{
    config(
        materialized='table'
    )
}}

with prd as (

select 
product_id,
product_name,
product_price ,
product_quantity
FROM
{{ref ("stg_products")}}
)

SELECT * from prd