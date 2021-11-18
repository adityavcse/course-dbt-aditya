{{
    config(
        materialized='table'
    )
}}

SELECT
promo_id,
discout as discount,
status as promo_status
FROM {{ source('greenery', 'promos') }}