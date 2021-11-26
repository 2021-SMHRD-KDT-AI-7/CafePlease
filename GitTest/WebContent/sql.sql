========================================================================================�����
drop table t_member

CREATE TABLE t_member
(
    m_id          VARCHAR2(20)     NOT NULL, 
    m_pwd         VARCHAR2(20)     NOT NULL, 
    m_nickname    VARCHAR2(20)     NOT NULL, 
    m_gender      VARCHAR2(20)     NOT NULL, 
    m_addr        VARCHAR2(150)    NOT NULL, 
    m_grade       NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
    m_point       NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
    m_joindate    DATE             DEFAULT SYSDATE NOT NULL, 
    admin_yn      VARCHAR2(1)      DEFAULT 'N' NOT NULL, 
     PRIMARY KEY (m_id)
);
COMMENT ON TABLE t_member IS 'ȸ�� ����';

COMMENT ON COLUMN t_member.m_id IS 'ȸ�� ���̵�'
;

COMMENT ON COLUMN t_member.m_pwd IS 'ȸ�� ��й�ȣ'
;

COMMENT ON COLUMN t_member.m_nickname IS 'ȸ�� �г���'
;

COMMENT ON COLUMN t_member.m_gender IS 'ȸ�� ����'
;

COMMENT ON COLUMN t_member.m_addr IS 'ȸ�� �ּ�'
;

COMMENT ON COLUMN t_member.m_grade IS 'ȸ�� ���'
;

COMMENT ON COLUMN t_member.m_point IS 'ȸ�� ������'
;

COMMENT ON COLUMN t_member.m_joindate IS '���� ����'
;

COMMENT ON COLUMN t_member.admin_yn IS '������ ����'
;
=============================================================================================�Խ���
drop table t_board;
DROP SEQUENCE t_board_SEQ;
DROP TRIGGER t_board_AI_TRG;

CREATE TABLE t_board
(
    article_seq        NUMBER(12, 0)     NOT NULL, 
    article_title      VARCHAR2(150)     NOT NULL, 
    article_content    VARCHAR2(3000)    NOT NULL, 
    article_date       DATE              DEFAULT SYSDATE NOT NULL, 
    article_cnt        NUMBER(12, 0)     DEFAULT 0 NOT NULL, 
    m_id               VARCHAR2(20)      NOT NULL, 
    article_file1      VARCHAR2(150)     NULL, 
    article_file2      VARCHAR2(150)     NULL, 
    article_file3      VARCHAR2(150)     NULL, 
     PRIMARY KEY (article_seq)
)
;

CREATE SEQUENCE t_board_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_board_AI_TRG
BEFORE INSERT ON t_board 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_board_SEQ.NEXTVAL
    INTO :NEW.article_seq
    FROM DUAL
END;
COMMENT ON TABLE t_board IS '�Խ��� ����'
;

COMMENT ON COLUMN t_board.article_seq IS '�� ����'
;

COMMENT ON COLUMN t_board.article_title IS '�� ����'
;

COMMENT ON COLUMN t_board.article_content IS '�� ����'
;

COMMENT ON COLUMN t_board.article_date IS '�� �ۼ�����'
;

COMMENT ON COLUMN t_board.article_cnt IS '�� ��ȸ��'
;

COMMENT ON COLUMN t_board.m_id IS '�� �ۼ��� ���̵�'
;

COMMENT ON COLUMN t_board.article_file1 IS '�� ÷������1'
;

COMMENT ON COLUMN t_board.article_file2 IS '�� ÷������2'
;

COMMENT ON COLUMN t_board.article_file3 IS '�� ÷������3'
;

ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
;
======================================================================================== �Խ��� ����
drop table t_comment;
DROP SEQUENCE t_comment_SEQ;
DROP TRIGGER t_comment_AI_TRG;

CREATE TABLE t_comment
(
    comment_seq       NUMBER(12, 0)     NOT NULL, 
    article_seq       NUMBER(12, 0)     NOT NULL, 
    comment_conent    VARCHAR2(3000)    NOT NULL, 
    reg_date          DATE              DEFAULT SYSDATE NOT NULL, 
    m_id              VARCHAR2(20)      NOT NULL, 
     PRIMARY KEY (comment_seq)
);

CREATE SEQUENCE t_comment_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_comment_AI_TRG
BEFORE INSERT ON t_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_comment_SEQ.NEXTVAL
    INTO :NEW.comment_seq
    FROM DUAL
END;

COMMENT ON TABLE t_comment IS '��� ���̺�'
;
COMMENT ON COLUMN t_comment.comment_seq IS '��� ����'
;
COMMENT ON COLUMN t_comment.article_seq IS '���� ����'
;
COMMENT ON COLUMN t_comment.comment_conent IS '��� ����'
;
COMMENT ON COLUMN t_comment.reg_date IS '�ۼ� ����'
;
COMMENT ON COLUMN t_comment.m_id IS '�ۼ��� ���̵�'
;
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_article_seq_t_boa FOREIGN KEY (article_seq)
        REFERENCES t_board (article_seq)
;
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_m_id_t_member_m_i FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
;
=============================================================================================����
drop table t_review;
select * from t_review;
DROP SEQUENCE t_review_SEQ;
DROP TRIGGER t_review_AI_TRG;

CREATE TABLE t_review
(
    cafe_id           VARCHAR2(20)      NOT NULL, 
    review_seq        NUMBER(12, 0)     NOT NULL, 
    review_content    VARCHAR2(3000)    NOT NULL, 
    cafe_ratings      NUMBER(12, 0)     NOT NULL, 
    review_pic        VARCHAR2(150)     NULL, 
    m_id              VARCHAR2(20)      NOT NULL, 
    reg_date          DATE              DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (review_seq)
);

CREATE SEQUENCE t_review_SEQ
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER t_review_AI_TRG
BEFORE INSERT ON t_review 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_review_SEQ.NEXTVAL
    INTO :NEW.review_seq
    FROM DUAL
END;

COMMENT ON TABLE t_review IS '����� ī�� ����'
;
COMMENT ON COLUMN t_review.cafe_id IS 'ī��ID'
;
COMMENT ON COLUMN t_review.review_seq IS '���� ����'
;
COMMENT ON COLUMN t_review.review_content IS '���� ����'
;
COMMENT ON COLUMN t_review.cafe_ratings IS 'ī�� ����'
;
COMMENT ON COLUMN t_review.review_pic IS '���� ����'
;
COMMENT ON COLUMN t_review.m_id IS '�ۼ��� ���̵�'
;
COMMENT ON COLUMN t_review.reg_date IS '�ۼ� ����'
;
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
;
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_cafe_id_t_cafe_caf FOREIGN KEY (cafe_id)
        REFERENCES t_cafe (cafe_id)
;
===========================================================================================ī������
drop table t_cafe
CREATE TABLE t_cafe
(
    cafe_id              VARCHAR2(20)     NOT NULL, 
    cafe_name            VARCHAR2(50)     NOT NULL, 
    cafe_pohne           VARCHAR2(20)     NOT NULL, 
    cafe_addr            VARCHAR2(150)    NOT NULL, 
    cafe_running_time    VARCHAR2(20)     NOT NULL, 
    cafe_info            VARCHAR2(20)     NOT NULL, 
    cafe_menu            VARCHAR2(150)    NOT NULL, 
    cafe_latitude        NUMBER(17,14)    NOT NULL, 
    cafe_longitude       NUMBER(17,14)    NOT NULL, 
    cafe_ranking         NUMBER(12, 0)    NULL, 
    cafe_new_yn          VARCHAR2(1)      NOT NULL, 
    reg_date             DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (cafe_id)
);

COMMENT ON TABLE t_cafe IS 'ī�� ���̺�'
;

COMMENT ON COLUMN t_cafe.cafe_id IS 'ī�� ���̵�'
;

COMMENT ON COLUMN t_cafe.cafe_name IS 'ī�� �̸�'
;

COMMENT ON COLUMN t_cafe.cafe_pohne IS 'ī�� ��ȭ��ȣ'
;

COMMENT ON COLUMN t_cafe.cafe_addr IS 'ī�� �ּ�'
;

COMMENT ON COLUMN t_cafe.cafe_running_time IS 'ī�� �����ð�'
;

COMMENT ON COLUMN t_cafe.cafe_info IS 'ī�� ��������'
;

COMMENT ON COLUMN t_cafe.cafe_menu IS 'ī�� �޴�'
;

COMMENT ON COLUMN t_cafe.cafe_latitude IS 'ī�� ����'
;

COMMENT ON COLUMN t_cafe.cafe_longitude IS 'ī�� �浵'
;

COMMENT ON COLUMN t_cafe.cafe_ranking IS 'ī�� �α����'
;

COMMENT ON COLUMN t_cafe.cafe_new_yn IS '�ű� ī�� ����'
;

COMMENT ON COLUMN t_cafe.reg_date IS '��� ����'
;
=======================================================================���� ����
drop table t_cafeimages
CREATE TABLE t_cafeimages
(
    pic_id      VARCHAR2(20)     NOT NULL, 
    pic_path    VARCHAR2(150)    NOT NULL, 
    pic_type    NUMBER(12, 0)    NOT NULL, 
    reg_date    DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (pic_ID)
);
COMMENT ON TABLE t_cafeimages IS 'ī�� ���� ����'
;
COMMENT ON COLUMN t_cafeimages.pic_id IS '����ID'
;
COMMENT ON COLUMN t_cafeimages.pic_path IS 'ī�� ���� ���'
;
COMMENT ON COLUMN t_cafeimages.pic_type IS 'ī�� ���� ����'
;
COMMENT ON COLUMN t_cafeimages.reg_date IS '��� ����'
;
=========================================================================ī�������� �̹��� �������̺�
drop table t_cafe_img
CREATE TABLE t_cafe_img
(
    cafe_id    VARCHAR2(20)    NOT NULL, 
    pic_id     VARCHAR2(20)    NOT NULL
)
;
COMMENT ON TABLE t_cafe_img IS 'ī�������� �̹����� �����ϴ� �������̺�'
;
COMMENT ON COLUMN t_cafe_img.cafe_id IS 'ī��ID'
;
COMMENT ON COLUMN t_cafe_img.pic_id IS '����ID'
;
ALTER TABLE t_cafe_img
    ADD CONSTRAINT FK_t_cafe_img_cafe_id_t_cafe_c FOREIGN KEY (cafe_id)
        REFERENCES t_cafe (cafe_id)
;
ALTER TABLE t_cafe_img
    ADD CONSTRAINT FK_t_cafe_img_pic_id_t_cafeima FOREIGN KEY (pic_id)
        REFERENCES t_cafeimages (pic_id)
; 

=======================================================================================


CREATE TABLE t_jjim
(
    m_id    VARCHAR2(20)    NOT NULL, 
    cafe_id     VARCHAR2(20)    NOT NULL
)
;
COMMENT ON TABLE t_jjim IS '���� ���̺�'
;
COMMENT ON COLUMN t_jjim.m_id IS '���� ID'
;
COMMENT ON COLUMN t_jjim.cafe_id IS '������ ���� ī��� '
;
ALTER TABLE t_jjim
    ADD CONSTRAINT FK_t_jjim_cafe_id_t_cafe_c FOREIGN KEY (cafe_id)
        REFERENCES t_cafe (cafe_id)
;
ALTER TABLE t_jjim
    ADD CONSTRAINT FK_t_jjim_m_id_t_member FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
; 

=======================================================================================

select * from t_cafe
delete from t_member
select * from t_board
select * from t_cafeimages
select * from t_cafe_img

insert into t_cafe values ('H1_01','����',010-1111-1111,'��������','11:00~12:00','���� ȸ�ľ?','����ǥ html',0,0,0,'n',sysdate);
insert into t_cafeimages values ('H1_01_01','./img/D1_01/food01.jpg',1,sysdate)
insert into t_cafe_img values('H1_01','H1_01_01')


insert into t_cafe_img values ('D01_01','D01_01_07');

select *from t_cafe 
where cafe_id=(select cafe_id from t_cafe_img where pic_id ='B2' ) "�̹����� ������ ���� ������ �ϱ�"

select pic_path from t_cafeimages
where pic_id in (select pic_id from t_cafe_img where cafe_id ='A111') "�̸��� ������ �̹����� ��������"

insert into t_member values('gusrb','1234','����','MALE',0,0,sysdate,'n')
select * from t_member


select * from user_tables

select * from t_board

insert into t_board values(t_board_seq.NEXTVAL, 'test', 'test', sysdate, 0, 'test', 'test', 'test', 'test')

<<<<<<< HEAD
select * from t_board where article_seq=6

update t_board set article_title = 'testsdfsdf' , article_content = 'testghjghj', article_file1 = 'tesfghgfhgt', article_file2 = 'testsdfdf', article_file3 = 'testsdfs' where article_seq=6
=======
select * from t_review

select avg(cafe_ratings) from t_review
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/CafePlease.git

<<<<<<< HEAD
select * from t_cafeimages where pic_id like 'D%'

select * from t_jjim
=======
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/CafePlease.git

<<<<<<< HEAD


select * from t_cafeimages where pic_id=(select pic_id from t_cafe_img where rownum = 1 and cafe_id=(select cafe_id from t_cafe where cafe_name='���׷���'))
=======
select * from t_cafe where cafe_name='����Ŀ��';



select * from T_CAFEIMAGES where pic_id order by DBMS.RANDOM.VALUE
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/CafePlease.git
