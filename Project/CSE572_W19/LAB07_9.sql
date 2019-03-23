SELECT e.last_name, e.hire_date
FROM hr.employees e JOIN hr.employees davies
ON(davies.last_name = 'Davies')
WHERE davies.hire_date < e.hire_date;
