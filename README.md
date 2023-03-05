
Analytic Vizion Interview Process - Step 3 

Business needs: Develop a dashboard similar to the employee retention dashboard: https://public.tableau.com/app/profile/starschema/viz/Fluctuationreport/Fluctuationreport
Challenge: Extract and load the raw data into Snowflake via Fivetran, and transform the data with DBT for the BI team to construct the dashboard.


    - Dashboard's contents: 
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
            
            
    - Data and features needed:
        1. Employees data: emp_no (employee id), birth_date, first_name and last_name 
            - I do not need in the final table but I will use to check for duplicated records), sex, hire_date.
        
        2. Departures data: emp_no, exit_date, exit_reason
            - The reasons for employees to leave the company is available only in categorized form (exit_reason).
              The descriptions of these categories were not available.
        
        3. Dept_emp data: emp_no, dept_no 
        
        4. Departments data: dept_no, dept_name