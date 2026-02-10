SELECT
    player_id,
    CASE
        WHEN club_position IS NULL OR club_position IN ('RES', 'SUB')
        THEN 
            -- Split by comma and remove duplicates
            list_distinct(string_split(player_positions, ', '))
        ELSE
            -- Concatenate using comma + space, then split string to get list and remove duplicates
            list_distinct(
                string_split(concat_ws(', ', player_positions, club_position), ', ')
            )
    END AS available_positions
FROM {{ ref("stg_sofifa__players") }}