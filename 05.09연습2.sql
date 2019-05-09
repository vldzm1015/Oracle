--<< �������� >>
-- �λ���� ( hr ���� )���� EMPLOYEES ���̺���

--1. EMPLOYEES ���̺��� ��� �̸��� first_name�� last_name�� ���� full_name���� ���
SELECT FIRST_NAME || ' ' || LAST_NAME   AS FULL_NAME FROM employees;
  --AS�� ��������, ����Ǵ°� �ƴϹǷ� ������ ����ؾ���
  
--2. �μ���ȣ�� 30(���źμ�)�̰� �޿� 10000�̸��� ����� full_name�� ����,�μ���ȣ�� ���
SELECT FIRST_NAME || ' ' || LAST_NAME   AS FULL_NAME , SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 AND SALARY < 10000 ;

--3. �μ���ȣ�� 30�̰� �޿��� 10000�޷� ���ϸ� �޴� 2006�⵵ ���� �Ի��� ����� full_name�� ���
SELECT FIRST_NAME || ' ' || LAST_NAME   AS FULL_NAME 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 AND SALARY <= 10000 AND HIRE_DATE < TO_DATE('2006-01-01', 'YYYY-MM-DD') ;

SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, DEPARTMENT_ID, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 AND SALARY <= 10000 AND HIRE_DATE < '06/01/01';

--4. �μ���ȣ�� 30(���źμ�)�̰� �޿��� 10000������ ����� �μ���ȣ�� 60(IT�μ�)���� �޿��� 5000�̻��� ����� ��ȸ
SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 30 AND SALARY <= 10000) OR (DEPARTMENT_ID = 60 AND SALARY>= 5000);

--5. �����ȣ�� 110������ 120���� ��� �� �޿��� 5000���� 10000������ �������� ��ȸ
SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, SALARY, EMPLOYEE_ID
FROM EMPLOYEES
WHERE (EMPLOYEE_ID BETWEEN 110 AND 120) AND (SALARY BETWEEN 5000 AND 10000); 

--6. �����ȣ�� 110������ 120���� �ƴ� ����� ��ȸ
SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT BETWEEN 110 AND 120;

--7. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�)�� ���� ����� ��ȸ
SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30, 60, 90);

--8. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�) ���� �μ��� ���� ����� ��ȸ
SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (30, 60, 90);

--9. ��ȭ��ȣ���� 590���� �����ϴ� ������ ��ȭ��ȣ�� ��ȸ
SELECT FIRST_NAME || ' ' || LAST_NAME as FULLNAME, PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '590%';