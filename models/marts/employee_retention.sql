{{ config (
            materialized='table'
        )
}}

WITH employees AS (

    SELECT * FROM {{ ref('stg_av_data__employees')}}

),

departures AS (

    SELECT * FROM {{ ref('stg_av_data__departures')}}

),

titles AS (

    SELECT * FROM {{ ref('stg_av_data__titles')}}

),

dept_emp AS (

    SELECT * FROM {{ ref('stg_av_data__dept_emp')}}

),

departments AS (

    SELECT * FROM {{ ref('stg_av_data__departments')}}

),

employee_retention AS (

    SELECT
          e.emp_no,
          t.role,
          dept.dept_name,
          e.sex,
          e.birth_date,
          CASE
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1946 AND 1964 THEN 'Boomers'
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1965 AND 1980 THEN 'Generation X'
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1981 AND 1994 THEN 'Millennials Y'
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1995 AND 2009 THEN 'Generation Z'
            ELSE 'Generation Alpha' END AS generation, -- adding generation column
          e.hire_date,
          d.exit_date,
          CASE
            WHEN CAST(d.exit_reason AS VARCHAR(1)) IS NULL THEN '0' 
            ELSE CAST(d.exit_reason AS VARCHAR(1)) END AS exit_reason -- altering NULL values (current employees) to 0   

    FROM 
        employees AS e
    LEFT JOIN 
        departures AS d
    ON 
        e.emp_no = d.emp_no
    LEFT JOIN 
        titles AS t
    ON 
        e.title_id = t.title_id
    LEFT JOIN 
        dept_emp AS de
    ON 
        e.emp_no = de.emp_no
    LEFT JOIN 
        departments AS dept
    ON 
        de.dept_no = dept.dept_no
)
  
SELECT * FROM employee_retention