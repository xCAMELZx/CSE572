SELECT last_name, department_id, department_name
FROM hr.employees
JOIN hr.departments
USING (department_id);
