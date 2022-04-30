WITH source AS (

    SELECT * FROM {{ ref('prep_date')}}

), final AS (


    SELECT
        date_id                                                         AS dim_date_id,
        date_day,
        day_name,
        day_of_year                                                     AS day,
        month_actual                                                    AS month,
        year_actual                                                     AS year

    FROM source
        
)

SELECT * FROM final