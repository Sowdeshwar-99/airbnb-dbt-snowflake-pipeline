{% set configs = [
    {
        "table": "AIRBNB.SILVER.SILVER_BOOKINGS",
        "Columns": "SILVER_bookings.LISTING_ID, SILVER_bookings.BOOKING_ID, SILVER_bookings.BOOKING_DATE, SILVER_bookings.BOOKING_STATUS, SILVER_bookings.TOTAL_AMOUNT, SILVER_bookings.SERVICE_FEE, SILVER_bookings.CLEANING_FEE, SILVER_bookings.CREATED_AT as BOOKING_CREATED_AT",
        "alias": "SILVER_BOOKINGS"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_LISTINGS",
        "Columns": "SILVER_listings.HOST_ID, SILVER_listings.PROPERTY_TYPE, SILVER_listings.ROOM_TYPE, SILVER_listings.CITY, SILVER_listings.COUNTRY, SILVER_listings.ACCOMMODATES, SILVER_listings.BEDROOMS, SILVER_listings.BATHROOMS, SILVER_listings.PRICE_PER_NIGHT, SILVER_listings.PRICE_PER_NIGHT_TAG, SILVER_listings.CREATED_AT as LISTING_CREATED_AT",
        "alias": "SILVER_listings",
        "join_condition": "SILVER_bookings.LISTING_ID = SILVER_listings.LISTING_ID"
    },
    {
        "table": "AIRBNB.SILVER.SILVER_HOSTS",
        "Columns": "SILVER_hosts.HOST_NAME, SILVER_hosts.HOST_SINCE, SILVER_hosts.IS_SUPERHOST, SILVER_hosts.RESPONSE_RATE, SILVER_hosts.RESPONSE_RATE_FREQUENZCY, SILVER_hosts.CREATED_AT as HOST_CREATED_AT",
        "alias": "SILVER_hosts",
        "join_condition": "SILVER_listings.HOST_ID = SILVER_hosts.HOST_ID"
    }

]
%}

SELECT 
    {% for config in configs %}
        {{config['Columns']}}{% if not loop.last %},
        {% endif %}
    {% endfor %}
FROM
    {% for config in configs %}
    {%if loop.first%}
        {{config['table']}} as {{config['alias']}}
    {%else%}
        LEFT JOIN {{config['table']}} as {{config['alias']}} ON {{config['join_condition']}}
    {%endif%}
    {%endfor%}