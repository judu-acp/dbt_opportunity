SELECT 
    id                                                                      AS opp_id,
    name                                                                    AS opp_name,
    account_id                                                              AS acc_id,
    owner_id                                                                AS acc_manager_id,
    to_char(close_date, 'YYYYMMDD')::int                                    AS close_date_id,
    close_date                                                              AS opp_close_date,
    amount                                                                  AS revenue,
    stage_name                                                              AS stage,
    pillar_c                                                                AS pillar,
    revenue_type_c                                                          AS revenue_type,
    forecast_category
        
FROM {{ source('swat_usage', 'opportunity')}}
