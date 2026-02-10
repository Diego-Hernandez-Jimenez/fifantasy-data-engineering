{%- set all_positions = dbt_utils.get_column_values(
    table = ref("stg_sofifa__all_positions"), 
    column = "club_position",
    ) 
-%}


SELECT
    player_id,
    {% for position in all_positions -%}
    CASE
        WHEN list_contains(available_positions, '{{ position }}') 
        THEN 1
        ELSE 0
    END AS pos_{{ position | lower }}{% if not loop.last %},{% endif %}
    {% endfor -%}
    
FROM {{ ref("int_sofifa__positions") }}