{{ config (
            materialized='view'
        )
}}

WITH source_departments AS (

    SELECT * FROM {{ source('av_step3_data', 'departments') }}

),

final AS (

    SELECT 
        dept_no,
        dept_name
    FROM source_departments

)

SELECT * FROM final