WITH source AS (
    
    SELECT * FROM {{ ref('prep_opportunity')}}

), consultant AS (
    
    SELECT * FROM {{ ref('dim_consultant')}}

), opportunity AS (

    SELECT * FROM {{ ref('dim_opportunity')}}

), date AS (

    SELECT * FROM {{ ref('dim_date')}}

), final AS (

    SELECT 
        opportunity.dim_opp_id,
        opportunity.dim_acc_id,
        opportunity.dim_acc_manager_id,
        date.dim_date_id,
        opportunity.close_date_id,
        dim_consultant_id,
        coalesce(revenue, 0)                                        AS revenue

    FROM opportunity
        LEFT JOIN consultant ON consultant.dim_opp_id = opportunity.dim_opp_id
        LEFT JOIN source ON source.opp_id = opportunity.dim_opp_id
        LEFT JOIN date ON date.dim_date_id = opportunity.close_date_id
)

SELECT * FROM final