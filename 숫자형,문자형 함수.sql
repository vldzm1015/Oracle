--�����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
SELECT ename, sal, round(sal/12,2) "����" 
FROM emp;

 --�����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
 SELECT ename, sal, trunc(sal*0.033,-1)  TAX 
 FROM emp;

  select  '-' || trim(' �̼��� ')|| '-' as col1, 
          '-'|| ltrim(' �̼��� ') || '-' as col2, 
          '-'|| rtrim(' �̼��� ') || '-' as col3 
  from dual;
  --dual �������̺�, ������ Ȯ�� �� �� ���
  --(*) dual : dummy ���̺�� sys user�� owner�̰� ��� ����ڰ� ��밡��.
  SELECT    '-' || replace(' �� �� �� ','','')|| '-' as col 
  FROM dual; 
  select * from emp;
  SELECT SYSDATE FROM DUAL;
  
  
  
  
-- smith�������� �����ȣ, ����, ������(�ҹ���) ���
SELECT  EMPNO, ENAME, LOWER(JOB) as job
FROM emp
where ENAME = 'SMITH';  

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ��빮��)�� ���
SELECT  EMPNO, INITCAP(ENAME) as ENAME, INITCAP(jOB) as JOB
FROM emp;           

-- �̸��� ù���ڰ� ��K������ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE SUBSTR(ename,0,1)>'K' and SUBSTR(ename,0,1)<'Y'
ORDER BY ename;

-- �̸��� 5���� �̻��λ������ ���
SELECT *
FROM emp
WHERE LENGTH(ename)>=5;

-- �̸��� 15�ڷ� ���߰���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
SELECT RPAD(ename, 15, '*') as ename
FROM emp;

-- ������ 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
SELECT LPAD(sal, 10, '-') as sal
FROM emp;

-- ������ ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
SELECT  translate (sal, '0123456789', '�����̻�����ĥ�ȱ�')
FROM emp;           
 
-- ������ ���ڿ��� 0����$���� �ٲپ� ���
SELECT  replace (sal, '0', '$')
FROM emp;  






  