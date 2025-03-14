/*
[JOIN 용어 정리]
  오라클                                   SQL : 1999표준(ANSI)
----------------------------------------------------------------------------------------------------------------
등가 조인                               내부 조인(INNER JOIN), JOIN USING / ON
                                            + 자연 조인(NATURAL JOIN, 등가 조인 방법 중 하나)
----------------------------------------------------------------------------------------------------------------
포괄 조인                             왼쪽 외부 조인(LEFT OUTER), 오른쪽 외부 조인(RIGHT OUTER)
                                            + 전체 외부 조인(FULL OUTER, 오라클 구문으로는 사용 못함)
----------------------------------------------------------------------------------------------------------------
자체 조인, 비등가 조인                             JOIN ON
----------------------------------------------------------------------------------------------------------------
카테시안(카티션) 곱                        교차 조인(CROSS JOIN)
CARTESIAN PRODUCT


- 미국 국립 표준 협회(American National Standards Institute, ANSI) 미국의 산업 표준을 제정하는 민간단체.
- 국제표준화기구 ISO에 가입되어 있음.
*/

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- JOIN
-- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용.
-- 수행 결과는 하나의 Result Set으로 나옴.


-- (참고) JOIN은 서로 다른 테이블의 행을 하나씩 이어 붙이기 때문에
--       시간이 오래 걸리는 단점이 있다!


/*
- 관계형 데이터베이스에서 SQL을 이용해 테이블간 '관계'를 맺는 방법.


- 관계형 데이터베이스는 최소한의 데이터를 테이블에 담고 있어
  원하는 정보를 테이블에서 조회하려면 한 개 이상의 테이블에서
  데이터를 읽어와야 되는 경우가 많다.
  이 때, 테이블간 관계를 맺기 위한 연결고리 역할이 필요한데,
  두 테이블에서 같은 데이터를 저장하는 컬럼이 연결고리가됨.  
*/

------------------------------------------------------------------------------------
--ANSI
SELECT e.EMP_ID, e.EMP_NAME, e.DEPT_CODE , d.DEPT_TITLE
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID;


--ORACLE
--SELECT EMP_ID, EMP_NAME, DEPT_CODE
--FROM EMPLOYEE , DEPARTMENT
--WHERE LOCATION_ID = local_code;

--ANSI
SELECT e.EMP_ID, e.EMP_NAME, JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e 
JOIN JOB j USING (JOB_CODE);

--ORACLE
SELECT e.EMP_ID, e.EMP_NAME, e.JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e , JOB j 
WHERE e.JOB_CODE = j.JOB_CODE;

SELECT e.EMP_ID, e.EMP_NAME, e.JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e , JOB j 
WHERE e.JOB_CODE = j.JOB_CODE;



--ANSI------------------------------------------------------------------------------------
SELECT e.EMP_ID, e.EMP_NAME, JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e 
INNER JOIN JOB j USING (JOB_CODE);



SELECT e.EMP_ID, e.EMP_NAME, JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e 
LEFT JOIN JOB j USING (JOB_CODE);

SELECT e.EMP_ID, e.EMP_NAME, JOB_CODE, j.JOB_NAME
FROM JOB j  
LEFT JOIN EMPLOYEE e  USING (JOB_CODE);



SELECT e.EMP_ID, e.EMP_NAME, JOB_CODE, j.JOB_NAME
FROM EMPLOYEE e 
RIGHT JOIN JOB j USING (JOB_CODE);


--ORACLE------------------------------------------------------------------------------------
SELECT e.EMP_NAME, d.DEPT_TITLE
FROM EMPLOYEE e , DEPARTMENT d 
WHERE e.DEPT_CODE = d.DEPT_ID(+);

SELECT e.EMP_NAME, d.DEPT_TITLE
FROM EMPLOYEE e , DEPARTMENT d 
WHERE e.DEPT_CODE(+) = d.DEPT_ID;


--ANSI------------------------------------------------------------------------------------
SELECT e.EMP_NAME, d.DEPT_TITLE
FROM EMPLOYEE e
FULL JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID;



--ANSI------------------------------------------------------------------------------------
SELECT e.EMP_ID, e.EMP_NAME ,NVL(e.MANAGER_ID , '없음') ,NVL( e1.EMP_NAME, '-')
FROM EMPLOYEE e 
LEFT JOIN EMPLOYEE e1 ON e.MANAGER_ID  = e1.EMP_ID;
--ORACLE------------------------------------------------------------------------------------
SELECT e.EMP_ID, e.EMP_NAME ,NVL(e.MANAGER_ID , '없음') ,NVL( e1.EMP_NAME, '-')
FROM EMPLOYEE e, EMPLOYEE e1
WHERE  e.MANAGER_ID  = e1.EMP_ID(+);


SELECT e.EMP_NAME, d.DEPT_TITLE, l.LOCAL_CODE
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE;



--직급이 대리 아시아 지역에서 근무 직원
--사번 / 이름 / 직급명  부서명 근무지역 급여

SELECT e.EMP_ID, e.EMP_NAME, j.JOB_NAME , d.DEPT_TITLE, l.LOCAL_NAME, e.SALARY 
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.DEPT_CODE =d.DEPT_ID
JOIN JOB j ON j.JOB_CODE = e.JOB_CODE
JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
WHERE j.JOB_NAME ='대리' AND l.LOCAL_NAME like 'ASIA%';


--JOIN 연습문제
--1. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 '전'씨인 직원들의
--사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT e.EMP_NAME, e.EMP_NO, d.DEPT_TITLE, j.JOB_NAME
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.DEPT_CODE =d.DEPT_ID
JOIN JOB j ON e.JOB_CODE = j.JOB_CODE
WHERE e.emp_no LIKE '7%' AND SUBSTR(e.emp_no,8) LIKE '2%' AND e.EMP_NAME LIKE '전%';


--2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 직급명, 부서명을
--조회하시오.
SELECT e.EMP_NAME, e.EMP_ID,  j.JOB_NAME, d.DEPT_TITLE
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.DEPT_CODE =d.DEPT_ID
JOIN JOB j ON e.JOB_CODE = j.JOB_CODE
WHERE e.EMP_NAME LIKE '%형%';


--3. 해외영업 1부, 2부에 근무하는 사원의 사원명, 직급명, 부서코드, 부서명을
--조회하시오.
SELECT e.EMP_NAME,  j.JOB_NAME,e.DEPT_CODE , d.DEPT_TITLE
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.DEPT_CODE =d.DEPT_ID
JOIN JOB j ON e.JOB_CODE = j.JOB_CODE
WHERE d.DEPT_TITLE  LIKE '해외영업1부' OR d.DEPT_TITLE LIKE '해외영업2부';


--4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을
--조회하시오.
SELECT e.EMP_NAME, e.BONUS  , d.DEPT_TITLE , l.LOCAL_NAME
FROM EMPLOYEE e 
LEFT JOIN DEPARTMENT d ON e.DEPT_CODE =d.DEPT_ID
LEFT JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
WHERE e.BONUS IS NOT NULL;



--5. 부서가 있는 사원의 사원명, 직급명, 부서명, 지역명 조회
SELECT e.EMP_NAME, e.BONUS  , d.DEPT_TITLE , l.LOCAL_NAME
FROM EMPLOYEE e 
LEFT JOIN DEPARTMENT d ON e.DEPT_CODE =d.DEPT_ID
LEFT JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
WHERE d.DEPT_ID IS NOT NULL;


--6. 급여등급별 최소급여(MIN_SAL)를 초과해서 받는 직원들의 사원명, 직급명,
--급여, 연봉(보너스포함)을 조회하시오. (연봉에 보너스포인트를 적용하시오.)
SELECT e.EMP_NAME, j.JOB_NAME , e.SALARY, DECODE(e.BONUS,NULL,e.SALARY,(e.SALARY*e.BONUS+e.SALARY)) AS "연봉" , e.BONUS
FROM EMPLOYEE e 
LEFT JOIN JOB j ON e.JOB_CODE  =j.JOB_CODE
LEFT JOIN SAL_GRADE sg ON e.SAL_LEVEL = sg.SAL_LEVEL
WHERE DECODE(e.BONUS,NULL,e.SALARY,e.SALARY*e.BONUS+e.SALARY) > sg.MIN_SAL;

--7.한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을
--조회하시오.
SELECT e.EMP_NAME, d.DEPT_TITLE, l.LOCAL_NAME, n.NATIONAL_NAME
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
JOIN LOCATION l ON d.LOCATION_ID =l.LOCAL_CODE
JOIN "NATIONAL" n ON l.NATIONAL_CODE = n.NATIONAL_CODE
WHERE n.NATIONAL_NAME LIKE '한국' OR n.NATIONAL_NAME LIKE '일본';


--8. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을
--조회하시오.(SELF JOIN 사용)
SELECT e.EMP_NAME, e.DEPT_CODE , ex.EMP_NAME
FROM EMPLOYEE e
JOIN EMPLOYEE ex ON e.DEPT_CODE = ex.DEPT_CODE
WHERE e.EMP_NO != ex.EMP_NO
ORDER BY e.EMP_NAME;


--9. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명,
--직급명, 급여를 조회하시오. (단, JOIN, IN 사용할 것)
SELECT e.EMP_NAME,j.JOB_NAME , e.SALARY
FROM EMPLOYEE e
JOIN JOB j ON e.JOB_CODE  =j.JOB_CODE
WHERE j.JOB_CODE IN ('J4', 'J7') AND e.BONUS IS NULL;





















