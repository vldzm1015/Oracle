-- ����Ŭ ���Խ� ǥ��
-- �Ʒ��� ���� ���̺��� �����ϰ� ���ڵ带 �Է��� ��
-- REGEXP_LIKE  �ܿ� REGEXP_REPALCE,REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT �Լ��� ���� �׷��� �Ʒ��� ������ regexp_like �Լ��� �̿��Ͽ��� ������.
 
-- ���̺� ����
CREATE TABLE reg_tab( text varchar2(20) );
 
-- ���ڵ� �Է�
INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('��');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('�����');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('����');
 
-- Ŀ��
COMMIT;

--[ ���� ]
SELECT *FROM reg_tab;
-- 1.  text �÷��� ���ڿ����� 't'�ν����ϴ� ������ �˻�
 SELECT * 
 FROM reg_tab
 WHERE  REGEXP_LIKE( text,'^t');
 
-- 2. text �÷��� ���ڿ����� 't'�� ������ ������ �˻�
 SELECT * 
 FROM reg_tab
 WHERE  REGEXP_LIKE( text,'t$');
 
-- 3. ù��° 't'�ν����Ͽ� 5��° 'r'�� �ִ� ������ �˻�
 SELECT * 
 FROM reg_tab
 WHERE  REGEXP_LIKE( text,'^t...r') ; 
 
-- 4. ���ڷ� ������ ������ �˻�
 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'\d$') ;
 
 select*
from reg_tab
where REGEXP_LIKE(text, '[0-9]$');
 
-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�
 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^\d') ;
 
select*
from reg_tab
where REGEXP_LIKE(text, '[0-9]$');
 
-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�
SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^\D') ; 
 

-- 7. �빮�ڷ� �����ϴ� ������ �˻�
 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^[A-Z]') ; 

 
-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�
SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE (text,'^[a-z]') ; 
 
-- 9. �ѱ۷� �����ϴ� ������ �˻�
select*
from reg_tab
where REGEXP_LIKE(text, '^[��-�R]');

-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�
select*
from reg_tab
where REGEXP_LIKE(text, 'gg|GG');
