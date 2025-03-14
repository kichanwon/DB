---------------------------------------------------------------------------------------------
--DML Data Manipulation Language


CREATE TABLE emp2 AS SELECT * FROM employee;
CREATE TABLE dep2 AS SELECT * FROM department;

DROP TABLE emp2;

SELECT * FROM emp2;
SELECT * FROM dep2;


CREATE TABLE EMP_01(
	emp_id NUMBER,
	emp_name varchar2(30),
	dept_title varchar2(20)
);

SELECT * FROM emp_01;

SELECT emp_id, emp_name, dept_title
FROM EMP2 e 
LEFT JOIN dep2 d ON (e.DEPT_CODE = d.dept_id);

INSERT INTO emp_01 (
	SELECT emp_id, emp_name, dept_title
	FROM EMP2 e 
	LEFT JOIN dep2 d ON (e.DEPT_CODE = d.dept_id)
);

SELECT * FROM emp_01;

SELECT * 
FROM dep2 d
WHERE d.dept_id = 'D9';

UPDATE dep2 d
SET d.dept_title = '전략기획부'
WHERE d.dept_id = 'D9';

UPDATE EMP2 e 
SET e.bonus = 0.1
WHERE e.BONUS IS NULL ;

SELECT e.EMP_NAME, e.BONUS
FROM EMP2 e ;


UPDATE EMP2 e 
SET e.salary=(
	SELECT e.SALARY
	FROM EMP2 e 
	WHERE e.emp_name = '유재식'),
	e.bonus=(
	SELECT e.bonus
	FROM EMP2 e 
	WHERE e.emp_name = '유재식')
WHERE e.emp_name = '방명수';

SELECT e.EMP_NAME , e.BONUS , e.SALARY
FROM EMP2 e 
WHERE e.SALARY = 
	(SELECT e.SALARY
	FROM EMP2 e 
	WHERE e.emp_name = '유재식');


CREATE TABLE empM01 
AS SELECT * 
FROM employee;

CREATE TABLE empM02
AS SELECT * 
FROM employee
WHERE job_code = 'J4';

SELECT *
FROM empm02 e;

DROP TABLE empM02 CASCADE CONSTRAINTS;

--MERGE INTO empM01 USING EMP_M02 ON(EMP_M01.EMP_ID = EMP_M02.EMP_ID)
--WHEN MATCHED THEN
--UPDATE SET
--	EMP_M01.EMP_NAME = EMP_M02.EMP_NAME,
--	EMP_M01.EMP_NO = EMP_M02.EMP_NO,
--	EMP_M01.EMAIL = EMP_M02.EMAIL,
--	EMP_M01.PHONE = EMP_M02.PHONE,
--	EMP_M01.DEPT_CODE = EMP_M02.DEPT_CODE,
--	EMP_M01.JOB_CODE = EMP_M02.JOB_CODE,
--	EMP_M01.SAL_LEVEL = EMP_M02.SAL_LEVEL,
--	EMP_M01.SALARY = EMP_M02.SALARY,
--	EMP_M01.BONUS = EMP_M02.BONUS,
--	EMP_M01.MANAGER_ID = EMP_M02.MANAGER_ID,
--	EMP_M01.HIRE_DATE = EMP_M02.HIRE_DATE,
--	EMP_M01.ENT_DATE = EMP_M02.ENT_DATE,
--	EMP_M01.ENT_YN = EMP_M02.ENT_YN
--WHEN NOT MATCHED THEN
--INSERT VALUES(EMP_M02.EMP_ID, EMP_M02.EMP_NAME, EMP_M02.EMP_NO, EMP_M02.EMAIL, 
--	         EMP_M02.PHONE, EMP_M02.DEPT_CODE, EMP_M02.JOB_CODE, EMP_M02.SAL_LEVEL,
--	         EMP_M02.SALARY, EMP_M02.BONUS, EMP_M02.MANAGER_ID, EMP_M02.HIRE_DATE, 
--	         EMP_M02.ENT_DATE, EMP_M02.ENT_YN);

COMMIT;

DELETE FROM EMP2 e
WHERE e.emp_name = '방명수';


ROLLBACK ;

SELECT *
FROM EMP2 e 
WHERE e.emp_name = '방명수';

DELETE FROM EMP2 ;

SELECT *
FROM EMP2 e ;




DELETE FROM EMP2 e
WHERE e.emp_id IN (
	SELECT e.EMP_ID
	FROM EMP2 e 
	WHERE e.salary >= 3000000
);













