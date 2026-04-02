{% macro tag(col) %}
    CASE
        WHEN {{col}} < 100 THEN 'cheap'
        WHEN {{col}} < 200 THEN 'average'
        ELSE 'expensive'
    END
{% endmacro%}