SELECT DISTINCT job_id, location_id
FROM hr.employees, hr.departments
WHERE hr.employees.department_id = hr.departments.department_id
AND hr.employees.department_id = 80;
