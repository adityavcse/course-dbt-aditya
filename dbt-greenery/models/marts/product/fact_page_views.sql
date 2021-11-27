{{
    config(
        materialized='table'
    )
}}


with page_views as ( 
select 
event_id,
session_id,
user_id,
created_at_utc,
page_url
FROM
{{ref ('stg_events')}}
WHERE
event_type='page_view'

)

select * from page_views