WITH full_positions AS (
    SELECT *
    FROM {{ ref("int_sofifa__positions") }}
    INNER JOIN {{ ref("int_sofifa__dummy_positions") }}
        USING (player_id)
)

SELECT
    base.player_id,
    full_pos.*
FROM {{ ref("stg_sofifa__players") }} AS base
INNER JOIN full_positions AS full_pos
    USING (player_id)
INNER JOIN {{ ref("int_sofifa__agg_scores") }}
    USING (player_id)
