WITH source AS (

    SELECT * FROM {{ ref('prep_opportunity')}}

), final AS (

    SELECT 
        opp_id                                                                      AS dim_opp_id,
        acc_id                                                                      AS dim_acc_id,
        acc_manager_id                                                              AS dim_acc_manager_id,
        close_date_id,
        opp_name,
        opp_close_date,
        stage,
        pillar,
        revenue_type,
        forecast_category

    FROM source
)

SELECT * FROM final





   