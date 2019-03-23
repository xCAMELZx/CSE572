SELECT w.last_name "Employee", w.employee_id "EMP#",
m.last_name "Manager", m.employee_id "Mgr#"
FROM hr.employees w JOIN hr.employees m
ON(w.manager_id = m.employee_id);
