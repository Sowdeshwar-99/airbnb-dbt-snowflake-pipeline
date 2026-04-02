{% macro multiply(a, b, precison) %}
round({{a}}*{{b}}, {{precison}})
{% endmacro %}