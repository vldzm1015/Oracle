/*
SELECT  �˻��� �׸��
From    ���̺��
WHERE   ����
*/
-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���
SELECT ename, sal, sal+NVL (comm,0) AS YEONBONG
FROM emp;


SELECT ename || ' ' || Job enameojb, sal, sal+NVL (comm,0) AS YEONBONG
FROM emp;
/*-���� ������ (||) :  ������̸��� ������ �����Ͽ� ��STAFF������ ���
                       SELECT   ename|| �� �� || job as staff FROM emp*/
            
-- ������̺��� �μ���ȣ�� ���
SELECT deptno FROM emp;
-- ��� ������̺��� �μ���ȣ ���
SELECT DISTINCT deptno FROM emp;
-- �ߺ��Ǵ� �����ʹ� ���� ���

-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT empno,ename,deptno 
FROM emp
WHERE deptno=20;

-- 2- �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
SELECT empno,ename,hiredate 
FROM emp
WHERE hiredate >='81/01/01' And  hiredate <= '81/06/09';
SELECT empno,ename,hiredate 
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/06/09';
--�ΰ����� ��밡��

-- 3- �������� salesman, clerk�� ������� �̸��� ������ ���
SELECT ename, job 
FROM emp
WHERE job lower(job) = 'salesman' OR  lower(job) = 'clerk' ;
SELECT ename,job FROM emp WHERE job = 'SALESMAN' or job = 'CLERK'; 

-- 4- ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
SELECT * FROM emp WHERE (JOB = 'PRESIDENT' AND SAL > 1500) OR (JOB = 'SALESMAN');

 
 /*
SELECT      �˻��� �׸��
From        ���̺��
WHERE       ����
ORDER BY    ���ı��� 
*/
 -- �μ���ȣ ���ĵ� ������̺� ���
SELECT *
FROM emp
ORDER BY deptno DESC;
-- null���� ū������ ����

-- �μ���ȣ ���ĵ� ������̺� ���
SELECT *
FROM emp
ORDER BY deptno ;
-- ���� ������� ���� null�� ���� ������

-- �μ���ȣ ���ĵ� ������ ���� ������ ������̺� ���
SELECT *
FROM emp
ORDER BY deptno, sal DESC;

-- �ֱ� �Ի������ �����, �޿�, �Ի��������
SELECT ename, sal, hiredate
FROM emp
ORDER BY hiredate DESC;
 
-- Ŀ�̼��� ���� ������ ���
SELECT *
FROM emp
ORDER BY nvl(comm,0) DESC;

-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT ename, sal, comm
FROM emp
WHERE comm IS NULL OR comm=0;

-- 8- �̸� A�� �����ϴ� ����� ���
SELECT ename
FROM emp
WHERE ename in 'A%' ;

-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���
SELECT ename
FROM emp
WHERE ename in '_L%' ;

-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ���
SELECT ENAME
FROM emp
WHERE ENAME in '%L%L%' ;

-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
SELECT *
FROM emp
WHERE comm is not null ;

-- 12- ���ʽ��� �޿����� 10%�� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���
SELECT ename, sal, comm
FROM emp
WHERE comm > sal*1.1 ;

-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
SELECT *
FROM emp
WHERE (JOB = 'CLERK' and sal!=1000 and SAL !=3000 and sal!=5000) AND(job = 'ANALYST' and sal!=1000 and sal !=3000 and sal!=5000);

SELECT *
FROM emp
WHERE (job = 'clerk' or job = 'analyst') AND(sal!=1000 and sal !=3000 and sal!=5000);

SELECT *
FROM emp
WHERE JOB in  ('CLERK', 'ANALYST') AND SAL not in (1000, 3000, 5000);

-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� ��� ����� ������ ���
SELECT *
FROM emp
WHERE (Job = 'clerk' or job = 'analyst') AND(sal =1000 or sal =3000 or sal =5000);

SELECT *
FROM emp
WHERE JOB in  ('clerk', 'analyst') AND sal in (1000, 3000, 5000);

-- 14 �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT *
FROM emp
WHERE deptno=30 OR mgr =7782; 
 
 SELECT * FROM emp;
 
