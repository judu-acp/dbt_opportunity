   SELECT 
            id                                                                  AS dim_acc_manager_id,
            account_id                                                          AS dim_acc_id,
            first_name                                                          AS manager_first_name,
            last_name                                                           AS manager_last_name,
            name                                                                AS manager_name
    FROM analytics.amplify_salesforce.user