 -- ������� �ٹ��� ���� ���� ��� ������ ���
 SELECT  *
 FROM emp
 ORDER BY sysdate -nvl(hiredate,sysdate) DESC ;
 
 SELECT  *
 FROM emp
 ORDER BY nvl(sysdate -hiredate,0) DESC ;
           
-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
 SELECT  ename, hiredate, sysdate-hiredate totoal_days,
        trunc((sysdate - hiredate)/7) weeks, ceil(mod(sysdate - hiredate,7))days
 FROM emp;

-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
 SELECT  ename,trunc(months_between(sysdate , hiredate))
 FROM emp
 WHERE Deptno = 10;

-- ���� ��¥���� 3�������� ��¥ ���ϱ�
 select  add_months( sysdate, 3 ) as mydate from dual;
 
-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
 SELECT next_day(sysdate,'��') from dual;      
 
-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
 SELECT last_day(sysdate) from dual;           