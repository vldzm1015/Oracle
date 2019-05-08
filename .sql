-- SQL (DDL / DML / DCL )
-- DDL

select * from emp;

CREATE TABLE emp_copy AS
SELECT * FROM emp;

select * from emp_copy;

-- 1.�����ȣ�� 7782�� �μ��� 30 ������ ����
-- UPDATE  table_name SETcolumn=value WHEREcondition;
UPDATE   emp_copy SET deptno = 30 WHERE empno=7782;

-- 2.�����ȣ�� 7782�� ����� �̸��� ȫ������� �����ϰ� �޿��� 3500 ���� ����
-- UPDATE  table_name SETcolumn=value WHEREcondition;
UPDATE   emp_copy SET ename = 'ȫ���',sal = 3500 WHERE empno=7782;

--3. ��� �μ����� ���ʽ�(Comm)�� 300�� ����
-- UPDATE  table_name SETcolumn=value WHEREcondition;
UPDATE   emp_copy SET Comm = NVL(comm,0)+300;

--4.��� ��ȣ�� 7499�� ����� ������ ����
-- DELETE FROMtable_name WHEREcondition;
 DELETE  FROM emp_copy WHERE empno=7499;
 
 --5. �Ի����ڰ� 81�� 6�� 1�� ������ ����� ������ ����
 DELETE FROM emp_copy WHERE hiredate<'81.06.01';
 
 --6. �Ի�(��� : 9999, �����: ȫȫȫ, ���� : IT , ���� : 6000 )
 -- INSERT INTOtable_name( columns ) VALUES ( values );
  INSERT INTO emp_copy( empno, ename, job, sal ) VALUES ( 9999, 'ȫȫȫ', 'IT', 6000  );
 

CREATE TABLE STUDENT (
id char(4),
name varchar2(10),
kor	number(3),
math number(3),
total number(3),
avg number(5,2)
);

--���̺� ���� Ȯ��
DESC student;
--������(���ڵ�)Ȯ��
SELECT*FROM student;

--�������� �÷� �߰�(eng number(3))
-- ALTER   TABLE  table_name ADD ( [ column_name  data_type ] );
-- ALTER   TABLE  table_nameMODIFY( [ column_name  data_type ] ); 
-- ALTER   TABLE  table_nameDROP( [ column_name ] );
ALTER TABLE student ADD(eng number(3));
-- ���� �÷� ����
ALTER TABLE student DROP(total);
-- ��� �÷����� �Ҽ��� 1�ڸ� ����
ALTER TABLE student MODIFY(avg number(4,1));
DESC student;


---����Ÿ�Է�
INSERT INTO student VALUES('8001','ȫ���',100,80,0,50);
INSERT INTO student (id,name,math,eng) VALUES ('8088','ȫ�浿',55,88);

--����Ÿ(���ڵ�) Ȯ��
SELECT * FROM student;

--

