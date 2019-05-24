SELECT rownum, empno, ename FROM emp WHERE rownum<=5;




-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
SELECT avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
FROM emp
WHERE job = 'SALESMAN';
--집계함수에 한해서는 null 값도 처리가능

INSERT INTO emp(empno, ename, job)  VALUES (9988,'홍홍이', 'SALESMAN');

--커미션(COMM)을 받는 사람들의 수는
SELECT COUNT(empno) cnt
FROM emp
WHERE nvl(comm,0) !=0;
-- 같지 않다   !=  ,   <>   두개로 사용가능
SELECT COUNT(empno) cnt
FROM emp
WHERE nvl(comm,0) <>0;

/*
SELECT columns  
FROM  table_name  
WHERE condition
GROUP BY group_by_expression
HAVING condition
ORDER BY column;
*/
-- 부서찾는 조건과 그룹핑하는 조건이 다름

 -- 부서별로인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
SELECT deptno, count(*) cnt, round(avg(sal)) avg,  min(sal) min, max(sal) max , sum(sal) sum
FROM  emp
GROUP BY deptno;
-- group외에 다른 값도 보고싶다면 group에 같이 묶어주기
SELECT deptno, job, count(*) cnt, round(avg(sal)) avg,  min(sal) min, max(sal) max , sum(sal) sum
FROM  emp
GROUP BY deptno, job;
  
-- 부서별로인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 (부서별 급여의 합이 높은 순으로)
SELECT DEPTNO, COUNT(*) cnt, ROUND(AVG(sal)) avg, MIN(sal) min, MAX(sal) max, SUM(sal) sum
FROM EMP
GROUP BY DEPTNO
ORDER BY sum DESC;

-- 부서별업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
SELECT DEPTNO, JOB, COUNT(*) cnt, ROUND(AVG(sal)) avg, SUM(sal) sum
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

-- 급여가 최대 2900 이상인부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
SELECT DEPTNO,ROUND(AVG(sal)) avg, SUM(sal) sum
FROM EMP
GROUP BY DEPTNO
HAVING MAX(sal) >= 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
SELECT JOB, ROUND(AVG(sal)) avg, SUM(sal) sum
FROM EMP
GROUP BY JOB
HAVING ROUND(AVG(sal)) >= 3000;

-- 전체 합계 급여가 5000를초과하는 각 업무에 대해서 업무와 급여 합계를 출력
-- 단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
SELECT JOB, COUNT(*) cnt, ROUND(AVG(sal)) avg, MIN(sal) min, MAX(sal) max, SUM(sal) sum
FROM EMP
WHERE JOB != 'SALESMAN'
GROUP BY JOB
HAVING SUM(sal) >= 5000
ORDER BY sum DESC;

-- 업무별최고 급여와 최소 급여의 차이를 구하라
SELECT JOB, MAX(sal) - MIN(sal) sal_gap
FROM EMP
GROUP BY JOB;

-- 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
SELECT DEPTNO, COUNT(*), SUM(SAL) sum
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

[ GROUP BY 절에 사용하는 함수 ] 
- ROLLUP : 결과에 그룹별 합계 정보를 추가
- CUBE : 그룹핑 된 컬럼의 합계 정보를 추가
 
select job, sum( sal ) from emp group by job;
select job, sum( sal ) from emp group by rollup(job);
select job, sum( sal ) from emp group by cube(job);
 