SELECT d.department_name "NAME", d.location_id "LOCATION",
COUNT(*) "NUMBER OF PEOPLE",
ROUND (AVG(SALARY), 2) "SALARY"
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name, d.location_id;
