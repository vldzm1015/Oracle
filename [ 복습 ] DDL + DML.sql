CREATE TABLE GOGEK (
    ID      VARCHAR2(16),
    NAME    VARCHAR2(10) NOT NULL,
    TEL     CHAR(12),
    CONSTRAINT  PK_GOGEK_ID  PRIMARY  KEY ( ID ),
    CONSTRAINT uq_GOGEK_GOGEK UNIQUE (TEL)
    );

CREATE TABLE SANGPUM (
    NO            VARCHAR2(12),
    TITLE         VARCHAR2(20) NOT NULL,
    DETAIL        VARCHAR2(200),
    COUNT         NUMBER(20)NOT NULL,
    PRICE         NUMBER(20),
    CONSTRAINT  PK_SANGPUM_NO  PRIMARY  KEY ( NO )
    );
 
CREATE TABLE JUMUN (
    NO            CHAR(4),
    GOGEK         VARCHAR2(12) NOT NULL,
    SANGPUM       VARCHAR2(20),
    COUNT         NUMBER(20)NOT NULL,
    JUMUNIL       DATE,
    CONSTRAINT  PK_JUMUN_NO  PRIMARY  KEY ( NO ),
    CONSTRAINT JUMUN_FK_GOGEK FOREIGN KEY(GOGEK) REFERENCES GOGEK(ID),
    CONSTRAINT JUMUN_FK_SANGPUM FOREIGN KEY(SANGPUM) REFERENCES SANGPUM(NO)
    );
    
INSERT INTO gogek ( id, name, tel ) VALUES('babo1234','ȫ�浿', '031-333-3333' );
INSERT INTO gogek ( id, name, tel ) VALUES('babo1111','��浿', '031-111-1111' );
INSERT INTO gogek ( id, name, tel ) VALUES('babo2222','ȫ�浿', '031-222-2222' );
INSERT INTO gogek ( id, name, tel ) VALUES('babo9999','�ڱ浿', '031-333-3333' );
--UNIQUE ����
INSERT INTO gogek ( id, name, tel ) VALUES('babo1234','�ͱ浿', '031-999-9999' );
-- ����  ���Ἲ �������� ����. id �ߺ�.
INSERT INTO gogek ( id, name, tel ) VALUES('babo12345','�̱浿', '031-333-1234' );
INSERT INTO gogek ( id, name, tel ) VALUES('123','�ֱ浿', '031-999-9999' );
INSERT INTO gogek ( id, name ) VALUES('babo','���浿' );
INSERT INTO gogek ( id, tel ) VALUES('babo1988','031-888-8888' );
-- ���� name�� not null

INSERT INTO sangpum ( no, title, count,price, detail ) VALUES ('A00001','�̻۹���', 30, 1000, '�ΰ��̻��� �ݹ� �� �ȸ� �����Դϴ�' );
INSERT INTO sangpum ( no, title, count,price, detail ) VALUES ('A00002','�׳ɹ���', 20, 500, '�׳��̻��� ����� �����Դϴ�' );
INSERT INTO sangpum ( no, title, count )VALUES ('B00009','������', 20 );
INSERT INTO sangpum ( no, title, count,price ) VALUES ('Z0001','�����Ʈ', 3, 20000, '�̳� �����Ʈ�Դϴ�' );
-- ������ ���� �ȵ� �� ����
INSERT INTO sangpum VALUES ('Z00001','�����Ʈ2', 5, 20000, '�̳� ��� ��Ʈ�Դϴ�' );
-- ������ �������
INSERT INTO sangpum VALUES ('Z00001','�����Ʈ3','�̳� ��� ��Ʈ�Դϴ�', 5, 20000); 


INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1000, 'babo1234', 'A00001', 1, '2016/09/09' );
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1001, 'babo1233', 'Z00001', 1, '2016/09/09' );
--���� : �� �θ� ���� Ű ����
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1002, 'Babo1234', 'A00002', 2, '2016/09/10' );
--���� : �� �θ� ���� Ű ����. �빮��
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1003, 'babo1234', 'B00001', 1, '2016/09/11' );
--���� : ��ǰ �θ� ���� Ű ����
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1004, 'babo', 'Z00001', 1, '2016/10/11' );
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1005, 'babo1234', 'B00009', 1, '2016/11/11' );
INSERT INTO jumun(no, gogek, sangpum,count, jumunil) VALUES ( 1006, 'babo1234', 'B00009', 1, '2016/12/12' );

-- 1. ��ȭ��ȣ�� ���� ���� �������� ������ �˻��ϼ���
SELECT NAME
FROM gogek
WHERE TEL IS NULL;

-- 2. ȫ�� ���� ���� ������ ������ �˻��ϼ���
SELECT ID, NAME, TEL
FROM gogek
WHERE NAME LIKE 'ȫ%';

-- 3. babo2222 ������ �ڱ浿���� �����ϼ���
UPDATE  gogek SET NAME = '�ڱ浿' WHERE ID='babo2222';

-- 4. ���̵� 123 ���� ���̵� babo123 ���� �����ϼ���
UPDATE  gogek SET ID = 'babo123' WHERE ID='123';

-- 5. ���浿���� ��ȭ��ȣ 02-555-5555�� �߰��ϼ���
UPDATE  gogek SET TEL = '02-555-5555' WHERE NAME='���浿';

-- 6. ��ǰ��ȣ B00009 �� ���� 1200�� �׸��� ���̳� �ٽ��� ���Դϴ١���� ��ǰ������ �߰��ϼ���
UPDATE  sangpum SET DETAIL = '�̳� �ٽ��� ���Դϴ�' , PRICE = 1200 WHERE NO='B00009';

-- 7. �̻۹��� ��ǰ�� 10���� �ȷȽ��ϴ�.
UPDATE  sangpum SET COUNT = -10 , PRICE = 1200 WHERE TITLE='�̻۹���';

-- 8. Z00001 ��ǰ�� 3���� �� �԰� �Ǿ����ϴ�.
UPDATE  sangpum SET COUNT = +3  WHERE NO='Z00001';

-- 9. ��ǰ ������ 1000���� �Ѵ� ��ǰ���� �˻��ϼ���
SELECT * FROM sangpum;
SELECT TITLe FROM sangpum WHERE price > 1000;

-- 10. 11�� ���Ŀ� �ֹ��� ��ǰ ��ȣ�� �˻��ϼ���
SELECT * FROM JUMUN;
SELECT sangpum FROM JUMUN WHERE JUMUNIL > '16/11/01';

-- 11. babo ���� �ֹ��� ��ǰ�� A00002�� �����ϰ� ������ 2���� �����ϼ���
UPDATE  JUMUN SET SANGPUM = 'A00002', COUNT = 2  WHERE GOGEK='babo';

-- 12. babo1234 ���� 11���� �ֹ��� ��ǰ ��ȣ�� �˻��ϼ���
SELECT sangpum FROM jumun 
WHERE gogek='babo1234' and jumunil BETWEEN '16/11/01' AND '16/11/30' ;

-- 13. B00009 ��ǰ�� �ֹ��� �� ���̵� �˻��ϼ���
SELECT * FROM JUMUN;
SELECT GOGEK FROM JUMUN WHERE sangpum = 'B00009' ;

SELECT * FROM gogek;
SELECT * FROM JUMUN;
SELECT * FROM sangpum;










   