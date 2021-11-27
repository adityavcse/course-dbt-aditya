{{
    config(
        materialized='table'
    )
}}

with users as (
select 
user_id,
first_name,
last_name,
email,
phone_number,
created_at_utc,
updated_at_utc,
address_id
 from {{ref ("stg_users")}}
),

addr as (
    select 
    address_id,
    address,
    zipcode,
    state,
    country from {{ref ("stg_addresses")}}
)

select * from users

/*select 
a.user_id,
a.first_name,
a.last_name,
a.email,
a.phone_number,
a.created_at_utc,
a.updated_at_utc,
a.address_id,
b.address,
b.zipcode,
b.state,
b.country from users a JOIN addr b using(address_id)
*/