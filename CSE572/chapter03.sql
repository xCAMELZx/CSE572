SELECT employee_ID, first_name, last_name, salary
    FROM HR.employees 
    WHERE UPPER(first_name) =  'DAVID';

-- using Dummy table DUAL
SELECT LOWER('SQL Course') 
   FROM DUAL;
	
-- How many dates from 01 Jan, 2001
SELECT SYSDATE - TO_DATE('01-JAN-01')
   FROM DUAL;


-- What position of second l character from postion 3
SELECT INSTR('Sqlplus','l',3,2)
   FROM DUAL;


-- pad on the left with $
SELECT LPAD(24000, 10,'$') AS LPAD
   FROM DUAL;

-- pad on the right with $
SELECT RPAD(24000, 10,'$') 
   FROM DUAL;

-- Remove L character from heading and trailing character
SELECT TRIM('L' FROM 'Loyal') 
   FROM DUAL;

-- replace h with H
SELECT REPLACE('Hello home','h','H')
   FROM DUAL;


-- extract string from postion 7
SELECT SUBSTR('Hello home', 7 )
   FROM DUAL;


-- Add 6 months
SELECT ADD_MONTHS('11-JAN-96',6) 
   FROM DUAL;


-- date of next FRIDAY
SELECT NEXT_DAY('01-SEP-95','FRIDAY')  
   FROM DUAL;

-- Last day 
SELECT LAST_DAY('01-FEB-95') 
   FROM DUAL;

-- round current month to nearest month
SELECT ROUND(SYSDATE,'MONTH') 
   FROM DUAL;

-- round current year to nearest year
SELECT TRUNC(SYSDATE,'YEAR') 
   FROM DUAL;


-- list number of dates hired till today
SELECT employee_ID, first_name, last_name, SYSDATE - hire_date AS Dates_Hired 
   FROM HR.employees 
   WHERE job_id = 'IT_PROG';

-- list number of months hired till today
SELECT employee_ID, first_name, last_name, 
   ROUND(MONTHS_BETWEEN ( SYSDATE, hire_date),0) AS Months_Hired 
   FROM HR.employees 
   WHERE job_id = 'IT_PROG';


--List all initial last name of David 
SELECT first_name, last_name, SUBSTR(last_name,1,1 ) InitialLast
   FROM HR.employees 
    WHERE UPPER(first_name) =  'DAVID';


-- how long is length of both last name and first name
SELECT first_name, last_name, LENGTH(CONCAT(first_name,last_name)) AS LENGTH
    FROM HR.employees 
    WHERE UPPER(first_name) =  'DAVID';

-- display current day 
SELECT TO_CHAR(SYSDATE, 'DAY DD MON, YYYY')
   FROM DUAL;

-- display number is currency format 
SELECT TO_CHAR(24000, '9,999,999.00')
   FROM DUAL;

SELECT TO_CHAR(24000, '$,999,999.00')
   FROM DUAL;

-- list salary in currency format
SELECT first_name, last_name, TO_CHAR(salary,'L9,999,999.00')
   FROM HR.employees 
    WHERE UPPER(first_name) =  'DAVID';

--computer bonus based on commision and salary
SELECT first_name, last_name, salary, commission_pct, 
   NVL2(commission_pct, salary*commission_pct, salary*0.1) bonus
   FROM HR.employees;

--computer bonus based on commision and salary - alternative way
SELECT first_name, last_name, salary, commission_pct, 
   COALESCE(salary*commission_pct, salary*0.1) bonus
   FROM HR.employees;


--computer bonus based on job title and salary
SELECT first_name, last_name, salary, 
   CASE job_id 
	WHEN 'IT_PROG' THEN salary*0.25
	WHEN 'ST_CLERK' THEN salary*0.3
	ELSE salary*0.1	
   END Bonus
   FROM HR.employees;

-- an alternative way
SELECT first_name, last_name, salary, 
   DECODE (job_id,
	'IT_PROG', salary*0.25,
	'ST_CLERK', salary*0.3,
	salary*0.1) Bonus
   FROM HR.employees;

  

