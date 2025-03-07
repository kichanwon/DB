--SQL (Structured Query Language)

SELECT * FROM employee;

SELECT emp_id,emp_name,phone FROM EMPLOYEE;

SELECT emp_id,emp_name, emp.SALARY,emp.SALARY*12  FROM EMPLOYEE emp;

--SELECT emp_name + 10 FROM EMPLOYEE e;
--산술 연산은 NUMBER 타입만 ㄱㄴ

SELECT emp_id + 10 FROM EMPLOYEE e;

SELECT '같은' FROM dual WHERE 1 = '1';


SELECT emp.EMP_NAME, emp.HIRE_DATE, sysdate FROM EMPLOYEE emp ;

-----------------------------------------------------
--SELECT sysdate-1, sysdate, sysdate+1 FROM dual;
SELECT sysdate-1 AS yesterday, sysdate AS "¿today?", sysdate+1 AS tommorow FROM dual;


