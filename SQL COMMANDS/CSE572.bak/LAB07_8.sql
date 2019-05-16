DESC JOB_GRADES
SELECT e.last_name, e.job_id, d.department_name,
e.salary, j.grade_level
FROM hr.employees e JOIN hr.departments d
ON(e.department_id = d.department_id)
JOIN hr.job_grades j 
ON(e.salary BETWEEN j.lowest_sal AND j.highest_sal);
