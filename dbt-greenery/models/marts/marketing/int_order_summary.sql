{{
    config(
        materialized='table'
    )
}}

{%
set order_status_type=
    dbt_utils.get_column_values(
      table=ref('stg_orders'),
      column='order_status'
    )
%}


with order_summary as (
select 
order_id,
user_id,
case when promo_id is not null then 1 else 0 end as promo_order
{% for order_status  in order_status_type %}
,case when order_status= '{{order_status}}' then 1 else 0 end  as {{order_status}}_orders_count
{% endfor %}
,case when delivered_at_utc<estimated_delivery_at_utc then 1 else 0 end as early_delivery,
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