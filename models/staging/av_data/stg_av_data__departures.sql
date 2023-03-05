{{ config (
            materialized='view'
        )
}}

WITH source_departures AS (

    SELECT * FROM {{ source('av_step3_data', 'departures') }}
    
),

final AS (

    SELECT
        emp_no,
        {{ parse_date('exit_date') }} AS exit_date,
        exit_reason
    FROM source_departures
    WHERE employee_id IS NOT NULL -- removing NULL values in emp_no column 

)

SELECT * FROM final