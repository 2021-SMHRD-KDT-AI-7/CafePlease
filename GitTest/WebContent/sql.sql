========================================================================================�����
drop table t_member
CREATE TABLE t_member
(
    m_id            VARCHAR2(20)     NOT NULL, 
    m_pwd           VARCHAR2(20)     NOT NULL, 
    m_nickname      VARCHAR2(20)     NOT NULL, 
    m_gender        VARCHAR2(1)      NOT NULL, 
    m_grade         NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
    m_point         NUMBER(12, 0)    DEFAULT 0 NOT NULL, 
    m_joindate      DATE             DEFAULT SYSDATE NOT NULL, 
    admin_yn        VARCHAR2(1)      DEFAULT 'N' NOT NULL, 
     PRIMARY KEY (m_id)
);
COMMENT ON TABLE t_member IS 'ȸ�� ����';
COMMENT ON COLUMN t_member.m_id IS 'ȸ�� ���̵�';
COMMENT ON COLUMN t_member.m_pwd IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN t_member.m_nickname IS 'ȸ�� �г���';
COMMENT ON COLUMN t_member.m_gender IS 'ȸ�� ����';
COMMENT ON COLUMN t_member.m_grade IS 'ȸ�� ���';
COMMENT ON COLUMN t_member.m_point IS 'ȸ�� ������';
COMMENT ON COLUMN t_member.m_joindate IS '���� ����';
COMMENT ON COLUMN t_member.admin_yn IS '������ ����';
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

COMMENT ON TABLE t_board IS '�Խ��� ����';
COMMENT ON COLUMN t_board.article_seq IS '�� ����';
COMMENT ON COLUMN t_board.article_title IS '�� ����';
COMMENT ON COLUMN t_board.article_content IS '�� ����';
COMMENT ON COLUMN t_board.article_date IS '�� �ۼ�����';
COMMENT ON COLUMN t_board.article_cnt IS '�� ��ȸ��';
COMMENT ON COLUMN t_board.m_id IS '�� �ۼ��� ���̵�';
COMMENT ON COLUMN t_board.article_file1 IS '�� ÷������1';
COMMENT ON COLUMN t_board.article_file2 IS '�� ÷������2';
COMMENT ON COLUMN t_board.article_file3 IS '�� ÷������3';
ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id);
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
)
;
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

COMMENT ON TABLE t_comment IS '��� ���̺�';
COMMENT ON COLUMN t_comment.comment_seq IS '��� ����';
COMMENT ON COLUMN t_comment.article_seq IS '���� ����';
COMMENT ON COLUMN t_comment.comment_conent IS '��� ����';
COMMENT ON COLUMN t_comment.reg_date IS '�ۼ� ����';
COMMENT ON COLUMN t_comment.m_id IS '�ۼ��� ���̵�';
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_article_seq_t_boa FOREIGN KEY (article_seq)
        REFERENCES t_board (article_seq);
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_m_id_t_member_m_i FOREIGN KEY (m_id)
        REFERENCES t_member (m_id);
=============================================================================================����
drop table t_review;
DROP SEQUENCE t_review_SEQ;
DROP TRIGGER t_review_AI_TRG;

CREATE TABLE t_review
(
    review_seq        NUMBER(12, 0)     NOT NULL, 
    review_content    VARCHAR2(3000)    NOT NULL, 
    cafe_ratings      NUMBER(12, 0)     NOT NULL, 
    review_pic        VARCHAR2(150)     NULL, 
    m_id              VARCHAR2(20)      NOT NULL, 
    reg_date          DATE              DEFAULT SYSDATE NOT NULL, 
    cafe_code         VARCHAR2(20)      NULL, 
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
COMMENT ON TABLE t_review IS '����� ī�� ����';
COMMENT ON COLUMN t_review.review_seq IS '���� ����';
COMMENT ON COLUMN t_review.review_content IS '���� ����';
COMMENT ON COLUMN t_review.cafe_ratings IS 'ī�� ����';
COMMENT ON COLUMN t_review.review_pic IS '���� ����';
COMMENT ON COLUMN t_review.m_id IS '�ۼ��� ���̵�';
COMMENT ON COLUMN t_review.reg_date IS '�ۼ� ����';
COMMENT ON COLUMN t_review.cafe_code IS 'ī���ڵ�';
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id);
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_cafe_code_t_cafe_c FOREIGN KEY (cafe_code)
        REFERENCES t_cafe (cafe_code);
        
===========================================================================================ī������
drop table t_cafe
CREATE TABLE t_cafe
(
    cafe_code            VARCHAR2(20)     NOT NULL, 
    cafe_name            VARCHAR2(50)     NOT NULL, 
    cafe_pohne           VARCHAR2(20)     NOT NULL, 
    cafe_running_time    VARCHAR2(20)     NOT NULL, 
    cafe_latitude        NUMBER(17,14)    NULL, 
    cafe_longitude       NUMBER(17,14)    NULL, 
    cafe_addr            VARCHAR2(150)    NOT NULL, 
    cafe_pic1            VARCHAR2(150)    NULL, 
    cafe_pic2            VARCHAR2(150)    NULL, 
    cafe_pic3            VARCHAR2(150)    NULL, 
    cafe_tag             VARCHAR2(20)     NULL, 
    reg_date             DATE             DEFAULT SYSDATE NOT NULL, 
    m_id                 VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (cafe_code)
);
COMMENT ON TABLE t_cafe IS 'ī�� ���̺�';
COMMENT ON COLUMN t_cafe.cafe_code IS 'ī�� ������ȣ';
COMMENT ON COLUMN t_cafe.cafe_name IS 'ī�� �̸�';
COMMENT ON COLUMN t_cafe.cafe_pohne IS 'ī�� ��ȭ��ȣ';
COMMENT ON COLUMN t_cafe.cafe_running_time IS 'ī�� �����ð�';
COMMENT ON COLUMN t_cafe.cafe_latitude IS 'ī�� ����';
COMMENT ON COLUMN t_cafe.cafe_longitude IS 'ī�� �浵';
COMMENT ON COLUMN t_cafe.cafe_addr IS 'ī�� �ּ�';
COMMENT ON COLUMN t_cafe.cafe_pic1 IS 'ī�� ����1';
COMMENT ON COLUMN t_cafe.cafe_pic2 IS 'ī�� ����2';
COMMENT ON COLUMN t_cafe.cafe_pic3 IS 'ī�� ����3';
COMMENT ON COLUMN t_cafe.cafe_tag IS '�˻��±�';
COMMENT ON COLUMN t_cafe.reg_date IS '��� ����';
COMMENT ON COLUMN t_cafe.m_id IS '����� ���̵�';