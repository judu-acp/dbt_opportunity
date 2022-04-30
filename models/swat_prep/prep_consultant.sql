SELECT 
        id                                                                      AS consultant_id,
        opportunity_c                                                           AS opp_id,
        name                                                                    AS consultant_name,
        current_bill_rate_c                                                     AS bill_rate,
        current_status_c                                                        AS consultant_status,
        availability_date_c                                                     AS available_date,
        utilization_percentage_c                                                AS utilization_pct
    FROM analytics.amplify_salesforce.consultant_c