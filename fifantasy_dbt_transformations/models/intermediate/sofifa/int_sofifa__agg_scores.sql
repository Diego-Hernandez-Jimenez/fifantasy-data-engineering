-- inspired by https://anyalitica.dev/blog/2025-08-10-column_selection_jinja_dbt#select-columns-based-on-a-set-pattern

-- {% set dimensions = ["attacking", "skill", "movement", "power", "mentality", "defending"] %}

{% set all_columns = dbt_utils.get_filtered_columns_in_relation(from=ref("stg_sofifa__players")) %}
{% set attacking_columns = [] %}
{% set skill_columns = [] %}
{% set movement_columns = [] %}
{% set power_columns = [] %}
{% set mentality_columns = [] %}
{% set defending_columns = [] %}

{% for col in all_columns %}
    {% if col.startswith('attacking_') %}
        {% do attacking_columns.append(col) %}
    {% elif col.startswith('skill_') %}
        {% do skill_columns.append(col) %}
    {% elif col.startswith('movement_') %}
        {% do movement_columns.append(col) %}
    {% elif col.startswith('power_') %}
        {% do power_columns.append(col) %}
    {% elif col.startswith('mentality_') %}
        {% do mentality_columns.append(col) %}
    {% elif col.startswith('defending_') %}
        {% do defending_columns.append(col) %}
    {% endif %}
{% endfor %}

SELECT 
    player_id,
    -- Average all {dimension} columns (only if any exist)
    {{ horizontal_avg(attacking_columns, "attacking_score") }},
    {{ horizontal_avg(skill_columns, "skill_score")  }},
    {{ horizontal_avg(movement_columns, "movement_score") }},
    {{ horizontal_avg(power_columns, "power_score") }},
    {{ horizontal_avg(mentality_columns, "mentality_score") }},
    {{ horizontal_avg(defending_columns, "defending_score") }}

FROM {{ ref("stg_sofifa__players") }}