{{
    config(
        materialized='table'
    )
}}


with order_summary as (
select 
order_id,
user_id,
case when promo_id is not null then 1 else 0 end as promo_order,
case when order_status='pending' then 1 else 0 end as pending_orders_count,
case when order_status='shipped' then 1 else 0 end as shipped_orders_count,
case when order_status='delivered' then 1 else 0 end as delivered_orders_count,
case when order_status='preparing' then 1 else 0 end as preparing_orders_count,
case when delivered_at_utc<estimated_delivery_at_utc then 1 else 0 end as early_delivery,
case when delivered_at_utc=estimated_delivery_at_utc then 1 else 0 end as ontime_delivery,
case when delivered_at_utc>estimated_delivery_at_utc then 1 else 0 end as late_delivery,
order_cost,
shipping_cost,
order_total,
created_at_utc 
from 
{{ref ("stg_orders")}}
)

select * from order_summary