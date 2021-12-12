{{
  config(
    materialized='table'
  )
}}


select 
session_id,
count(*) as num_events_in_session,
sum(case when  event_type='page_view' then 1 else 0 end) as page_views,
sum(case when  event_type='add_to_cart' then 1 else 0 end) as add_to_carts,
sum(case when event_type='checkout' then 1 else 0 end) as checkouts,
sum(case when event_type='package_shipped' then 1 else 0 end) as packages_shipped,
sum(case when event_type='account_created' then 1 else 0 end) as account_created,
sum(case when event_type='delete_from_cart' then 1 else 0 end) as deletes_from_cart
from {{ref ('stg_events')}}
group by 1