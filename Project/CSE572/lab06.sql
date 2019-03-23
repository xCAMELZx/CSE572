SET LINESIZE 80
SET PAGESIZE 60


-- List employees with a job-title
SELECT employee_ID, first_name, last_name, job_id, salary 
    FROM HR.employees 
    WHERE job_id = '&job_title'
    ORDER BY employee_ID;

-- List employees with a job-title = ‘IT_PROG’
SELECT employee_ID, first_name, last_name, job_id, salary 
    FROM HR.employees 
    WHERE UPPER(job_id) = UPPER('&job_title')
    ORDER BY employee_ID;


DEFINE Job_title = 'IT_PROG'
UNDEFINE Job_title

-- List employees with varying columns, conditions and orders
SELECT &columnlists 
    FROM HR.employees 
    WHERE &conditions
    ORDER BY &orders;

-- Enter these line when asked
first_name, last_name, salary
UPPER(job_id) = 'IT_PROG'
employee_ID


-- substitution variables are used at different clauses
SELECT employee_ID, first_name, last_name, &&columnList
    FROM HR.employees 
    ORDER BY &columnList;

department_id, salary 


BREAK ON job_id

SELECT  job_id , employee_ID, first_name, last_name, salary
    FROM HR.employees 
    ORDER BY job_ID;



--make executate script file by saving the following text in a file with sql extension such as report.sql
SET LINESIZE 80
SET PAGESIZE 60
SET FEEDBACK OFF

TTITLE CENTER 'EMPLOYEE REPORT' SKIP 1 CENTER 'As of ' _DATE
BTITLE CENTER 'Page:'SQL.PNO
BREAK ON job_id
COLUMN job_id  HEADING 'Job|Category' FORMAT A20
COLUMN Salary HEADING 'Salary' FORMAT $99,999.99
COLUMN Employees  FORMAT A30
-- 
SELECT job_id, last_name ||', '|| first_name AS Employees, salary
FROM HR.employees
WHERE salary > 5000
ORDER BY job_id, last_name;

SET FEEDBACK ON
CLEAR BREAK
COLUMN job_id CLEAR
COLUMN Employees CLEAR
COLUMN Salary CLEAR


 
