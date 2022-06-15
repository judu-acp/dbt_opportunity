WITH source AS (

    SELECT * FROM {{ ref('prep_consultant')}}

), final AS (

    SELECT 
        consultant_id                                                           AS dim_consultant_id,
        opp_id,
        consultant_name,
        bill_rate,
        consultant_status,
        available_date,
        utilization_pct
    FROM source

)


SELECT * FROM final
