WITH source AS (
    
    SELECT * FROM {{ ref('prep_opportunity')}}

), consultant AS (
    
    SELECT * FROM {{ ref('dim_consultant')}}

), opportunity AS (

    SELECT * FROM {{ ref('dim_opportunity')}}

), account AS (
    
    SELECT * FROM {{ ref('dim_account')}}
    
), date AS (

    SELECT * FROM {{ ref('dim_date')}}

), account_manager AS (

    SELECT * FROM {{ ref('dim_account_manager')}}

), final AS (

    SELECT 
        opportunity.dim_opp_id,
        account.dim_acc_id,
        account_manager.dim_acc_manager_id,
        date.dim_date_id,
        opportunity.close_date_id,
        dim_consultant_id,
        coalesce(revenue, 0)                                        AS revenue

    FROM opportunity
        LEFT JOIN consultant 
            ON consultant.dim_opp_id = opportunity.dim_opp_id
        LEFT JOIN source 
            ON source.opp_id = opportunity.dim_opp_id
        LEFT JOIN date 
            ON date.dim_date_id = opportunity.close_date_id
        LEFT JOIN account 
            ON account.dim_acc_id = opportunity.dim_acc_id
        LEFT JOIN account_manager 
            ON account_manager.dim_acc_manager_id = opportunity.dim_acc_manager_id
)

SELECT * FROM final