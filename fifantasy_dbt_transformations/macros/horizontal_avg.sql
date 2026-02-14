{% macro horizontal_avg(columns_list, output_column_name) %}
    
{% if columns_list %}
(
    {% for col in columns_list %}
    COALESCE({{ col }}, 0){% if not loop.last %} + {% endif %}
    {% endfor %}
) / {{ columns_list | length }} AS  {{ output_column_name }}
{% else %}
NULL AS {{ output_column_name }}
{% endif %}

{% endmacro %}