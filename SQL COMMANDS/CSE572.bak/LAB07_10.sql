SELECT w.last_name "Employee", w.hire_date "Emp Hired", m.last_name
"Manager", m.hire_date "MGR Hired"
FROM hr.employees w, hr.employees m
WHERE w.manager_id = m.employee_id
AND w.hire_date < m.hire_date;
