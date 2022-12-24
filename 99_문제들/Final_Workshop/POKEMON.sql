DELETE FROM POKEMON;

DROP TABLE POKEMON;
DROP TABLE TRAINER;

CREATE TABLE POKEMON(
PKNO NUMBER PRIMARY KEY,
PKNAME VARCHAR2(30) NOT NULL UNIQUE,
PKTYPE VARCHAR2(30) NOT NULL,
PKCLASS VARCHAR2(30) NOT NULL,
PKHEIGHT NUMBER,
PKWEIGHT NUMBER,
PKDETAIL VARCHAR2(200),
TRNO NUMBER REFERENCES TRAINER(TRNO)
);


CREATE TABLE TRAINER(
TRNO NUMBER UNIQUE,
TRID VARCHAR2(30) PRIMARY KEY,
TRPWD VARCHAR2(30) NOT NULL,
TRNAME VARCHAR2(30) NOT NULL UNIQUE
);


DROP SEQUENCE SEQ_PKNO;
CREATE SEQUENCE SEQ_PKNO
NOCACHE;


INSERT INTO TRAINER VALUES(0, 'admin', 'admin', '������');
INSERT INTO TRAINER VALUES(1, 'user01', 'pass01', '������');
INSERT INTO TRAINER VALUES(2, 'user02', 'pass02', '��');
INSERT INTO TRAINER VALUES(3, 'user03', 'pass03', '�̽�');

INSERT INTO POKEMON VALUES(SEQ_PKNO.NEXTVAL, '�̻��ؾ�', 'Ǯ', '�������ϸ�', 0.7, 6.9, '�¾������ �� ������ ���� �������κ��� ������ ���޹޾� ũ�� �����Ѵ�.', 0);
INSERT INTO POKEMON VALUES(SEQ_PKNO.NEXTVAL, '�̻��ؾ�', 'Ǯ', '�������ϸ�', 0.7, 6.9, '�¾������ �� ������ ���� �������κ��� ������ ���޹޾� ũ�� �����Ѵ�.', 0);
INSERT INTO POKEMON VALUES(SEQ_PKNO.NEXTVAL, '�̻��ؾ�', 'Ǯ', '�������ϸ�', 0.7, 6.9, '�¾������ �� ������ ���� �������κ��� ������ ���޹޾� ũ�� �����Ѵ�.', 0);
INSERT INTO POKEMON VALUES(SEQ_PKNO.NEXTVAL, '�̻��ؾ�', 'Ǯ', '�������ϸ�', 0.7, 6.9, '�¾������ �� ������ ���� �������κ��� ������ ���޹޾� ũ�� �����Ѵ�.', 0);



Commit;

SELECT *
FROM POKEMON JOIN TRAINER USING(TRNO) WHERE TRID = 'user01';

SELECT PKNO,PKNAME,PKTYPE,PKCLASS,PKHEIGHT,PKWEIGHT,TRNO 
FROM POKEMON JOIN TRAINER USING(TRNO) WHERE TRID = 'user01';

SELECT 
				p.PKNO
			  , p.PKNAME
			  , p.PKTYPE
			  , p.PKCLASS
			  , p.PKHEIGHT
			  , p.PKWEIGHT
			  , p.PKDETAIL
			  , t.TRNO
		 FROM   POKEMON p
		 	  , TRAINER t 
		 WHERE p.TRNO = t.TRNO 
		 AND t.TRID = 'user01'
         
         
         
         
         