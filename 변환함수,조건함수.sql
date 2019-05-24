 -- 변환 함수
-- TO_CHAR
-- TO_DATE
-- TO_NUMBER
 
-- 입사일자에서 입사년도를 출력
SELECT ename, hiredate, to_char(hiredate,'YYYY') hireyear
FROM emp;

-- 입사일자에서 입사월을 출력
SELECT ename, hiredate, to_char(hiredate,'MM') hiremonth
FROM emp;

-- 입사일자에서 입사년도,월을 출력
SELECT ename, hiredate, to_char(hiredate,'YYYY-MM') hireyear
FROM emp;

-- 입사일자에서 입사일을 출력
SELECT ename, hiredate, to_char(hiredate,'DD') hireday
FROM emp;

-- 입사일자에서 입사 시 분 초 출력
SELECT ename, hiredate, to_char(hiredate,'hh:mi') hiretime
FROM emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
SELECT ename, hiredate, to_char(hiredate,'YYYY"년"MM"월"DD"일"') hireyear
FROM emp;           
-- 1981년도에 입사한 사원 검색
SELECT *
FROM emp
WHERE  to_char(hiredate,'YYYY') = 1981; 
-- 5월에 입사한 사원 검색
SELECT *
FROM emp
WHERE  to_char(hiredate,'MM') = 05; 
-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력


--910111-2033333
SELECT name, decode( substr( jumin, 8, 1), '1', '남자', '3', '남자', '2', '여자', '4', '여자') AS gender
from info;

SELECT  CASE  substr(jumin, 8, 1) 
         WHEN '1' THEN '남자'
         WHEN '3' THEN '남자'
         ELSE '여자'
        END    as gender
FROM   info;

-- 부서번호가 10이면영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
SELECT ename, decode( deptno, '10', '영업부', '20', '관리부', '30', 'IT', '기술부') AS deptno
from emp;

SELECT  CASE  deptno
         WHEN '10' THEN '영업부'
         WHEN '20' THEN '관리부'
         WHEN '30' THEN 'IT'
         ELSE '기술부'
        END    as deptno
FROM   emp;  
SELECT * FROM emp;
-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
SELECT EMPNO, ENAME, SAL, decode(job, 'analyst', SAL*1.1, 'clerk', SAL*1.15, 'manager', SAL*1.2) AS SALB
FROM emp;
SELECT empno,ename,sal, sal+(decode(job,'ANALYST',sal*0.1,'CLERK',sal*0.15,'MANAGER',sal*0.2)) as afterpromotion
FROM emp;
SELECT EMPNO, ENAME, JOB, SAL, DECODE(JOB, 'ALALYST', 1.1 * SAL, 'CLERK', 1.15 * SAL, 'MANAGER', 1.2 * SAL,  SAL) AS SAL_PLUS
FROM EMP;

SELECT    EMPNO, ENAME, JOB, SAL,
        CASE job
         WHEN 'analyst' THEN SAL*1.1
         WHEN 'clerk' THEN SAL*1.15
         WHEN 'manager' THEN SAL*1.2
         ELSE SAL
        END    as SALB
FROM   emp; 


           