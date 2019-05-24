 -- ��ȯ �Լ�
-- TO_CHAR
-- TO_DATE
-- TO_NUMBER
 
-- �Ի����ڿ��� �Ի�⵵�� ���
SELECT ename, hiredate, to_char(hiredate,'YYYY') hireyear
FROM emp;

-- �Ի����ڿ��� �Ի���� ���
SELECT ename, hiredate, to_char(hiredate,'MM') hiremonth
FROM emp;

-- �Ի����ڿ��� �Ի�⵵,���� ���
SELECT ename, hiredate, to_char(hiredate,'YYYY-MM') hireyear
FROM emp;

-- �Ի����ڿ��� �Ի����� ���
SELECT ename, hiredate, to_char(hiredate,'DD') hireday
FROM emp;

-- �Ի����ڿ��� �Ի� �� �� �� ���
SELECT ename, hiredate, to_char(hiredate,'hh:mi') hiretime
FROM emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
SELECT ename, hiredate, to_char(hiredate,'YYYY"��"MM"��"DD"��"') hireyear
FROM emp;           
-- 1981�⵵�� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE  to_char(hiredate,'YYYY') = 1981; 
-- 5���� �Ի��� ��� �˻�
SELECT *
FROM emp
WHERE  to_char(hiredate,'MM') = 05; 
-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���


--910111-2033333
SELECT name, decode( substr( jumin, 8, 1), '1', '����', '3', '����', '2', '����', '4', '����') AS gender
from info;

SELECT  CASE  substr(jumin, 8, 1) 
         WHEN '1' THEN '����'
         WHEN '3' THEN '����'
         ELSE '����'
        END    as gender
FROM   info;

-- �μ���ȣ�� 10�̸鿵����, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
SELECT ename, decode( deptno, '10', '������', '20', '������', '30', 'IT', '�����') AS deptno
from emp;

SELECT  CASE  deptno
         WHEN '10' THEN '������'
         WHEN '20' THEN '������'
         WHEN '30' THEN 'IT'
         ELSE '�����'
        END    as deptno
FROM   emp;  
SELECT * FROM emp;
-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���
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


           