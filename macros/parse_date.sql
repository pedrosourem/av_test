{% macro parse_date(date_string) %}
    (SELECT 
        CASE 
            WHEN CAST(RIGHT({{ date_string }}, 2) AS INTEGER) BETWEEN 0 AND CAST(RIGHT(CAST(DATE_TRUNC('YEAR', CURRENT_DATE()) AS VARCHAR), 2) AS INTEGER) THEN 
                 TO_DATE(LEFT({{ date_string }}, CHARINDEX('/', {{ date_string }})-1) || '/' || 
                 LEFT(RIGHT({{ date_string }}, LEN({{ date_string }}) - CHARINDEX('/', {{ date_string }})), CHARINDEX('/', RIGHT({{ date_string }}, LEN({{ date_string }}) - CHARINDEX('/', {{ date_string }})))-1) || '/' ||
                 '20'|| RIGHT({{ date_string }}, 2), 'MM/DD/YYYY') 
            ELSE TO_DATE(LEFT({{ date_string }}, CHARINDEX('/', {{ date_string }})-1) || '/' || 
                 LEFT(RIGHT({{ date_string }}, LEN({{ date_string }}) - CHARINDEX('/', {{ date_string }})), CHARINDEX('/', RIGHT({{ date_string }}, LEN({{ date_string }}) - CHARINDEX('/', {{ date_string }})))-1) || '/' ||
                 '19'|| RIGHT({{ date_string }}, 2), 'MM/DD/YYYY')   
        END)
{% endmacro %}
