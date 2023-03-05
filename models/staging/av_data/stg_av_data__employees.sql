WITH source_employees AS (
    SELECT *
    FROM {{ source(av_step3_data, employees) }}
),
final AS (
    SELECT 
            emp_no,
            emp_title_id,
            {{ parse_date('birth_date') }} AS birth_date,
            first_name,
            last_name,
            sex,
            {{ parse_date('hire_date') }} AS hire_date
      FROM source_employees
      WHERE EMP_NO IS NOT NULL
)
SELECT *
FROM final