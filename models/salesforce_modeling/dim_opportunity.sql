{{ config(
    materialized = "table"
) }}

SELECT 
        id                                                                      AS dim_opp_id,
        name                                                                    AS opp_name,
        account_id                                                              AS dim_acc_id,
        owner_id,
        close_date                                                              AS opp_close_date,
        stage_name                                                              AS stage,
        pillar_c                                                                AS pillar,
        revenue_type_c                                                          AS revenue_type,
        forecast_category
        
    FROM analytics.amplify_salesforce.opportunity