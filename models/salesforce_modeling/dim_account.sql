{{ config(
    materialized = "table"
) }}

SELECT 
        id                                                                      AS dim_acc_id,
        parent_id                                                               AS parent_acc_id,
        name                                                                    AS acc_name
    FROM analytics.amplify_salesforce.account