SELECT department_ID, COUNT(*), MIN(SALARY), MAX(SALARY), AVG(SALARY)
FROM HR.employees
GROUP BY department_ID;
