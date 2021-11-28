{{
    config(
        materialized='table',
        schema = 'marketing'
    )
}}

with users as (

select * from {{ref ("stg_users")}}

),

int_order_summary as (
    select * from {{ref ("int_order_summary")}}
),

account_created as (
    select user_id,min(date(created_at_utc)) as account_created_date
    from {{ref ("stg_events")}} where event_type='account_created'
    group by user_id
)

select 
a.user_id,
count(b.order_id) as total_order_count,
sum(promo_order) as promo_orders_count,
sum(pending_orders_count) as pending_orders_count,
sum(shipped_orders_count) as shipped_orders_count,
sum(delivered_orders_count) as delivered_orders_count,
sum(preparing_orders_count) as preparing_orders_count,
sum(early_delivery) as early_delivery_count,
sum(ontime_delivery) as ontime_delivery_count,
sum(late_delivery) as late_delivery_count,
sum(b.order_cost) as total_order_cost,
sum(b.shipping_cost) as total_shipping_cost,
sum(b.order_total) as order_total,
min(date(b.created_at_utc)) as first_order_date,
min(c.account_created_date ) as account_created_date
from users a LEFT JOIN int_order_summary b ON a.user_id=b.user_id
JOIN account_created c ON a.user_id=c.user_id
group by a.user_id