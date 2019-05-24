 -- 현재까지 근무일 수가 많은 사람 순으로 출력
 SELECT  *
 FROM emp
 ORDER BY sysdate -nvl(hiredate,sysdate) DESC ;
 
 SELECT  *
 FROM emp
 ORDER BY nvl(sysdate -hiredate,0) DESC ;
           
-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
 SELECT  ename, hiredate, sysdate-hiredate totoal_days,
        trunc((sysdate - hiredate)/7) weeks, ceil(mod(sysdate - hiredate,7))days
 FROM emp;

-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 
 SELECT  ename,trunc(months_between(sysdate , hiredate))
 FROM emp
 WHERE Deptno = 10;

-- 현재 날짜에서 3개월후의 날짜 구하기
 select  add_months( sysdate, 3 ) as mydate from dual;
 
-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
 SELECT next_day(sysdate,'월') from dual;      
 
-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
 SELECT last_day(sysdate) from dual;           