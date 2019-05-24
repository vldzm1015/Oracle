-- DDL

-- ���̺� ���� (CONSTAINT - X)
---------------------------------------------------------------------------------
CREATE TABLE DEPT(
DEPTID NUMBER(5)
, DEPTNAME VARCHAR(50)
);
---------------------------------------------------------------------------------


-- ���̺� ���� (CONSTAINT - X)
---------------------------------------------------------------------------------
CREATE TABLE EMP(
EMPID NUMBER(5)
, NAME VARCHAR2(20)
, REGI_ID CHAR(14)
, GENDER VARCHAR2(10)
, AGE NUMBER(5)
, DEPTID NUMBER(5) 
);
---------------------------------------------------------------------------------



-- ���̺� ���� (CONSTAINT - O / Į�� ����)
---------------------------------------------------------------------------------
CREATE TABLE DEPT(
DEPTID NUMBER(5) CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY
, DEPTNAME VARCHAR(50)
);

CREATE TABLE EMP(
EMPID NUMBER(5) CONSTRAINT PK_EMP_EMPID PRIMARY KEY
, NAME VARCHAR2(20) 
, RESID CHAR(14) CONSTRAINT UK_EMP_RESID UNIQUE 
, GENDER VARCHAR2(10) CONSTRAINT EMP_CK_GENDER CHECK(GENDER IN ('����', '����'))
, AGE NUMBER(5) 
, DEPTID NUMBER(5)
CONSTRAINT FK_EMP_DEPTID REFERENCES DEPT(DEPTID)
);
---------------------------------------------------------------------------------


-- ���̺� ���� (CONSTAINT - O / ���̺� ����)
---------------------------------------------------------------------------------
CREATE TABLE DEPT(
DEPTID NUMBER(5)
, DEPTNAME VARCHAR(50)
, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)
);

CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) NOT NULL
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) REFERENCES DEPT(DEPTID)
);
---------------------------------------------------------------------------------


-- ���̺� ���� (CONSTAINT - O / FK - ON DELETE CASCADE / ���̺� ����)
---------------------------------------------------------------------------------
CREATE TABLE DEPT(
DEPTID NUMBER(5)
, DEPTNAME VARCHAR(50)
, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)
);

CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) NOT NULL
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE CASCADE
);
---------------------------------------------------------------------------------

-- ���̺� ���� (CONSTAINT - O / FK - ON DELETE SET NULL / ���̺� ����)
---------------------------------------------------------------------------------
CREATE TABLE DEPT(
DEPTID NUMBER(5)
, DEPTNAME VARCHAR(50)
, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)
);

CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) 
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE SET NULL
);
---------------------------------------------------------------------------------



-- TEST DML (INSERT)

-- INSERT (TABLE: DEPT)
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10001, 'IT��');
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10002, '������');
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10003, '��������');

-- INSERT (TABLE: EMP)
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30001, '�ְ���', '881012-1187527', '����', 32, 10001);
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30002, '��ȿ��', '850712-1000007', '����', 35, 10002);
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30003, '������', '881112-1187527', '����', 32, 10003);


-- TEST DML (DELETE)
DELETE FROM DEPT WHERE DEPTID IN (10003);


-- SELECT ALL (BOTH)
SELECT * FROM DEPT;
SELECT * FROM EMP;


-- DROP (BOTH)
DROP TABLE EMP;
DROP TABLE DEPT;