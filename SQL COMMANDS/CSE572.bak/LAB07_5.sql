SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM hr.employees e JOIN hr.departments d
ON(e.department_id = d.department_id)
JOIN hr.locations l 
ON(d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';
