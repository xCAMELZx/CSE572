DESC HR.employees


--Search record / rows for a specific record
SELECT employee_ID, first_name, last_name
   FROM HR.employees 
   WHERE employee_ID = 130;


--list row for a specific condition
SELECT employee_ID, first_name, last_name, hire_date
   FROM HR.employees 
   WHERE hire_date < '31-DEC-05';


-- List employees in department 90 ONLY
SELECT employee_ID, first_name, last_name, department_id 
   FROM HR.employees 
   WHERE department_id = 90;


-- List employees in department between 50 and 150
SELECT employee_ID, first_name, last_name, department_id
   FROM HR.employees 
   WHERE department_id BETWEEN 50 AND 150;


SELECT employee_ID, first_name, last_name, hire_date
   FROM HR.employees 
   WHERE hire_date BETWEEN '01-JAN-01' AND '01-JAN-03';



-- List employees in 3 department 50,70,90 only
SELECT employee_ID, first_name, last_name, department_id
   FROM HR.employees 
   WHERE department_id IN (50, 70, 90);


-- List employees whose first name has 'Da'
SELECT employee_ID, first_name, last_name
   FROM HR.employees 
   WHERE first_name  LIKE '%Da%';


-- List high paid Programgers
SELECT employee_ID, first_name, last_name, department_id, job_id, salary
   FROM HR.employees
   WHERE job_id = 'IT_PROG' AND salary >= 5000 ;

-- List high paid Programmers and managers in the company
SELECT employee_ID, first_name, last_name, job_id, salary
   FROM HR.employees
   WHERE salary >= 10000 OR job_id LIKE '%MGR' ;


-- List employees whose first name doese not have 'Da'
SELECT employee_ID, first_name, last_name
   FROM HR.employees 
   WHERE first_name  LIKE '%Da%';

-- List rows with combined conditions
SELECT employee_ID, first_name, last_name, job_id, salary
   FROM HR.employees
   WHERE job_id = 'IT_PROG' OR job_id = 'AD_PRES' 
   AND salary > 10000;

SELECT employee_ID, first_name, last_name, job_id, salary
   FROM HR.employees
   WHERE (job_id = 'IT_PROG' OR job_id = 'AD_PRES') 
   AND salary > 10000;


-- List employee in order of department_ID 
SELECT employee_ID, department_id, first_name, last_name 
   FROM HR.employees
   ORDER BY department_id;


-- List employee in order of department_ID, higher Annual Salary  
SELECT employee_ID, department_id, first_name, last_name, salary*12 Annual 
   FROM HR.employees
   ORDER BY department_id, Annual DESC;






