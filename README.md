
                                            Analytic Vizion Interview Process - Step 3 



Business needs: 

    Develop a dashboard similar to the employee retention dashboard: https://public.tableau.com/app/profile/starschema/viz/Fluctuationreport/Fluctuationreport


Challenge: 

    Extract and load the raw data into Snowflake via Fivetran, and transform the data with DBT for the BI team to construct the dashboard.


 Dashboard's contents: 
 
    Metrics:
    
        - Annual fluctuation rate
        - YTD number of leavers
        - Current headcounts
        - Current number of leavers
        - Current workforce changes
        
        
        Graphs:
        
        - Bar chart: number of employees who left per location and department for each month.
        - Dot chart: number of employees who left per year. 
        - Pie chart: percentage of employee who left by generation (generation X, Y, Z, etc.)
        - Bar chart: numbers of employee who left by reason (salary, family reason, travelling, etc.)
        
        
- Data sources:
    1. employees: 
        columns:
        
            - emp_no (employee id), 
            
            - birth_date, 
            
            - first_name,
            
            - last_name,
            
            - sex,
            
            - hire_date
    
    2. departures: 
        columns:
        
            - emp_no,
            
            - exit_date,
            
            - exit_reason    
    
    3. dept_emp:
        columns:
        
            - emp_no,
            
            - dept_no 
    
    4. departments:
        columns:
        
            - dept_no,
            
            - dept_name
    


Bottlenecks:

    1. The categorized form (exit_reason) is the only source of information regarding why employees leave the company, but the specific descriptions for each category are not provided. 
    
    2. It is not possible to extract employee location based on geographical data, as there is no specific column or field available for this information. 


Plan of action to solve the bottlenecks:

    - Analyze the current process for collecting and categorizing employee exit reasons and employee geographical location.
    - Update the current process to collect and include the missing columns.     
