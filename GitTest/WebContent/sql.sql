========================================================================================사용자
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
COMMENT ON TABLE t_member IS '회원 정보';

COMMENT ON COLUMN t_member.m_id IS '회원 아이디'
;

COMMENT ON COLUMN t_member.m_pwd IS '회원 비밀번호'
;

COMMENT ON COLUMN t_member.m_nickname IS '회원 닉네임'
;

COMMENT ON COLUMN t_member.m_gender IS '회원 성별'
;

COMMENT ON COLUMN t_member.m_addr IS '회원 주소'
;

COMMENT ON COLUMN t_member.m_grade IS '회원 등급'
;

COMMENT ON COLUMN t_member.m_point IS '회원 적립금'
;

COMMENT ON COLUMN t_member.m_joindate IS '가입 일자'
;

COMMENT ON COLUMN t_member.admin_yn IS '관리자 여부'
;
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
COMMENT ON TABLE t_board IS '게시판 정보'
;

COMMENT ON COLUMN t_board.article_seq IS '글 순번'
;

COMMENT ON COLUMN t_board.article_title IS '글 제목'
;

COMMENT ON COLUMN t_board.article_content IS '글 내용'
;

COMMENT ON COLUMN t_board.article_date IS '글 작성일자'
;

COMMENT ON COLUMN t_board.article_cnt IS '글 조회수'
;

COMMENT ON COLUMN t_board.m_id IS '글 작성자 아이디'
;

COMMENT ON COLUMN t_board.article_file1 IS '글 첨부파일1'
;

COMMENT ON COLUMN t_board.article_file2 IS '글 첨부파일2'
;

COMMENT ON COLUMN t_board.article_file3 IS '글 첨부파일3'
;

ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
;
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

COMMENT ON TABLE t_comment IS '댓글 테이블'
;
COMMENT ON COLUMN t_comment.comment_seq IS '댓글 순번'
;
COMMENT ON COLUMN t_comment.article_seq IS '원글 순번'
;
COMMENT ON COLUMN t_comment.comment_conent IS '댓글 내용'
;
COMMENT ON COLUMN t_comment.reg_date IS '작성 일자'
;
COMMENT ON COLUMN t_comment.m_id IS '작성자 아이디'
;
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_article_seq_t_boa FOREIGN KEY (article_seq)
        REFERENCES t_board (article_seq)
;
ALTER TABLE t_comment
    ADD CONSTRAINT FK_t_comment_m_id_t_member_m_i FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
;
=============================================================================================리뷰
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

COMMENT ON TABLE t_review IS '사용자 카페 리뷰'
;
COMMENT ON COLUMN t_review.cafe_id IS '카페ID'
;
COMMENT ON COLUMN t_review.review_seq IS '리뷰 순번'
;
COMMENT ON COLUMN t_review.review_content IS '리뷰 내용'
;
COMMENT ON COLUMN t_review.cafe_ratings IS '카페 평점'
;
COMMENT ON COLUMN t_review.review_pic IS '리뷰 사진'
;
COMMENT ON COLUMN t_review.m_id IS '작성자 아이디'
;
COMMENT ON COLUMN t_review.reg_date IS '작성 일자'
;
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)
;
ALTER TABLE t_review
    ADD CONSTRAINT FK_t_review_cafe_id_t_cafe_caf FOREIGN KEY (cafe_id)
        REFERENCES t_cafe (cafe_id)
;
===========================================================================================카페정보
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

COMMENT ON TABLE t_cafe IS '카페 테이블'
;

COMMENT ON COLUMN t_cafe.cafe_id IS '카페 아이디'
;

COMMENT ON COLUMN t_cafe.cafe_name IS '카페 이름'
;

COMMENT ON COLUMN t_cafe.cafe_pohne IS '카페 전화번호'
;

COMMENT ON COLUMN t_cafe.cafe_addr IS '카페 주소'
;

COMMENT ON COLUMN t_cafe.cafe_running_time IS '카페 영업시간'
;

COMMENT ON COLUMN t_cafe.cafe_info IS '카페 매장정보'
;

COMMENT ON COLUMN t_cafe.cafe_menu IS '카페 메뉴'
;

COMMENT ON COLUMN t_cafe.cafe_latitude IS '카페 위도'
;

COMMENT ON COLUMN t_cafe.cafe_longitude IS '카페 경도'
;

COMMENT ON COLUMN t_cafe.cafe_ranking IS '카페 인기순위'
;

COMMENT ON COLUMN t_cafe.cafe_new_yn IS '신규 카페 여부'
;

COMMENT ON COLUMN t_cafe.reg_date IS '등록 일자'
;
=======================================================================사진 저장
drop table t_cafeimages
CREATE TABLE t_cafeimages
(
    pic_id      VARCHAR2(20)     NOT NULL, 
    pic_path    VARCHAR2(150)    NOT NULL, 
    pic_type    NUMBER(12, 0)    NOT NULL, 
    reg_date    DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (pic_ID)
);
COMMENT ON TABLE t_cafeimages IS '카페 사진 정보'
;
COMMENT ON COLUMN t_cafeimages.pic_id IS '사진ID'
;
COMMENT ON COLUMN t_cafeimages.pic_path IS '카페 사진 경로'
;
COMMENT ON COLUMN t_cafeimages.pic_type IS '카페 사진 종류'
;
COMMENT ON COLUMN t_cafeimages.reg_date IS '등록 일자'
;
=========================================================================카페정보랑 이미지 관계테이블
drop table t_cafe_img
CREATE TABLE t_cafe_img
(
    cafe_id    VARCHAR2(20)    NOT NULL, 
    pic_id     VARCHAR2(20)    NOT NULL
)
;
COMMENT ON TABLE t_cafe_img IS '카페정보와 이미지를 연결하는 관계테이블'
;
COMMENT ON COLUMN t_cafe_img.cafe_id IS '카페ID'
;
COMMENT ON COLUMN t_cafe_img.pic_id IS '사진ID'
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
COMMENT ON TABLE t_jjim IS '찜목록 테이블'
;
COMMENT ON COLUMN t_jjim.m_id IS '찜한 ID'
;
COMMENT ON COLUMN t_jjim.cafe_id IS '유저가 찜한 카페들 '
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

insert into t_cafe values ('H1_01','형지',010-1111-1111,'형지네집','11:00~12:00','오늘 회식어때?','형지표 html',0,0,0,'n',sysdate);
insert into t_cafeimages values ('H1_01_01','./img/D1_01/food01.jpg',1,sysdate)
insert into t_cafe_img values('H1_01','H1_01_01')


insert into t_cafe_img values ('D01_01','D01_01_07');

select *from t_cafe 
where cafe_id=(select cafe_id from t_cafe_img where pic_id ='B2' ) "이미지를 넣으면 정보 나오게 하기"

select pic_path from t_cafeimages
where pic_id in (select pic_id from t_cafe_img where cafe_id ='A111') "이름을 누르면 이미지들 가져오기"

insert into t_member values('gusrb','1234','현규','MALE',0,0,sysdate,'n')
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


select * from t_cafeimages where pic_id=(select pic_id from t_cafe_img where rownum = 1 and cafe_id=(select cafe_id from t_cafe where cafe_name='딥그레이'))
=======
select * from t_cafe where cafe_name='도지커피';



<<<<<<< HEAD
select * from T_CAFEIMAGES order by DBMS_RANDOM.VALUE
select * from (
				select * from t_cafeimages where pic_id like 'D%'
				order by dbms_random.value);
				
delete from T_CAFE_IMG where pic_id like 'S04_01_60';
				
=======
select * from T_CAFEIMAGES where pic_id order by DBMS.RANDOM.VALUE
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/CafePlease.git
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/CafePlease.git

delete from T_CAFE_IMG where pic_id like 'N01_01_02';
delete from T_CAFE_IMG where pic_id like 'N01_01_03';
delete from T_CAFE_IMG where pic_id like 'N01_01_04';
delete from T_CAFE_IMG where pic_id like 'N01_01_05';
delete from T_CAFE_IMG where pic_id like 'N01_01_06';
delete from T_CAFE_IMG where pic_id like 'N01_01_07';
delete from T_CAFE_IMG where pic_id like 'N01_01_08';
delete from T_CAFE_IMG where pic_id like 'N01_01_09';
delete from T_CAFE_IMG where pic_id like 'N01_01_01';

delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in02.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in03.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in04.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in05.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in06.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in07.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in08.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in09.jpg';
delete from T_CAFEIMAGES where pic_path ='./img/N01_01/in01.jpg';


select T.pic_id, T.pic_path from t_cafeimages T, t_cafe_img I, t_cafe C where T.pic_id = I.pic_id and I.cafe_id = C.cafe_id and C.Cafe_name ='도지커피'
=======

>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-AI-7/CafePlease.git

select * from (select * from t_cafeimages where pic_id like 'D%' and not pic_type in ('3') order by dbms_random.value) 
