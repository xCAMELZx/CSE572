/* Yousef Jarrar 
Create Foreign Constraints 
for Employee Table 
*/ 

ALTER TABLE EMP ADD CONSTRAINT SUP PRIMARY KEY (EMPNO);

ALTER TABLE EMP ADD CONSTRAINT SALARY_CHECK CHECK (SALARY>12000);