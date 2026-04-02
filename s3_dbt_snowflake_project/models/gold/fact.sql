{% set configs = [
    {
        "table": "AIRBNB.GOLD.OBT",
        "Columns": "GOLD_OBT.BOOKING_ID, GOLD_OBT.LISTING_ID, GOLD_OBT.HOST_ID, GOLD_OBT.TOTAL_AMOUNT, GOLD_OBT.SERVICE_FEE, GOLD_OBT.CLEANING_FEE, GOLD_OBT.PRICE_PER_NIGHT, GOLD_OBT.ACCOMMODATES,
        GOLD_OBT.BEDROOMS, GOLD_OBT.BATHROOMS, GOLD_OBT.RESPONSE_RATE",
        "alias": "GOLD_OBT"
    },
    {
        "table": "AIRBNB.GOLD.DIM_LISTINGS",
        "Columns": "",
        "alias": "DIM_LISTINGS",
        "join_condition": "GOLD_OBT.LISTING_ID = DIM_LISTINGS.LISTING_ID"
    },
    {
        "table": "AIRBNB.GOLD.DIM_HOSTS",
        "Columns": "",
        "alias": "DIM_HOSTS",
        "join_condition": "GOLD_OBT.HOST_ID = DIM_HOSTS.HOST_ID"
    }

]
%}

SELECT 
        {{configs[0]['Columns']}}
FROM
    {% for config in configs %}
    {%if loop.first%}
        {{config['table']}} as {{config['alias']}}
    {%else%}
        LEFT JOIN {{config['table']}} as {{config['alias']}} ON {{config['join_condition']}}
    {%endif%}
    {%endfor%}