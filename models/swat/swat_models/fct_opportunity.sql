WITH source AS (
    
    SELECT * FROM {{ ref('prep_opportunity')}}

), consultant AS (
    
    SELECT * FROM {{ ref('dim_consultant')}}

), account AS (
    
    SELECT * FROM {{ ref('dim_account')}}
    
), date AS (

    SELECT * FROM {{ ref('dim_date')}}

), account_manager AS (

    SELECT * FROM {{ ref('dim_account_manager')}}

), final AS (

    SELECT 
        source.opp_id,
        account.dim_acc_id,
        account_manager.dim_acc_manager_id,
        date.dim_date_id,
        source.close_date_id,
        coalesce(revenue, 0)                                        AS revenue

    FROM source
        LEFT JOIN date 
            ON date.dim_date_id = source.close_date_id
        LEFT JOIN account 
            ON account.dim_acc_id = source.dim_acc_id
        LEFT JOIN account_manager 
            ON account_manager.dim_acc_manager_id = source.dim_acc_manager_id
)

SELECT * FROM final