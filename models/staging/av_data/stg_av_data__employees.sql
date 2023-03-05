{{ config (
            materialized='view'
        )
}}

WITH source_employees AS (

    SELECT * FROM {{ source('av_step3_data', 'employees') }}
),

final AS (

    SELECT 
            emp_no,
            first_name,
            last_name,
            sex,
            {{ parse_date('birth_date') }} AS birth_date,
            {{ parse_date('hire_date') }} AS hire_date
      FROM source_employees
      WHERE employee_id IS NOT NULL -- removing NULL values in emp_no column
)

SELECT * FROM final