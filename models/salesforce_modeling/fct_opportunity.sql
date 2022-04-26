{{ config(
    materialized = "table"
) }}

SELECT
    opportunity.id                                                          AS dim_opp_id,
    to_char(close_date, 'YYYYMMDD')::int                                    AS dim_close_date_id,
    account_id                                                              AS dim_acc_id,
    consultant_c.id                                                         AS dim_consultant_id,
    owner_id                                                                AS dim_acc_manager_id,
    amount                                                                  AS revenue
FROM analytics.amplify_salesforce.opportunity
    LEFT JOIN analytics.amplify_salesforce.consultant_c 
        ON dim_opp_id = consultant_c.opportunity_c