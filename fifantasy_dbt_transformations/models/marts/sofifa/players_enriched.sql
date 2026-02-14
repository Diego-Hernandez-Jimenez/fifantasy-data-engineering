WITH full_positions AS (
    SELECT *
    FROM {{ ref("int_sofifa__positions") }}
    INNER JOIN {{ ref("int_sofifa__dummy_positions") }}
        USING (player_id)
),
subset_players AS (
    SELECT
        player_id,
        short_name,
        club_team_id,
        value_eur,
        value_eur / 1000000 AS value_m_eur,
        wage_eur,
        age,
        league_name,
        nationality,
        international_reputation,
        potential,
        pace,
        shooting,
        passing,
        dribbling,
        defending,
        physic,
        player_face_url
    FROM {{ ref("stg_sofifa__players") }}
)

SELECT
   *
FROM subset_players AS base
INNER JOIN full_positions AS full_pos
    USING (player_id)
INNER JOIN {{ ref("int_sofifa__agg_scores") }} AS agg_scores
    USING (player_id)
