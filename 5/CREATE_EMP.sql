/* Yousef Jarrar
Script to Create Table_EMP in SQL
*/ 

CREATE TABLE EMP
	( EMPNO NUMBER NOT NULL ENABLE,
	  FNAME VARCHAR2(15),
	  LNAME VARCHAR2(25), 
          ADDRESS VARCHAR2(45), 
	  SEX VARCHAR2(1),
	  SALARY NUMBER(6),
 	  POSITION VARCHAR2(15),
	  DEPTNO VARCHAR2(2)
	); 
