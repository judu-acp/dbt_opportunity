WITH source AS (

    SELECT * FROM {{ ref('prep_account')}}

), final AS (

    SELECT 
        acc_id                                                  AS dim_acc_id,
        parent_acc_id,
        acc_name,
        billing_street,
        billing_city,
        billing_postal_code,
        billing_country,
        billing_state
    FROM source

)

SELECT * FROM final