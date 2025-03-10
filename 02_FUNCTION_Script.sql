
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT e.EMAIL, LENGTH(e.EMAIL) AS "EMAIL Length"
FROM EMPLOYEE e;

SELECT INSTR('AABAACAABBAA','B')
FROM dual d;

SELECT INSTR('AABAACAABBAA','B',5)
FROM dual d;

/*
SELECT INSTR('String' | Column,'search',StartIndex[,Nth])

SELECT SUBSTR('String' | Column,StartIndex[,length])
*/
SELECT e.EMAIL, SUBSTR(e.EMAIL, 1, INSTR(e.EMAIL ,'@')-1)AS "ID", e.EMP_NAME
FROM EMPLOYEE e;

SELECT TRIM('				h e l l o				')
FROM dual;

SELECT LTRIM()
FROM dual;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT e.EMP_NAME, e.SALARY, mod(e.SALARY,1000000)as"%"
FROM EMPLOYEE e ;

SELECT e.EMP_NAME, e.EMP_ID , mod(e.EMP_ID ,2)as"even"
FROM EMPLOYEE e
WHERE mod(e.EMP_ID ,2)=0;

SELECT e.EMP_NAME, e.EMP_ID , mod(e.EMP_ID ,2)as"even"
FROM EMPLOYEE e
WHERE mod(e.EMP_ID ,2);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT EMP_NAME, HIRE_DATE,
		CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)),
		CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) || '년차'
FROM EMPLOYEE;

SELECT e.EMP_NAME,
	EXTRACT(YEAR FROM e.hire_date) || '년' ||
	EXTRACT(month FROM e.hire_date) || '월' ||
	EXTRACT(day FROM e.hire_date) || '일' AS "입사일"
FROM EMPLOYEE e;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD ') FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"') FROM dual;


SELECT e.EMP_NAME , SUBSTR(e.EMP_NO, 1, INSTR(e.EMP_NO, '-')-1)AS BDay
FROM EMPLOYEE e;

SELECT e.EMP_NAME , 
	TO_CHAR(TO_DATE(SUBSTR(e.EMP_NO, 1, INSTR(e.EMP_NO, '-')-1) /*, 'RRMMDD'*/), 'YYYY"년" MM"월" DD"일"') AS BDay
FROM EMPLOYEE e;

SELECT TO_NUMBER('1,000,000', '9,999,999')+500000 FROM dual;

SELECT e.EMP_NAME, e.EMP_NO /*DECODE( SUBSTR(e.EMP_NO, 8,1), '1', '남성', '2', '여성')*/
FROM EMPLOYEE e;

SELECT e.EMP_NAME, DECODE( SUBSTR(e.EMP_NO, 8,1), '1', '남성', '2', '여성')
FROM EMPLOYEE e;

SELECT e.EMP_NAME,e.JOB_CODE, e.SALARY, 
DECODE(e.JOB_CODE,'J7','20%',
								'J6','15%',
								'J5','10%',
								'5%') 인상률,
DECODE(e.JOB_CODE,'J7',e.SALARY * 1.2,
								'J6',e.SALARY * 1.15,
								'J5',e.SALARY * 1.1,
								e.SALARY * 1.05) "인상된 급여"
FROM EMPLOYEE e ;

SELECT e.EMP_NAME,e.SALARY,
CASE WHEN e.SALARY >= 5000000 THEN '대'
		 WHEN e.SALARY >= 3000000 THEN '중'
		 ELSE '소' END "급여 받는 정도"
FROM EMPLOYEE e ;

SELECT SUM(e.SALARY), ROUND( AVG(e.SALARY) )
FROM EMPLOYEE e ;

SELECT SUM(e.SALARY), ROUND( AVG(e.SALARY) )
FROM EMPLOYEE e 
WHERE e.DEPT_CODE = 'D9';

SELECT MIN(e.SALARY), MIN(e.HIRE_DATE), MIN(e.EMAIL)
FROM EMPLOYEE e ;

SELECT e.EMP_NAME, e.SALARY, e.JOB_CODE
FROM EMPLOYEE e
WHERE e.SALARY = (SELECT MAX(e.SALARY) FROM EMPLOYEE e);

SELECT MAX(e.SALARY) FROM EMPLOYEE e ;

SELECT COUNT(DISTINCT e.JOB_CODE) FROM EMPLOYEE e;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
SELECT e.EMP_NAME, SUM(s.SALARY) AS total_salary

FROM EMPLOYEE e
JOIN SALARY s ON e.EMP_ID = s.EMP_ID
WHERE e.EMP_AGE > 30
GROUP BY e.EMP_NAME
HAVING SUM(s.SALARY) > 50000

ORDER BY total_salary DESC
FETCH FIRST 10 ROWS ONLY;

FROM: EMPLOYEE와 SALARY 테이블을 가져옵니다.
JOIN: EMPLOYEE와 SALARY를 EMP_ID로 조인합니다.
ON: 조인 조건(e.EMP_ID = s.EMP_ID)을 적용합니다.
WHERE: EMP_AGE > 30 조건을 적용하여 나이가 30세 이상인 직원만 남깁니다.
GROUP BY: EMP_NAME으로 그룹화합니다.
HAVING: 급여 총액이 50,000 이상인 그룹만 남깁니다.

SELECT: EMP_NAME과 total_salary를 선택합니다.

ORDER BY: total_salary를 내림차순으로 정렬합니다.
FETCH FIRST 10 ROWS ONLY: 상위 10개의 결과만 출력합니다.
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

