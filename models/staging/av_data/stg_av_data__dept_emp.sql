WITH source_dept_emp AS (

    SELECT * FROM {{source(av_step3_data, dept_emp)}}
    
),

final AS (

    SELECT 
        emp_no,
        dept_no
      FROM (
        
        SELECT 
            emp_no,
            dept_no,
            ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY emp_no) as row_num
        FROM source_dept_emp
        ORDER BY emp_no) AS partition
      WHERE row_num = 1 

),

SELECT * FROM final