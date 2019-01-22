set echo on
-- List all columns of table jobs
SELECT * 
   FROM HR.jobs;


-- List two columns / fields only
SELECT job_id, job_title 
   FROM HR.jobs;


-- List columns with simple column Alias
SELECT job_title, min_salary Minimum_Salary
    FROM HR.jobs;

-- List columns with customised column Alias using double quote
SELECT job_title, min_salary*1.2 AS "120% Minimum Salary"
    FROM HR.jobs;


-- List columns with Arithmetic Expression
SELECT job_title, min_salary*12 Annual_Minimum 
   FROM HR.jobs;

SELECT job_title, min_salary*12 + 2000 New_Minimum
   FROM HR.jobs;

SELECT job_title, (min_salary+max_salary)/2  Average_Salary
    FROM HR.jobs;


-- List columns with null value
SELECT last_name, salary, commission_pct
   FROM HR.employees;

SELECT last_name, salary, 12*salary*commission_pct
   FROM HR.employees;



-- Concatenation of multiple columns
SELECT job_title || min_salary AS "Job Title Min Salary "
   FROM HR.jobs;


-- Concatenation of multiple columns and literal character strings
SELECT job_id || ',' ||job_title  AS "Job ID, Title "
   FROM HR.jobs;


-- list all minimum salaries including duplicate rows 
SELECT min_salary
    FROM HR.jobs;


-- List only unique minimum salaries
SELECT DISTINCT min_salary    
   FROM HR.jobs;

set echo off
