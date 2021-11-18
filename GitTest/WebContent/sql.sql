========================================================================================사용자
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
COMMENT ON TABLE t_member IS '회원 정보';
COMMENT ON COLUMN t_member.m_id IS '회원 아이디';
COMMENT ON COLUMN t_member.m_pwd IS '회원 비밀번호';
COMMENT ON COLUMN t_member.m_nickname IS '회원 닉네임';
COMMENT ON COLUMN t_member.m_gender IS '회원 성별';
COMMENT ON COLUMN t_member.m_grade IS '회원 등급';
COMMENT ON COLUMN t_member.m_point IS '회원 적립금';
COMMENT ON COLUMN t_member.m_joindate IS '가입 일자';
COMMENT ON COLUMN t_member.admin_yn IS '관리자 여부';
=============================================================================================게시판
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

COMMENT ON TABLE t_board IS '게시판 정보';
COMMENT ON COLUMN t_board.article_seq IS '글 순번';
COMMENT ON COLUMN t_board.article_title IS '글 제목';
COMMENT ON COLUMN t_board.article_content IS '글 내용';
COMMENT ON COLUMN t_board.article_date IS '글 작성일자';
COMMENT ON COLUMN t_board.article_cnt IS '글 조회수';
COMMENT ON COLUMN t_board.m_id IS '글 작성자 아이디';
COMMENT ON COLUMN t_board.article_file1 IS '글 첨부파일1';
COMMENT ON COLUMN t_board.article_file2 IS '글 첨부파일2';
COMMENT ON COLUMN t_board.article_file3 IS '글 첨부파일3';
ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id);
======================================================================================== 게시판 리뷰
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

COMMENT ON TABLE t_comment IS '댓글 테이블';
COMMENT ON COLUMN t_comment.comment_seq IS '댓글 순번';
COMMENT ON COLUMN t_comment.article_seq IS '원글 순번';
COMMENT ON COLUMN t_comment.comment_conent IS '댓글 내용';
COMMENT ON COLUMN t_comment.reg_date IS '작성 일자';
COMMENT ON COLUMN t_comment.m_id IS '작성자 아이디';
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_article_seq_t_boa FOREIGN KEY (article_seq)
        REFERENCES t_board (article_seq);
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_m_id_t_member_m_i FOREIGN KEY (m_id)
        REFERENCES t_member (m_id);
=============================================================================================리뷰
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
COMMENT ON TABLE t_review IS '사용자 카페 리뷰';
COMMENT ON COLUMN t_review.review_seq IS '리뷰 순번';
COMMENT ON COLUMN t_review.review_content IS '리뷰 내용';
COMMENT ON COLUMN t_review.cafe_ratings IS '카페 평점';
COMMENT ON COLUMN t_review.review_pic IS '리뷰 사진';
COMMENT ON COLUMN t_review.m_id IS '작성자 아이디';
COMMENT ON COLUMN t_review.reg_date IS '작성 일자';
COMMENT ON COLUMN t_review.cafe_code IS '카페코드';
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id);
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_cafe_code_t_cafe_c FOREIGN KEY (cafe_code)
        REFERENCES t_cafe (cafe_code);
        
===========================================================================================카페정보
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
COMMENT ON TABLE t_cafe IS '카페 테이블';
COMMENT ON COLUMN t_cafe.cafe_code IS '카페 고유번호';
COMMENT ON COLUMN t_cafe.cafe_name IS '카페 이름';
COMMENT ON COLUMN t_cafe.cafe_pohne IS '카페 전화번호';
COMMENT ON COLUMN t_cafe.cafe_running_time IS '카페 영업시간';
COMMENT ON COLUMN t_cafe.cafe_latitude IS '카페 위도';
COMMENT ON COLUMN t_cafe.cafe_longitude IS '카페 경도';
COMMENT ON COLUMN t_cafe.cafe_addr IS '카페 주소';
COMMENT ON COLUMN t_cafe.cafe_pic1 IS '카페 사진1';
COMMENT ON COLUMN t_cafe.cafe_pic2 IS '카페 사진2';
COMMENT ON COLUMN t_cafe.cafe_pic3 IS '카페 사진3';
COMMENT ON COLUMN t_cafe.cafe_tag IS '검색태그';
COMMENT ON COLUMN t_cafe.reg_date IS '등록 일자';
COMMENT ON COLUMN t_cafe.m_id IS '등록자 아이디';