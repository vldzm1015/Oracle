----SQL(DDL / DML / DCL)

--- DDL



select * from emp;



CREATE TABLE emp_copy AS 

SELECT * FROM emp;



select *from emp_copy;



--1. �����ȣ�� 7782�� ����� �μ��� 30������ ����

--UPDATE  table_name SET column=value WHERE condition;

UPDATE  emp_copy SET deptno=30 WHERE empno=7782;



--2. �����ȣ�� 7782�� ����� �̸��� ȫ������� �����ϰ� �޿��� 3500���� ����

UPDATE  emp_copy SET ename = 'ȫ���',sal=3500 WHERE empno=7782;



--3. ��� �μ����� ���ʽ��� 300�� �λ� ����

UPDATE emp_copy SET comm =nvl(comm,0)+300;  

    -- null�� ���ȵ�. null�� 0���� �ٲ������.

    -- nvl(comm,0): comm�� ���Ե� null ���� 0���� �ٲٰڽ��ϴ�.

    -- ��ü�� �ٲܶ��� where �Ⱦ�. where�� ���� �� ������ ��. 



--4. �����ȣ�� 7499�� ����� ������ ����

DELETE FROM emp_copy WHERE empno=7499;



--5. �Ի����ڰ� 81�� 6�� 1�� ������ ����� ������ ����

DELETE FROM emp_copy WHERE hiredate < '81/06/01';



--6. �Ի�(��� : 9999, ����� : ���θ�, ���� : IT, ���� : 6000)

INSERT INTO emp_copy(empno,ename,job,sal) values (9999,'������','IT',6000);



--7. data ����

DELETE From emp_copy;



--8. table ��ü ����

DROP TABLE emp_copy;



--9. table ����

CREATE TABLE student(id char(4),name varchar2(10),kor number(3),math number(3),total number(3),avg number(5,2));



--���̺� ���� Ȯ��

DESC student;



-- ������(���ڵ�) Ȯ��

SELECT * FROM student;



-- ���� ���̺� �������� �߰�

ALTER TABLE student ADD(eng number(3));



-- ���� �÷� ����

ALTER TABLE student DROP(total);

-- ��� �÷����� �Ҽ��� ���ڸ��� ����

ALTER TABLE student MODIFY(avg number(4,1));



-- data �Է�

INSERT INTO student VALUES('8001','ȫ���',100,80,0,50);

INSERT INTO student(id,name,kor,math,eng) VALUES('8088','ȫ�浿',55,66,88);

--��ü table Ȯ��

SELECT * FROM student;



-- ȫ�浿 �л��� ��հ��� �Է��ϼ���.



UPDATE student SET avg=(kor+math+eng)/3 where name='ȫ�浿';