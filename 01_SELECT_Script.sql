--SQL (Structured Query Language)

SELECT * FROM employee;

SELECT emp_id,emp_name,phone FROM EMPLOYEE;
SELECT emp_id,emp_name, emp.SALARY,emp.SALARY*12  FROM EMPLOYEE emp;

SELECT emp_id + 10 FROM EMPLOYEE e;

SELECT '같은' FROM dual WHERE 1 = '1';
SELECT emp.EMP_NAME, emp.HIRE_DATE, sysdate FROM EMPLOYEE emp ;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SELECT sysdate-1, sysdate, sysdate+1 FROM dual;
SELECT sysdate-1 AS yesterday, sysdate AS "¿today?", sysdate+1 AS tommorow FROM dual;

SELECT e.EMP_NAME, e.SALARY,'만큼 법니다'AS " " FROM EMPLOYEE e ;

SELECT DISTINCT e.DEPT_CODE, e.JOB_CODE FROM EMPLOYEE e ;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	SELECT e.EMP_ID,e.EMP_NAME, e.SALARY, e.DEPT_CODE
	FROM EMPLOYEE e
	WHERE e.SALARY > 3000000;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	SELECT e.EMP_ID,e.EMP_NAME, e.DEPT_CODE, e.JOB_CODE
	FROM EMPLOYEE e
	WHERE e.DEPT_CODE = 'D9';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	SELECT e.EMP_ID,e.EMP_NAME, e.SALARY, e.PHONE
	FROM EMPLOYEE e
	WHERE e.SALARY > 5000000 OR e.SALARY < 3000000;

	SELECT e.EMP_ID,e.EMP_NAME, e.SALARY, e.PHONE
	FROM EMPLOYEE e
	WHERE e.SALARY BETWEEN 3000000 AND 5000000;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
 * %A
 * A%
 * %A%
 * 
 * 연산자 우선순위
 * + - * /
 * ||
 * <>>=<= = != <>
 * IS NULL / IS NOT NULL, LIKE, IN / NOT IN
 * BETWEEN AND / NOT BETWEEN AND
 * NOT
 * AND
 * OR
 */
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT e.EMP_ID, e.EMP_NAME
FROM EMPLOYEE e 
WHERE e.EMP_NAME LIKE '전%';

SELECT e.EMP_ID, e.EMP_NAME, e.PHONE
FROM EMPLOYEE e 
WHERE e.PHONE  NOT LIKE '010%';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT e.EMP_ID, e.EMP_NAME, e.EMAIL 
FROM EMPLOYEE e
WHERE e.EMAIL  LIKE '___#_%' ESCAPE '#';

SELECT e.EMP_ID, e.EMP_NAME, e.EMAIL, e.DEPT_CODE, e.HIRE_DATE , e.SALARY
FROM EMPLOYEE e 
WHERE e.EMAIL  LIKE '____#_%' ESCAPE '#'
AND (e.DEPT_CODE = 'D9' OR e.DEPT_CODE = 'D6')
AND e.HIRE_DATE   BETWEEN '1990-01-01' AND '2001-12-31' 
AND e.SALARY >= 2700000;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT e.EMP_ID, e.EMP_NAME, e.DEPT_CODE
FROM EMPLOYEE e 
WHERE e.DEPT_CODE  IN ('D1', 'D6', 'D9');

SELECT e.EMP_ID, e.EMP_NAME, e.DEPT_CODE
FROM EMPLOYEE e 
WHERE e.DEPT_CODE  NOT IN ('D1', 'D6', 'D9') OR e.DEPT_CODE IS null;

SELECT e.EMP_ID, e.EMP_NAME, e.BONUS 
FROM EMPLOYEE e 
WHERE e.BONUS IS NOT null;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT e.EMP_ID, e.EMP_NAME, e.SALARY 
FROM EMPLOYEE e 
ORDER BY e.SALARY;

SELECT e.EMP_ID, e.EMP_NAME, e.SALARY 
FROM EMPLOYEE e 
WHERE e.SALARY >2000000
ORDER BY e.SALARY desc;

SELECT e.EMP_ID, e.EMP_NAME, e.DEPT_CODE, e.SALARY 
FROM EMPLOYEE e 
WHERE e.SALARY >2000000
ORDER BY e.DEPT_CODE asc, e.SALARY desc;

