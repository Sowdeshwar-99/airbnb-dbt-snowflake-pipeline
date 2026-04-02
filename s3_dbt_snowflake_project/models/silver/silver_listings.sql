{{ 
  config(
    materialized = 'incremental',
    unique_key = 'LISTING_ID'
    )
}}

select LISTING_ID, HOST_ID, PROPERTY_TYPE, 
ROOM_TYPE, CITY, COUNTRY, ACCOMMODATES, BEDROOMS, BATHROOMS, PRICE_PER_NIGHT,
{{tag('cast(PRICE_PER_NIGHT AS INT)')}} as PRICE_PER_NIGHT_TAG, CREATED_AT
from {{ref('bronze_listings')}}
