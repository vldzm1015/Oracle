CREATE TABLE ACCOUNT(
ACCOUNT_NUM VARCHAR2(20),
CUSTOMER VARCHAR2(20),
AMOUNT INT,
CONSTRAINT ACCOUNT_PK_ACCOUNT_NUM PRIMARY KEY (ACCOUNT_NUM));

INSERT INTO ACCOUNT(ACCOUNT_NUM,CUSTOMER,AMOUNT) VALUES ('111-11-111','ȫ�浿',10000); 
INSERT INTO ACCOUNT(ACCOUNT_NUM,CUSTOMER,AMOUNT) VALUES ('222-22-222','������',2000); 
commit;

select * from account;



SELECT
    *
FROM video;
/*
select ������ȣ, ����, ����, ��ȭ��ȣ, 
            �뿩��+3 �ݳ�������, '�̳�'�ݳ�����

from �뿩���̺� r �������̺� v �����̺� c

where r.������ȣ = v. ������ȣ
	and r.��ȭ��ȣ = c.��ȭ��ȣ
    */
    
SELECT v.V_NUM, v.TITLE, c.NAME, r.TEL, r.RENTDAY, r.AVAILABLE
FROM RENT r INNER JOIN video v 
on r.v_num = v.v_num
INNER JOIN customer c
on c.s_tel = r.tel
where sysdate = rentday+3 or available= 'F';

SELECT
    *
FROM rent;