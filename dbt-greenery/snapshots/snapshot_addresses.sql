{% snapshot snapshot_addresses %}

  {{
    config(
      target_schema='snapshots',
      strategy='check',
      unique_key='address_id',
      check_cols=['address','zipcode','state','country']
    )
  }}

  SELECT * 
  FROM {{ source('greenery', 'addresses') }}

{% endsnapshot %}