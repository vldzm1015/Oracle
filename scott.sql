 -- emp( ������̺� )�� 8000 ����� ���� �̸����� ���� 1000 ����Ÿ�Է�
 -- INSERT             INTOtable_name( columns ) VALUES ( values );
 INSERT   INTO emp ( empno, ENAME, SAL ) VALUES ( 8000, '������' , 1000 );
 --�Է�
 INSERT   INTO emp ( empno, ENAME, SAL ) VALUES ( 8000, '��������' , 1000 ); 
 --���Ἲ �������� ����
 INSERT   INTO emp ( empno, ENAME, SAL ) VALUES ( 7787, '��������' , 9000 ); 
 --�Է�
 INSERT   INTO emp ( empno, ENAME, SAL , deptno ) VALUES ( 8001, '��������' , 9000 , 20 ); 
 --�Է�
 INSERT   INTO emp ( empno, ENAME, SAL , deptno ) VALUES ( 8002, 'ȫ���' , 9000 , 60 ); 
 --���Ἲ �������� ����
 
 -- INSERT / EDLETE / UPDATE  �� ��쿡�� cmommit / rollbaack �߿� ����ϸ��
-- cmommit;  -- �۾����� ����
-- rollbaack; -- ��������x ( �Ǽ����� ��� rollbaack�ϸ� ������ cmommit �������� ���ư�) 
 
 desc emp; 
 -- ����Ȯ��
 

 SELECT * FROM emp;  
 -- ����Ȯ��
 
 
 /*
    ���̺�� : info
    hakbun  char(14)
    name    varchar2(10)
    jumin   char(4)
    gender  varchar2(10)
    age     number(3)   --  ( -999  ~ +999 )
 */
 /* ����Ÿ �Է�
    1001 �й� ȫ�浿
    1002 �й� ��浿
    1003 �й� �ͱ浿
    �ֹι�ȣ�� 801212-123467�� ȫ�浿�л�
    26�� ���� �Է�

*/
 
 CREATE TABLE info(
    hakbun  char(4),
    name    varchar2(10),
    jumin   char(14),
    gender  varchar2(10),
    age     number(3));
 
 desc info;
 SELECT * FROM info;
 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1001', 'ȫ�浿' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '��浿' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '�ͱ浿' ); 
 INSERT   INTO info ( jumin, name ) VALUES ( '801212-123467', 'ȫ�浿' ); 
 INSERT   INTO info ( gender, age ) VALUES ( '����', '26' ); 
 -- PRIMARY  KEY ���� ������ ������ �ߺ�����
 
 SELECT * FROM info;
 delete FROM info;    
 
 -- �������� ( �⺻Ű )  --���̺��� ����� ���߿� ���������� �ɾ��ִ� ���
ALTER  TABLE   info
ADD  CONSTRAINT  pk_info_hakbun  PRIMARY  KEY ( hakbun );
 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1001', 'ȫ�浿' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '��浿' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '�ͱ浿' ); --����
 INSERT   INTO info ( jumin, name ) VALUES ( '801212-123467', 'ȫ�浿' ); --����
 INSERT   INTO info ( gender, age ) VALUES ( '����', '26' ); --����

 
 -- �������� Ȯ��
 SELECT constraint_name , constraint_type
 FROM user_constraints;
 
 DROP TABLE info;
 
/* 
���̺� ���� �������� ���
 CREATE TABLE  table_name 
  ( column_name  data_type,
    CONSTRAINT  fk_name FOREIGN  KEY (column_name )
     REFERENCES    ef_table_name  ( ref_column_name )
 );
 */
 
 -- ���̺��� ����� �������� ���������� �����ϴ� ���
 CREATE TABLE info(
    hakbun  char(4),
    name    varchar2(10),
    jumin   char(14),
    gender  varchar2(10),
    age     number(3),
 CONSTRAINT  pk_info_hakbun  PRIMARY  KEY ( hakbun ) 
 /* CONSTRAINT uq_info_jumin UNIQUE (jumin); */
 );
 
  DELETE FROM info; 
 --NOT NULL 
 ALTER TABLE INFO MODIFY (name varchar2(10) not null);
 desc info;
 INSERT   INTO info ( hakbun, name ) VALUES ( '1001', 'ȫ�浿' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '��浿' ); 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1002', '�ͱ浿' ); --����
 INSERT   INTO info ( jumin, name ) VALUES ( '801212-123467', 'ȫ�浿' ); --����
 INSERT   INTO info (  hakbun, gender, age ) VALUES ('1111', '����', '26' ); --����
  
 -- PRIMARY  KEY : ������ ���;��ϰ� �ߺ��Ұ�
 --UNIQUE �ȵ��͵� ��������� ���´ٸ� �ߺ��Ұ�
 ALTER TABLE info ADD
 CONSTRAINT uq_info_jumin UNIQUE (jumin);
 
 SELECT * FROM INFO;
 INSERT   INTO info (  hakbun, name , jumin ) VALUES ('1003', '�ͱ浿', '990101-1234567' );
 INSERT   INTO info (  hakbun, name , jumin ) VALUES ('1004', '�ڱ浿', '990101-1234567' ); 
 --���� jumin -UNIQUE
 INSERT   INTO info (  name , jumin ) VALUES ('�ֱ浿', '980101-1234567' ); 
 --���� hakbun -PRIMARY  KEY 
 INSERT   INTO info ( hakbun, name  ) VALUES ( '1005', '���浿' ); 
 
 --CHECK
ALTER TABLE info ADD 
CONSTRAINT ck_info_gender CHECK (gender IN ( 'M', 'F' ));

INSERT   INTO info ( hakbun, name ,gender  ) VALUES ( '1006', '��浿', 'M' ); 
INSERT   INTO info ( hakbun, name ,gender  ) VALUES ( '1007', '���浿', 'F' ); 
INSERT   INTO info ( hakbun, name ,gender  ) VALUES ( '1008', '�ȱ浿', '����' );
--����  gender���� M or F �� �� �� �ִ�.
 
 --defalut : ���������� �ƴ����� �������ǰ� ���� ���� ��� / �⺻������
 ALTER TABLE info MODIFY ( gender char(4)default 'M' );
 
 INSERT   INTO info ( hakbun, name ) VALUES ( '1009', '���浿' ); 
 --gender ���� ���ؼ� �⺻���� M���� ������
 
  DROP TABLE info;

CREATE TABLE info(
    hakbun  char(4),
    name    varchar2(10) not null,
    jumin   char(14),
    gender  varchar2(10)default 'M',
    age     number(3),
    deptno  number(2),
    CONSTRAINT  pk_info_hakbun  PRIMARY  KEY ( hakbun ),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender IN ( 'M', 'F' )),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
 );
 
INSERT INTO info ( hakbun, name, gender, deptno ) VALUES ('9000','������', 'F', 10); 
INSERT INTO info ( hakbun, name, gender, deptno ) VALUES ('9001','������', 'F', 50); --����
INSERT INTO info ( hakbun, name, gender, deptno ) VALUES ('9001','������', 'F', 40); 
 
DROP TABLE info;
 
  

   
   
 
 
 
 
 