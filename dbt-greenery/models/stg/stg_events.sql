{{
    config(
        materialized='table'
    )
}}

SELECT
event_id,
session_id,
user_id,
event_type,
page_url,
split_part(page_url,'/',5) as product_id,
created_at as created_at_utc
FROM
{{ source('greenery', 'events') }}