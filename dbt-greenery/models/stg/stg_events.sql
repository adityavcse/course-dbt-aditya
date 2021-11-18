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
created_at as created_at_utc
FROM
{{ source('greenery', 'events') }}