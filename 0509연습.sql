 -- 1. sawon ���̺��� ����
 /*sabun�� 6�ڸ� ����
  sawon_name���ִ� �ѱ� 5�ڸ�
  ubmu���ִ� �ѱ� 10�ڸ�
  weolgub�������� 8�ڸ��� �Ҽ��� 2�ڸ�
  buseo�¼��� 3�ڸ�*/
 CREATE TABLE sawon(
    sabun       char(6),
    sawon_name  varchar2(10),
    ubmu        varchar2(20),
    weolgub     number(8,2),
    buseo       number(3)
    );
    
 -- 2. ���� ���̺��� sabun���⺻Ű�� ����
  ALTER TABLE sawon ADD
  CONSTRAINT  pk_sawon_sabun  PRIMARY  KEY ( sabun );
  
 --3. �ִ� �ѱ� 10�ڸ��� jiyeok �÷��� �߰��ϵ� NULL ���� �Էµ��� �ʵ��� ����   
  ALTER TABLE  sawon ADD ( jiyeok  varchar2(20)not null ); 
  
 --4. weolgub �÷��� ������7�ڸ��� ����
  ALTER TABLE sawon MODIFY(weolgub number (7));
  
 --5. ubmu�÷��� �����ߡ�, ������������, �������� �������� ������ �Էµǵ��� ����
  ALTER TABLE sawon ADD
  CONSTRAINT ck_sawon_ubmu CHECK (ubmu IN ( '����', '��������', '����' ));

 --6. ubmu�÷��� �����Ͱ� �Է��� �ȵ� ��� �����尪���� �����ߡ��� ����
  ALTER TABLE sawon MODIFY ( ubmu varchar2 default '����' );

 --7. buseo ���̺��� �����ϼ���
  /*       buseo_no�¼��� 3�ڷ� �̷���� ��ȣ�� �⺻Ű
           buseo_name���ִ� �ѱ� 10�ڸ� */
  CREATE TABLE buseo(
  buseo_no      number(3),
  buseo_name    varchar2(20),
CONSTRAINT  pk_busno  PRIMARY  KEY ( buseo_no )
  );
  
 --8. sawon ���̺��� buseo�÷��� buseo ���̺��� buseo_no�������ϴ� �ܷ�Ű�� ����
ALTER  TABLE   sawon
ADD  CONSTRAINT  fk_sawon_buseo FOREIGN KEY ( buseo ) REFERENCES  buseo ( buseo_no );

-- 9. buseo ���̺� ������ �Է�
/*  buseo_no    buseo_name
    101         ����Ʈ��������������
    202         ������
    303         �����ڿ���*/ 
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES (101,'����Ʈ��������������');    
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES (202,'������'); 
INSERT INTO buseo ( buseo_no, buseo_name ) VALUES (303,'�����ڿ���'); 

--10. sawon ���̺� ������ �Է� (�Է��� �ȵ� ��쵵 ����) 
/*  sabun       sawon_name      ubmu        weolgub     buseo       jiyeok
    8001        ȫ�浿�̱�                   100000      101          �λ�     --�Է�
    8002        ȫ����         �繫          200000      202          ��õ     --���� check
    8003        ȫ���         ����                      111          ����     --���� fk
    8004        ȫ�漮                      12345678                  ����     --���� (�ڸ����ɸ�)
    8005        ȫ��ö         ��������                   303          �Ǳ�*/   --�Է�
INSERT INTO sawon ( sabun, sawon_name, weolgub, buseo, jiyeok ) VALUES (8001,'ȫ�浿�̱�',100000,101,'�λ�' );  
INSERT INTO sawon ( sabun, sawon_name, ubmu, weolgub, buseo, jiyeok) VALUES (8002, 'ȫ����', '�繫', 200000, 202, '��õ');  
INSERT INTO sawon ( sabun, sawon_name, ubmu, buseo, jiyeok ) VALUES (8003, 'ȫ���', '����', 111, '����');  
INSERT INTO sawon ( sabun, sawon_name, weolgub, jiyeok ) VALUES (8004,'ȫ�漮',12345678,'����' );  
INSERT INTO sawon ( sabun, sawon_name, ubmu, buseo, jiyeok ) VALUES (8005,'ȫ��ö','��������', 303,'�Ǳ�' );  

-- 11. sawon ���̺��� jiyeok �÷��� ����
ALTER TABLE sawon DROP(jiyeok);

-- 12. buseo ���̺��� buseo ���� �������ڿ��Ρ��� ���� ����
DELETE FROM buseo WHERE buseo_name = '�����ڿ���'; 
-- �μ� ���̺��� �����ϰ� �־ ���� �Ұ���

--13. sawon ���̺��� ��� ������ �����ϰ� ��������� ����
DROP TABLE sawon;

  SELECT * FROM sawon;
   
   