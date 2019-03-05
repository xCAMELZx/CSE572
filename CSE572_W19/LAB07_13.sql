/* LAB07_13
Jarrar, Yousef
*/ 

CREATE VIEW dept50 AS
SELECT employee_id empno, last_name employee,
department_id deptno
FROM hr.employees
WHERE department_id = 50
WITH CHECK OPTION CONSTRAINT emp_dept_50;
