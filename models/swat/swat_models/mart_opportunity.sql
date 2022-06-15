WITH source AS (
    
    SELECT * FROM {{ ref('fct_opportunity')}}

), consultant AS (
    
    SELECT * FROM {{ ref('dim_consultant')}}

), opportunity AS (

    SELECT * FROM {{ ref('prep_opportunity')}}

), account AS (
    
    SELECT * FROM {{ ref('dim_account')}}
    
), date AS (

    SELECT * FROM {{ ref('dim_date')}}

), account_manager AS (

    SELECT * FROM {{ ref('dim_account_manager')}}

), final AS (

    SELECT 
        source.revenue,
        opportunity.opp_name,
        opportunity.stage,
        opportunity.pillar,
        opportunity.forecast_category,
        account.acc_name,
        account.billing_state,
        account_manager.manager_name,
        --consultant.consultant_name,
        --consultant.bill_rate,
        --consultant.consultant_status,
        --consultant.available_date,
        --consultant.utilization_pct,
        date.date_day


    FROM source
        LEFT JOIN opportunity 
            ON opportunity.opp_id = source.opp_id
        LEFT JOIN date 
            ON date.dim_date_id = source.dim_date_id
        LEFT JOIN account 
            ON account.dim_acc_id = source.dim_acc_id
        LEFT JOIN account_manager 
            ON account_manager.dim_acc_manager_id = source.dim_acc_manager_id
)

SELECT * FROM final

