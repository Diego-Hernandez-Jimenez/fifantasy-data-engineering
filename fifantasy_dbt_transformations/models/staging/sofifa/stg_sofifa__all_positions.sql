SELECT
    DISTINCT club_position
FROM {{ ref("stg_sofifa__players") }}
WHERE club_position IS NOT NULL