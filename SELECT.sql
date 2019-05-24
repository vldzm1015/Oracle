/*
SELECT  검색할 항목들
From    테이블명
WHERE   조건
*/
-- 모든 사원의 사원명과 급여, 급여와 보너스를 더한 합계 출력
SELECT ename, sal, sal+NVL (comm,0) AS YEONBONG
FROM emp;


SELECT ename || ' ' || Job enameojb, sal, sal+NVL (comm,0) AS YEONBONG
FROM emp;
/*-연결 연산자 (||) :  사원의이름과 업무를 연결하여 ‘STAFF’으로 출력
                       SELECT   ename|| ‘ ‘ || job as staff FROM emp*/
            
-- 사원테이블에서 부서번호를 출력
SELECT deptno FROM emp;
-- 모든 사원테이블에서 부서번호 출력
SELECT DISTINCT deptno FROM emp;
-- 중복되는 데이터는 빼고 출력

-- 1- 20번 부서에서 근무하는 사원의 사원번호, 이름, 부서번호 출력
SELECT empno,ename,deptno 
FROM emp
WHERE deptno=20;

-- 2- 입사일이 81/01/01에서 81/06/09인 사원의 사원번호, 이름, 입사일을 출력
SELECT empno,ename,hiredate 
FROM emp
WHERE hiredate >='81/01/01' And  hiredate <= '81/06/09';
SELECT empno,ename,hiredate 
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/06/09';
--두가지로 사용가능

-- 3- 담당업무가 salesman, clerk인 사원들의 이름과 업무를 출력
SELECT ename, job 
FROM emp
WHERE job lower(job) = 'salesman' OR  lower(job) = 'clerk' ;
SELECT ename,job FROM emp WHERE job = 'SALESMAN' or job = 'CLERK'; 

-- 4- 업무가 president이고 급여가 1500이상이거나 업무가 salesman인 사원의 정보를 출력
SELECT * FROM emp WHERE (JOB = 'PRESIDENT' AND SAL > 1500) OR (JOB = 'SALESMAN');

 
 /*
SELECT      검색할 항목들
From        테이블명
WHERE       조건
ORDER BY    정렬기준 
*/
 -- 부서번호 정렬된 사원테이블 출력
SELECT *
FROM emp
ORDER BY deptno DESC;
-- null부터 큰순서로 나옴

-- 부서번호 정렬된 사원테이블 출력
SELECT *
FROM emp
ORDER BY deptno ;
-- 작은 순서대로 나옴 null이 가장 마지막

-- 부서번호 정렬된 월급이 높은 순으로 사원테이블 출력
SELECT *
FROM emp
ORDER BY deptno, sal DESC;

-- 최근 입사순으로 사원명, 급여, 입사일자출력
SELECT ename, sal, hiredate
FROM emp
ORDER BY hiredate DESC;
 
-- 커미션이 높은 순으로 출력
SELECT *
FROM emp
ORDER BY nvl(comm,0) DESC;

-- 6- 커미션(comm)이 없는 사원의 이름, 급여, 커미션을 출력
SELECT ename, sal, comm
FROM emp
WHERE comm IS NULL OR comm=0;

-- 8- 이름 A로 시작하는 사원명 출력
SELECT ename
FROM emp
WHERE ename in 'A%' ;

-- 9- 이름이 두번째 문자가 L인 사원명 출력
SELECT ename
FROM emp
WHERE ename in '_L%' ;

-- 10- 이름에 L이 두 번 이상 포함된 사원명 출력
SELECT ENAME
FROM emp
WHERE ENAME in '%L%L%' ;

-- 11- 커미션(COMM)이 NULL이 아닌 사원의 모든 정보를 출력
SELECT *
FROM emp
WHERE comm is not null ;

-- 12- 보너스가 급여보다 10%가 많은 모든 사원에 대해 이름, 급여, 보너스를 출력
SELECT ename, sal, comm
FROM emp
WHERE comm > sal*1.1 ;

-- 13- 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000이 아닌 모든 사원의 정보를 출력
SELECT *
FROM emp
WHERE (JOB = 'CLERK' and sal!=1000 and SAL !=3000 and sal!=5000) AND(job = 'ANALYST' and sal!=1000 and sal !=3000 and sal!=5000);

SELECT *
FROM emp
WHERE (job = 'clerk' or job = 'analyst') AND(sal!=1000 and sal !=3000 and sal!=5000);

SELECT *
FROM emp
WHERE JOB in  ('CLERK', 'ANALYST') AND SAL not in (1000, 3000, 5000);

-- 13- 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000인 모든 사원의 정보를 출력
SELECT *
FROM emp
WHERE (Job = 'clerk' or job = 'analyst') AND(sal =1000 or sal =3000 or sal =5000);

SELECT *
FROM emp
WHERE JOB in  ('clerk', 'analyst') AND sal in (1000, 3000, 5000);

-- 14 부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력
SELECT *
FROM emp
WHERE deptno=30 OR mgr =7782; 
 
 SELECT * FROM emp;
 
