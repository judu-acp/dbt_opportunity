WITH source AS (
    
    SELECT * FROM {{ ref('prep_account_manager')}}

), final AS (

    SELECT
            acc_manager_id                                                      AS dim_acc_manager_id,
            acc_id                                                              AS dim_acc_id,
            manager_first_name,
            manager_last_name,
            manager_name        
            
    FROM source
)

SELECT * FROM final