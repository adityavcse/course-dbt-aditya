{{
    config(
        materialized='table'
    )
}}

with fact_orders as 
(
    SELECT
    order_id,
    promo_id,
    user_id,
    created_at_utc,
    order_cost,
    shipping_cost,
    order_total,
    estimated_delivery_at_utc,
    delivered_at_utc,
    order_status
    FROM
    {{ref ("stg_orders")}}
)

select * from fact_orders