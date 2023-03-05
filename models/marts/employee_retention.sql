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

dept_emp AS (

    SELECT * FROM {{ ref('stg_av_data__dept_emp')}}

),

departments AS (

    SELECT * FROM {{ ref('stg_av_data__departments')}}

),

employee_retention AS (

    SELECT
          e.emp_no,
          dept.dept_name,
          e.sex,
          birth_date,
          CASE
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1946 AND 1964 THEN 'Boomers'
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1965 AND 1980 THEN 'Generation X'
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1981 AND 1994 THEN 'Millennials Y'
            WHEN DATE_PART('YEAR', birth_date) BETWEEN 1995 AND 2009 THEN 'Generation Z'
            ELSE 'Generation Alpha' END AS generation, -- adding generation column
          hire_date,
          exit_date,
          d.exit_reason  

      FROM 
        employees e
      LEFT JOIN 
        departures d
      ON 
        e.emp_no = d.emp_no
      LEFT JOIN 
        dept_emp de
      ON 
        e.emp_no = de.emp_no
      LEFT JOIN 
        departments dept
      ON 
        de.dept_no = dept.dept_no
)
  
SELECT * FROM employee_retention