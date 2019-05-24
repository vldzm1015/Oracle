SELECT rownum, empno, ename FROM emp WHERE rownum<=5;




-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
SELECT avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
FROM emp
WHERE job = 'SALESMAN';
--�����Լ��� ���ؼ��� null ���� ó������

INSERT INTO emp(empno, ename, job)  VALUES (9988,'ȫȫ��', 'SALESMAN');

--Ŀ�̼�(COMM)�� �޴� ������� ����
SELECT COUNT(empno) cnt
FROM emp
WHERE nvl(comm,0) !=0;
-- ���� �ʴ�   !=  ,   <>   �ΰ��� ��밡��
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
-- �μ�ã�� ���ǰ� �׷����ϴ� ������ �ٸ�

 -- �μ������ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
SELECT deptno, count(*) cnt, round(avg(sal)) avg,  min(sal) min, max(sal) max , sum(sal) sum
FROM  emp
GROUP BY deptno;
-- group�ܿ� �ٸ� ���� ����ʹٸ� group�� ���� �����ֱ�
SELECT deptno, job, count(*) cnt, round(avg(sal)) avg,  min(sal) min, max(sal) max , sum(sal) sum
FROM  emp
GROUP BY deptno, job;
  
-- �μ������ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� (�μ��� �޿��� ���� ���� ������)
SELECT DEPTNO, COUNT(*) cnt, ROUND(AVG(sal)) avg, MIN(sal) min, MAX(sal) max, SUM(sal) sum
FROM EMP
GROUP BY DEPTNO
ORDER BY sum DESC;

-- �μ��������� �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
SELECT DEPTNO, JOB, COUNT(*) cnt, ROUND(AVG(sal)) avg, SUM(sal) sum
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

-- �޿��� �ִ� 2900 �̻��κμ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
SELECT DEPTNO,ROUND(AVG(sal)) avg, SUM(sal) sum
FROM EMP
GROUP BY DEPTNO
HAVING MAX(sal) >= 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
SELECT JOB, ROUND(AVG(sal)) avg, SUM(sal) sum
FROM EMP
GROUP BY JOB
HAVING ROUND(AVG(sal)) >= 3000;

-- ��ü �հ� �޿��� 5000���ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
-- ��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
SELECT JOB, COUNT(*) cnt, ROUND(AVG(sal)) avg, MIN(sal) min, MAX(sal) max, SUM(sal) sum
FROM EMP
WHERE JOB != 'SALESMAN'
GROUP BY JOB
HAVING SUM(sal) >= 5000
ORDER BY sum DESC;

-- �������ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
SELECT JOB, MAX(sal) - MIN(sal) sal_gap
FROM EMP
GROUP BY JOB;

-- �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
SELECT DEPTNO, COUNT(*), SUM(SAL) sum
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

[ GROUP BY ���� ����ϴ� �Լ� ] 
- ROLLUP : ����� �׷캰 �հ� ������ �߰�
- CUBE : �׷��� �� �÷��� �հ� ������ �߰�
 
select job, sum( sal ) from emp group by job;
select job, sum( sal ) from emp group by rollup(job);
select job, sum( sal ) from emp group by cube(job);
 