SELECT e.last_name, d.department_name, d.location_id, l.city
FROM hr.employees e, hr.departments d, hr.locations l
WHERE e.department_id = d.department_id
AND
d.location_id = l.location_id
AND e.commission_pct IS NOT NULL;
