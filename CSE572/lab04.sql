SET LINESIZE 3000
SET PAGESIZE 3000


SELECT employee_ID, first_name, last_name,  department_name
    FROM HR.employees, HR.departments;


-- Check error of this Statement
SELECT employee_id, first_name, last_name, department_id, department_name
    FROM HR.employees, HR.departments
    WHERE HR.employees.department_id = HR.departments.department_id;


--Join two tables
SELECT employee_id, first_name, last_name, HR.employees.department_id, department_name
    FROM HR.employees, HR.departments
    WHERE HR.employees.department_id = HR.departments.department_id;


-- join multiple tables and use search conditions
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city
    FROM HR.employees e, HR.departments d, HR.locations l
    WHERE e.department_id = d.department_id
    AND d.location_id = l.location_id	
    AND e.department_id IN (80,90);


-- join two tables using non-equiJoin
SELECT e.first_name, e.last_name, j.grade_level, j.lowest_sal, j.highest_sal
     FROM HR.employees e, HR.job_grades j
    WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal;


SELECT e.first_name, e.last_name, j.grade_level, j.lowest_sal, j.highest_sal
     FROM HR.employees e, HR.job_grades j
    WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal
    AND e.first_name = 'William';


-- This will not list employees who do not have department_id, 
SELECT e.last_name, e.department_id, d.department_name
   FROM HR.employees e, HR.departments d
   WHERE e.department_id = d.department_id;


-- This will list all employees
SELECT e.last_name, e.department_id, NVL(d.department_name,'** Not in any department') Department
   FROM HR.employees e, HR.departments d
   WHERE e.department_id = d.department_id (+);


-- This will list all Departments
SELECT e.last_name, e.department_id, d.department_name
   FROM HR.employees e, HR.departments d
   WHERE e.department_id(+) = d.department_id;


-- List an employee and his/her manager
SELECT e.employee_id, e.first_name, e.last_name, m.last_name Manager
     FROM HR.employees e, HR.employees m 
    WHERE e.manager_id = m.employee_id
    AND  e.employee_id = '201';

-- List employees and their managers 
SELECT e.first_name, e.last_name, m.last_name Manager
     FROM HR.employees e, HR.employees m 
    WHERE e.manager_id = m.employee_id;


-- Cross Join
SELECT employee_ID, first_name, last_name,  department_name
    FROM HR.employees CROSS JOIN HR.departments;


-- Natural join two tables ( department_id and manager_id ) 
SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees NATURAL JOIN HR.departments;

-- Equivalent EquiJoin
SELECT e.last_name, e.department_id, d.department_name
   FROM HR.employees e, HR.departments d
   WHERE e.department_id = d.department_id 
   AND e.manager_id = d.manager_id;

-- List employees, who are assigned to departments
SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees 
    JOIN HR.departments USING ( department_id );


-- List employees, their department names and locations
SELECT e.employee_ID, e.first_name, e.last_name, d.department_name, l.city
    FROM HR.employees e
    JOIN HR.departments d 
    ON e.department_id = d.department_id 
    JOIN HR.locations l
    ON d.location_id = l.location_id;


SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees e
    JOIN HR.departments d 
    ON e.department_id = d.department_id 
    AND e.department_id IN (80,90);

-- List all employees and their departments if any
SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees e
    LEFT JOIN HR.departments d 
    ON e.department_id = d.department_id; 


-- List all departmetnts and their employess if any
SELECT employee_ID, first_name, last_name, NVL(d.department_name,'** Not in any department') Department
    FROM HR.employees e
    LEFT JOIN HR.departments d 
    ON e.department_id = d.department_id;

-- Equivalent SQL 
SELECT e.last_name, e.department_id, NVL(d.department_name,'** Not in any department') Department
   FROM HR.employees e, HR.departments d
   WHERE e.department_id = d.department_id (+);

-- List all departmetnts and their employess if any
SELECT employee_ID, NVL(first_name,'** Has no Emplyee'), last_name, d.department_name
    FROM HR.employees e
    RIGHT OUTER JOIN HR.departments d 
    ON e.department_id = d.department_id;


-- List employees’ names and their departments of all employees and of all departments
SELECT employee_ID, first_name, last_name, d.department_name
    FROM HR.employees e
    FULL OUTER JOIN HR.departments d 
    ON e.department_id = d.department_id;


SELECT employee_ID, NVL(first_name,'** Has no Emplyee'), last_name, NVL(d.department_name,'** Not in any department') Department
    FROM HR.employees e
    FULL OUTER JOIN HR.departments d 
    ON e.department_id = d.department_id
    ORDER BY e.last_name;

