WITH opportunity AS (

    SELECT * FROM {{ ref('prep_opportunity') }}
)

SELECT 
    opp_id,
    SUM(revenue)                                                    AS total_revenue

FROM opportunity
GROUP BY 1
HAVING total_revenue < 0