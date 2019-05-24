--사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
SELECT ename, sal, round(sal/12,2) "월급" 
FROM emp;

 --사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
 SELECT ename, sal, trunc(sal*0.033,-1)  TAX 
 FROM emp;

  select  '-' || trim(' 이순신 ')|| '-' as col1, 
          '-'|| ltrim(' 이순신 ') || '-' as col2, 
          '-'|| rtrim(' 이순신 ') || '-' as col3 
  from dual;
  --dual 가상테이블, 간단한 확인 할 때 사용
  --(*) dual : dummy 테이블로 sys user가 owner이고 모든 사용자가 사용가능.
  SELECT    '-' || replace(' 이 순 신 ','','')|| '-' as col 
  FROM dual; 
  select * from emp;
  SELECT SYSDATE FROM DUAL;
  
  
  
  
-- smith의정보를 사원번호, 성명, 담당업무(소문자) 출력
SELECT  EMPNO, ENAME, LOWER(JOB) as job
FROM emp
where ENAME = 'SMITH';  

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만대문자)로 출력
SELECT  EMPNO, INITCAP(ENAME) as ENAME, INITCAP(jOB) as JOB
FROM emp;           

-- 이름의 첫글자가 ‘K’보다크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE SUBSTR(ename,0,1)>'K' and SUBSTR(ename,0,1)<'Y'
ORDER BY ename;

-- 이름이 5글자 이상인사원들을 출력
SELECT *
FROM emp
WHERE LENGTH(ename)>=5;

-- 이름을 15자로 맞추고글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
SELECT RPAD(ename, 15, '*') as ename
FROM emp;

-- 월급은 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
SELECT LPAD(sal, 10, '-') as sal
FROM emp;

-- 월급을 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
SELECT  translate (sal, '0123456789', '영일이삼사오육칠팔구')
FROM emp;           
 
-- 월급의 숫자에서 0을‘$’로 바꾸어 출력
SELECT  replace (sal, '0', '$')
FROM emp;  






  