-- HR �������� ( employees ���̺� )

--1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
SELECT employee_id,  FIRST_NAME || ' ' || LAST_NAME as FULLNAME , HIRE_DATE
FROM employees
WHERE HIRE_DATE BETWEEN TO_DATE('03-01-01', 'YY-MM-DD') AND TO_DATE('03-12-31', 'YY-MM-DD');

SELECT employee_id,first_name || ' ' || last_name AS full_name,hire_date
FROM employees
WHERE to_char(hire_date,'YYYY')= '2003';
--2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
SELECT *
FROM employees
WHERE job_id='FI_ACCOUNT' OR  job_id='FI_MGR' OR  job_id='SA_MAN' OR  job_id='SA_REP' ;

--3. Ŀ�̼��� �޴� ������� ����� ���
SELECT employee_id,  FIRST_NAME || ' ' || LAST_NAME as FULLNAME 
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL AND commission_pct !=0;

--4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
SELECT    *,
CASE JOB_ID
WHEN 'SA_MAN' THEN '�Ǹźμ�'
WHEN 'SA_REP' THEN '�Ǹźμ�'
ELSE '�� �� �μ�'
END    as JOB_IDD
FROM   employees; 

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID,
CASE JOB_ID
WHEN 'SA_MAN' THEN '�Ǹźμ�'
WHEN 'SA_REP' THEN '�Ǹźμ�'
ELSE '�� �� �μ�'
END as duty
FROM employees;
SELECT employee_id,first_name || ' ' || last_name AS full_name,job_id,

decode(job_id, 'SA_MAN','�Ǹźμ�','SA_REP','�Ǹźμ�','�� �� �μ�') as duty
FROM employees;

