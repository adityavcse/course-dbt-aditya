{{
    config(
        materialized='table'
    )
}}

SELECT
product_id,
name as product_name,
price as product_price,
quantity as product_quantity
FROM
{{ source('greenery', 'products') }}