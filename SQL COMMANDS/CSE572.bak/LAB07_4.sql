SELECT LAST_NAME, DEPARTMENT_NAME
FROM HR.EMPLOYEES, HR.DEPARTMENTS
WHERE HR.EMPLOYEES.DEPARTMENT_ID = HR.DEPARTMENTS.DEPARTMENT_ID
AND LAST_NAME LIKE '%a%';