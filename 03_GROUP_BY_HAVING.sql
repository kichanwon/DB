/*
SELECT e.EMP_NAME, SUM(s.SALARY) AS total_salary

FROM EMPLOYEE e
JOIN SALARY s ON e.EMP_ID = s.EMP_ID
WHERE e.EMP_AGE > 30
GROUP BY e.EMP_NAME
HAVING SUM(s.SALARY) > 50000

ORDER BY total_salary DESC
FETCH FIRST 10 ROWS ONLY;
*/

SELECT e.DEPT_CODE, SUM(e.SALARY)
FROM EMPLOYEE e
WHERE EXTRACT (YEAR FROM e.HIRE_DATE)>=2000
GROUP BY e.DEPT_CODE;

/*
 * emp table
 * 부서별 같은 직급인 사원의 인원수 조회
 * 부서코드 오름차순 직급코드 내림차순
 * 부서코드, 직급코드, 인원수
 */

SELECT e.DEPT_CODE,e.JOB_CODE, count(*)
FROM EMPLOYEE e 
GROUP BY e.DEPT_CODE, e.JOB_CODE
ORDER BY e.DEPT_CODE, e.JOB_CODE DESC;


SELECT e.DEPT_CODE, ROUND(AVG(e.SALARY))
FROM EMPLOYEE e 
GROUP BY e.DEPT_CODE
HAVING AVG(e.SALARY) >= 3000000
ORDER BY e.DEPT_CODE;


SELECT e.JOB_CODE, count(*)
FROM EMPLOYEE e 
GROUP BY e.JOB_CODE
HAVING COUNT(*) <= 5
ORDER BY e.JOB_CODE;

SELECT e.DEPT_CODE,e.JOB_CODE, count(*)
FROM EMPLOYEE e 
GROUP BY ROLLUP (e.DEPT_CODE, e.JOB_CODE)
ORDER BY 1;

SELECT e.DEPT_CODE,e.JOB_CODE, count(*)
FROM EMPLOYEE e 
GROUP BY cube (e.DEPT_CODE, e.JOB_CODE)
ORDER BY 1;

/*
 * SET
 * 
 * UNION
 * INTERSECT
 * UNION ALL
 * MINUS
 */

SELECT e.EMP_ID, e. EMP_NAME , e.DEPT_CODE , e.SALARY
FROM EMPLOYEE e 
WHERE e.DEPT_CODE = 'D5'
UNION
SELECT e.EMP_ID, e. EMP_NAME , e.DEPT_CODE , e.SALARY
FROM EMPLOYEE e 
WHERE e.DEPT_CODE = 'D6';




SELECT e.EMP_ID, e. EMP_NAME FROM EMPLOYEE e 
WHERE e.DEPT_CODE = 'D5'
UNION
SELECT d.dept_id, d.dept_title FROM DEPARTMENT d ;









