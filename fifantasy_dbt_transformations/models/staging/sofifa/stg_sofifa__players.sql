SELECT *
FROM read_csv(
    {{ source("sofifa", "fc_players_source") }},
    header = true,
    types = {'value_eur': 'FLOAT', 'wage_eur': 'FLOAT'}
)
