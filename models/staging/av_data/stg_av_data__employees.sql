{{ config (
            materialized='view'
        )
}}

WITH source_employees AS (

    SELECT * FROM {{ source('av_step3_data', 'employees') }}
),

final AS (

    SELECT 
            CAST(emp_no AS VARCHAR(16)) AS emp_no,
            CAST(emp_title_id AS VARCHAR(16)) AS title_id,
            {{ parse_date('birth_date') }} AS birth_date,
            CAST(first_name AS VARCHAR(32)) AS first_name,
            CAST(last_name AS VARCHAR(32)) AS last_name,
            CAST(sex AS VARCHAR(1)) AS sex,
            {{ parse_date('hire_date') }} AS hire_date
      FROM source_employees
      WHERE emp_no IS NOT NULL -- removing NULL values in emp_no column
)

SELECT * FROM final