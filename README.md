## Data engineering pipeline for FIFAntasy11 webapp

- [x] ingestion
- [ ] dbt transformations
    - [ ] staging
    - [ ] intermediate
        - [ ] averaged skills
        - [x] player positions as binary columns
        - [ ] other features needed for the optimization models
    - [ ] marts: joined data with features
    - [ ] tests
    - [ ] macros (they may not be necessary)
    - [ ] docs
- [ ] orchestration (light): ingestion -> transformations
- [ ] job to push output database to webapp repo: github actions workflow?