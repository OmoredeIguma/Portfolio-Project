WITH sales_team_dim AS (
    SELECT
        Team_ID,
        Team_Name
    FROM {{ ref('stg_eCom__Sales_team') }}
)
SELECT * FROM sales_team_dim