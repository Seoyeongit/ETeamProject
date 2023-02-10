CREATE USER forpets IDENTIFIED BY pets;
GRANT Connect, RESOURCE TO forpets;
GRANT create view, create synonym to forpets;

-- 2023.02.06 테이블 수정 (이서연)
-- community 테이블 생성
CREATE TABLE COMMUNITY 
(
    C_CODE VARCHAR2(20) NOT NULL,           -- 소모임 코드
    C_TITLE VARCHAR2(100) NOT NULL,          -- 제목
    C_CONTENT VARCHAR2(2000) NOT NULL,       -- 내용
    USER_ID VARCHAR2(20) NOT NULL,          -- 회원 아이디
    C_DATE DATE DEFAULT SYSDATE             -- 날짜
);

INSERT INTO COMMUNITY VALUES('c0000000000','산책 좋아하시나요?',' 관악구에 사시는분 주말에 같이 산책 하실분 구합니다.','abc123',sysdate);
INSERT INTO COMMUNITY VALUES('c0000000001','동안구 산책러 구합니다','동안구 범계역 근처 중앙공원에서 산책하실 분! 구해영','tjdus776',sysdate);
INSERT INTO COMMUNITY VALUES('c0000000002','사람 산책도 가능한가요?','강아지대신 저를 산책해 주실 분 구합니다','pow111',sysdate);
INSERT INTO COMMUNITY VALUES('c0000000003','인삼 개껌 공구하실분','개껌 5개 반값 할인 같이 공구하시분 구합니다. 맛도좋아요.','joke12',sysdate);

ALTER TABLE COMMUNITY
    ADD CONSTRAINT C_CODE_PK PRIMARY KEY (C_CODE);

-- 시간 한국 표준시 (맥북)
-- ALTER SESSION SET TIME_ZONE = '09:00';


-- community 댓글 
CREATE TABLE COMDAT
(
    D_NUM NUMBER(10) NOT NULL,         	   -- 시퀀스 
    D_CODE VARCHAR2(20) NOT NULL,          -- 소모임 코드
    USER_ID VARCHAR2(20) NOT NULL,         -- 회원 아이디
    D_CONTENT VARCHAR2(500) NOT NULL,      -- 댓글 내용
    D_DATE DATE DEFAULT SYSDATE            -- 날짜
);



CREATE SEQUENCE CD_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE COMDAT
    ADD CONSTRAINT D_NUM_PK PRIMARY KEY (D_NUM);
   

INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000000','abc123','신청했습니다~ 쪽주세요~', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000001','tjdus776','안녕따리 안녕 따', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000002','pow111','와 이런게 있네요.', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000003','joke12','저용 >< 이름은 단추입니당', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000004','play66','알바천국에 문의하세요.', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000005','ghost44','안사요', sysdate);


SELECT * FROM comdat;
DROP TABLE COMDAT;


-- 설문지 생성 table 
CREATE TABLE SURVEY
(
    S_SVCODE VARCHAR2(20) NOT NULL,     -- 설문지 코드
    S_CODE VARCHAR2(20) NOT NULL,       -- 소모임 코드
    S_TITLE VARCHAR2(200) NOT NULL,      -- 제목
    S_DATE DATE DEFAULT SYSDATE            -- 날짜
);

ALTER TABLE survey
    ADD CONSTRAINT S_SVCODE_PK PRIMARY KEY (s_svcode);

INSERT INTO SURVEY VALUES('s0000000000','c0000000000','관악구 사는 비숑 산책 같이해요', sysdate);
INSERT INTO SURVEY VALUES('s0000000001','c0000000001','개대신 사람 산책하실 분 신청 받습니다', sysdate);
INSERT INTO SURVEY VALUES('s0000000002','c0000000002','산책 조아합니다 일주일에 2번이상', sysdate);
INSERT INTO SURVEY VALUES('s0000000003','c0000000003','안양 산책러 구합니다', sysdate);

SELECT * FROM SURVEY; 
DROP TABLE SURVEY;

-- 설문지 문제 table 
CREATE TABLE SURVEY_DETAIL
(
    SD_NUMBER NUMBER(15) NOT NULL,      -- 시퀀스
    SD_SVCODE VARCHAR2(20) NOT NULL,    -- 설문지 코드
    SD_TYPE VARCHAR2(20) NOT NULL,      -- 질문 유형
    SD_TITLE VARCHAR2(200) NOT NULL,     -- 질문 제목
    SD_ORDER VARCHAR2(20) NOT NULL      -- 순서 코드
);

CREATE SEQUENCE sd_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_detail
    ADD CONSTRAINT SD_NUMBER_PK PRIMARY KEY (sd_number);
   
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','gaek','일주일에 산책 빈도수를 알려주세용ㅋ','od01');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','check','가능한 요일을 모두 선택해주세요', 'od02');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','ju','강아지종이 무엇인가요?', 'od03');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','schedule','강아지 생일이 무엇인가요?', 'od04');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','time','산책 시간대를 알려주세요', 'od05');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000002','gaek','사람을 좋아하시나요 ?', 'od01');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000002','ju','인간 존재 가치에 대해서 자신의 의견을 서술해주세요.', 'od02');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000002','schedule','저의 생일은 언제일까요?', 'od03');

DROP TABLE SURVEY_DETAIL ;
SELECT * FROM SURVEY_DETAIL;

-- 설문지 문제 답변 table (문제에 따른 답변 생성)
CREATE TABLE SURVEY_CHOICE
(
    SC_NUMBER NUMBER(10) NOT NULL,      -- 시퀀스
    SC_SVCODE VARCHAR2(20) NOT NULL,    -- 설문지 코드
    SC_ORDER VARCHAR2(20) NOT NULL,     -- 순서 코드
    SC_ASCODE VARCHAR2(20) NOT NULL,    -- 답변 코드
    SC_ANSWER VARCHAR2(600) NULL    -- 답변 내용
);

CREATE SEQUENCE sc_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_choice
    ADD CONSTRAINT SC_NUMBER_PK PRIMARY KEY (SC_number);
   
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g01','0번');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g02','1번');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g03','2번');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g04','3번 이상');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c01','월요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c02','화요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c03','수요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c04','목요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c05','금요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od03','j01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od04','s01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od05','t01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od01','g01','YES');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od01','g02','NO');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od02','j01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od02','s01', null);

SELECT * FROM SURVEY_CHOICE;
DROP TABLE SURVEY_CHOICE;

-- 설문지 문제 답변 (설문지를 보고 회원이 직접 답변한 내용)
CREATE TABLE SURVEY_ANSWER
(
    SA_NUMBER NUMBER(10) NOT NULL,      -- 시퀀스
    SA_SVCODE VARCHAR2(20) NOT NULL,       -- 설문지 코드
    SA_ORDER VARCHAR2(10) NOT NULL,     -- 순서 코드
    SA_ASCODE VARCHAR2(10) NOT NULL,    -- 답변 코드
    USER_ID VARCHAR2(20) NOT NULL,      -- 회원 아이디
    SA_CONTENT VARCHAR2(600) NULL       -- 답변 내용
);

CREATE SEQUENCE sa_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_answer
    ADD CONSTRAINT SA_NUMBER_PK PRIMARY KEY (sa_number);

INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od01','g03','abc123','3번');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od02','c01','abc123','월요일');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od02','c03','abc123','수요일');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od03','j01','abc123','요크셔테리어');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od04','s01','abc123','2011-11-25');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od04','t01','abc123','13:00');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od01','g01','pow111','YES');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od02','j01','pow111','태어나서?');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od03','s01','pow111','2000-11-13');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od01','g02','ghost44','NO');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od02','j01','ghost44','지구멸망');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od03','s01','ghost44','1892-12-24');

DROP TABLE survey_answer;
SELECT * FROM survey_answer;




-- 230203 최지혁 SQL
-- reserv table sequence
CREATE SEQUENCE reserve_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- reserve table
-- 예약확인페이지에서 구분하기위해서 status칼럼을 추가했습니다.
-- pickup 서비스에서 사용할 주소 칼럼을 추가했습니다.
CREATE TABLE reserve
(   
    reserve_num NUMBER(8) NOT NULL,     -- 예약 번호 -- 시퀀스
    reserve_day VARCHAR2(20) NULL,      -- 예약 날짜 /// 데이트타입 고려
    reserve_time VARCHAR2(20) NULL,     -- 예약 시간 /// 데이트타입 고려
    reserve_add VARCHAR2(200) NULL,      -- 예약 주소
    s_num NUMBER(8) NOT NULL,     -- 서비스 번호
    user_id VARCHAR2(20) NOT NULL,      -- 회원 아이디
    part_id VARCHAR2(20) NOT NULL ,      -- 파트너 아이디
    pet_id NUMBER NOT NULL, --펫 아이디 펫테이블과 중복데이터가 많을것같으니 pet_id를 fk로 데이터를 받아오는것이 좋을것 같습니다.
    -- 예약상태 230126
    status number(2) DEFAULT 1, --예약상태 1:매칭중 2:매칭완료/케어중 3:케어완료
    -- pickup 서비스 사용할 주소
    pick_add varchar2(200) NULL,
    -- 요청사항
    reserve_request VARCHAR2(2000) NULL
);

-- reserve table primary key
ALTER TABLE reserve ADD CONSTRAINT reserve_num PRIMARY KEY (reserve_num);

-- reserve table 초기값
INSERT INTO reserve(reserve_num, reserve_day, reserve_time, reserve_add, s_num, user_id, part_id, pet_id) VALUES((reserve_seq.NEXTVAL), '2023-01-14', '14:30', '경기도 안산시 단원구 선부광장 1로 81 1509동 111호', '1', 'abc123', 'ppp222', '1');
INSERT INTO reserve(reserve_num, reserve_day, reserve_time, reserve_add, s_num, user_id, part_id, pet_id) VALUES((reserve_seq.NEXTVAL), '2023-01-14', '14:30', '경기도 안산시 단원구 선부광장 1로 81 1503동 111호', '2', 'abc456', 'bpb222', '2');
INSERT INTO reserve(reserve_num, reserve_day, reserve_time, reserve_add, s_num, user_id, part_id, pet_id, pick_add) VALUES((reserve_seq.NEXTVAL), '2023-01-14', '14:30', '경기도 안산시 단원구 선부광장 1로 81 1507동 111호', '4', 'abc789', 'bow444', '3', '경기도 안산시 단원구 선부광장 1로 81 동네병원');

-- serv table sequence
CREATE SEQUENCE serv_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- serv table
CREATE TABLE serv
(
    s_num NUMBER(8) NOT NULL,   -- 서비스 번호
    s_name VARCHAR2(20) NULL,   -- 서비스 이름
    s_price NUMBER(8) NULL      -- 서비스 가격
);

-- serv table primary key
ALTER TABLE serv ADD CONSTRAINT s_num PRIMARY KEY (s_num);

-- serv table 초기값
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '기본', 15000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '산책', 30000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '픽업', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '병원', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '미용', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '샤워', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '훈련', 50000);

select * from serv;

-- tip_board sequence
CREATE SEQUENCE tip_board_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- tip_board table
CREATE TABLE tip_board
(
    tip_seq NUMBER(8) NOT NULL,             -- 번호 (자동증가) 시퀀스
    tip_title VARCHAR2(100) NOT NULL,       -- 제목
    tip_content VARCHAR2(500) NOT NULL,     -- 내용
    tip_img_url VARCHAR2(200) NULL,         -- 이미지
    tip_video VARCHAR2(200) NULL,           -- 영상
    tip_create_date DATE DEFAULT sysdate,          -- 발행일
    tip_hit NUMBER(10) NOT NULL,            -- 조회수
    tip_update_date DATE DEFAULT sysdate NULL   -- 수정일
);

-- tip_board primary key
ALTER TABLE tip_board ADD CONSTRAINT tip_seq PRIMARY KEY (tip_seq);

-- tip_board table 초기값
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'꿀팁','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'전수','전수입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'강아지','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'고양이','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'애들','꿀팁입니당',NULL,NULL,1,NULL);

--230203 연은비 DB수정리스트
--table이름 수정 signUp -> users
--add byte크기 수정 50->200
CREATE TABLE users
( user_id VARCHAR2(20) NOT NULL,    -- 회원 아이디
  user_pw VARCHAR2(50) NOT NULL,    -- 회원 비밀번호
  user_name VARCHAR2(15) NOT NULL,  -- 회원 이름
  user_nick VARCHAR2(30) NOT NULL,  -- 회원 닉네임
  user_add VARCHAR2(200) NOT NULL,   -- 주소
  gender CHAR(1) NOT NULL,          -- 성별
  phnumber VARCHAR2(20) NULL,       -- 핸드폰번호
  birth DATE NULL,                  -- 생년월일
  war NUMBER NULL,                  -- 경고 횟수
  user_no NUMBER NULL,              -- 회원 번호 - 시퀀스
  data_create DATE NOT NULL         -- 가입날짜
);

ALTER TABLE users
    ADD CONSTRAINT user_id PRIMARY KEY (user_id);

CREATE SEQUENCE user_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

DROP TABLE users;


--users table 초기값 
INSERT INTO users VALUES('abc123','abc123','김작두','무당','서울시 관악구 신림동 100-1', 'M','010-1111-2222','1989-01-01','0',(user_seq.NEXTVAL),'2023-01-14');
INSERT INTO users VALUES('abc456','abc456','김명태','어부','경기도 과천시 주암동 122-2', 'M','010-2323-1212','1983-06-07','0',(user_seq.NEXTVAL),'2023-01-14');
INSERT INTO users VALUES('abc789','abc789','홍당무','채소가게','서울시 서초구 우면동 30-3', 'F','010-3412-5454','1977-07-07','0',(user_seq.NEXTVAL),'2023-01-14');


--table이름 수정 partSignTup -> partners 
--add byte크기 수정 50->200
CREATE TABLE partners
(
  part_id VARCHAR2(20) NOT NULL,    -- 파트너 아이디
  part_pw VARCHAR2(50) NOT NULL,    -- 파트너 비밀번호
  part_name VARCHAR2(15) NOT NULL,  -- 파트너 이름
  part_nick VARCHAR2(30) NOT NULL,  -- 파트너 닉네임
  part_add VARCHAR2(200) NOT NULL,   -- 주소
  gender CHAR(1) NOT NULL,          -- 성별
  part_phnumber VARCHAR2(20) NULL,  -- 핸드폰번호
  birth DATE NULL,                  -- 생년월일
  war NUMBER NULL,                  -- 경고 횟수
  part_no NUMBER NULL,              -- 회원 번호
  data_create DATE NOT NULL,        -- 가입날짜
  self_infor VARCHAR2(500)          -- 자기소개
);

CREATE SEQUENCE part_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE partners
    ADD CONSTRAINT part_id PRIMARY KEY (part_id);

DROP TABLE partners;

--partners table 초기값 
INSERT INTO partners VALUES('ppp222','ppp222','김칼날','파트너','경기도 의왕시 학의동 42-42', 'm','010-5232-2121','1989-01-01','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('bpb222','bpb222','양태양','파트너','서울시 종로구 계동 212-2', 'm','010-5757-3572','1977-07-07','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('bow444','bow444','장독대','파트너','서울시 영등포구 영등포동 321-1', 'f','010-5777-1414','1988-06-17','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('ang1004','ang1004','임천사','파트너','서울시 강서구 화곡동 1004-1', 'f','010-1004-1004','1994-10-04','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('sho232','sho232','정발산','파트너','경기도 남양주시 다산동 34-34', 'm','010-4989-4989','1972-07-02','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('pvp322','pvp322','김질서','파트너','서울시 강동구 고덕동 56-6', 'f','010-7575-2727','1993-07-05','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('ghg989','ghg989','양팔구','파트너','서울시 송파구 거영동 168-2', 'm','010-2929-9292','1992-02-09','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('led333','led333','이빛나','파트너','경기도 성남시 중원구 금광동 933-1', 'f','010-6443-4321','1995-03-16','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('uoi777','uoi777','신한방','파트너','서울시 서초구 양재동 688-2', 'm','010-8234-5432','1969-06-06','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('spp888','spp888','조선소','파트너','서울시 서초구 방배동 42-2', 'm','010-8787-2131','1981-01-01','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');





-- **해당테이블은 테이블생성 -> sys로 메타데이터생성-> 인덱스생성후 -> 테이블drop삭제하고 -> 테이블 다시 생성하세요**
-- 230120 pet_img 컬럼추가 pet_work컬럼삭제
CREATE TABLE user_pet
(
    pet_id NUMBER NOT NULL,
    pet_name VARCHAR2(20) NULL,
    pet_type VARCHAR2(20) NULL,
    pet_img VARCHAR2(2000) NULL,
    pet_age NUMBER(8) NULL,
    pet_gender CHAR(1) NULL,
    user_id VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE user_pet_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE user_pet
    ADD CONSTRAINT pet_id PRIMARY KEY (pet_id);

ALTER TABLE user_pet
    ADD (CONSTRAINT F_2 FOREIGN KEY (user_id) REFERENCES users(user_id)on delete cascade);
--user데이터가 삭제되면 펫데이터도 삭제된다.

DROP TABLE user_pet;

--user_pet table 초기값
INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),'뽀또','dog',null,'2','m','abc123');
INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),'치즈','cat',null,'4','f','abc456');
INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),'펀치','cat',NULL,'3','m','abc789');


--산책DB생성
--산책로생성 fk는 users테이블의 user_id
create table user_work(
str_user_id varchar2(20),
geom sdo_geometry,

CONSTRAINT work_fk FOREIGN KEY (str_user_id) REFERENCES USERS (user_id)on delete cascade
);

drop table user_work;
--메타데이터생성
insert into user_sdo_geom_metadata
(table_name, column_name, diminfo, srid)
values
('user_work','geom',sdo_dim_array(
    sdo_dim_element('longitude',0,100,0.05),
    sdo_dim_element('latituyde',0,100,0.05)),
    8307);

--인덱스생성(검색기능의향상을위함)
create index user_work_IDX 
on user_work(geom)
indextype is MDSYS.SPATIAL_INDEX;

--user_work  table 초기값
INSERT INTO user_work (str_user_id,geom)
VALUES ( 'abc123',
        SDO_GEOMETRY(2003, 4326, NULL,
          SDO_ELEM_INFO_ARRAY(1,1003,3),
          SDO_ORDINATE_ARRAY(37.61753810334461,126.91323151432047, 
                             37.61734422641554,126.91300803714323,
                             37.61708324626182,126.91342459624484,
                             37.61734696756152,126.91367347804402)) );

--x,y검색
SELECT str_user_id, x, y, id
FROM user_work, TABLE(SDO_UTIL.GETVERTICES(user_work.geom))
WHERE STR_USER_ID='abc123'
order by id;

CREATE USER forpets IDENTIFIED BY pets;
GRANT Connect, RESOURCE TO forpets;
GRANT create view, create synonym to forpets;

-- 2023.02.06 테이블 수정 (이서연)
-- community 테이블 생성
CREATE TABLE COMMUNITY 
(
    C_CODE VARCHAR2(20) NOT NULL,           -- 소모임 코드
    C_TITLE VARCHAR2(100) NOT NULL,          -- 제목
    C_CONTENT VARCHAR2(2000) NOT NULL,       -- 내용
    USER_ID VARCHAR2(20) NOT NULL,          -- 회원 아이디
    C_DATE DATE DEFAULT SYSDATE             -- 날짜
);

INSERT INTO COMMUNITY VALUES('c0000000000','산책 좋아하시나요?',' 관악구에 사시는분 주말에 같이 산책 하실분 구합니다.','abc123',sysdate);
INSERT INTO COMMUNITY VALUES('c0000000001','동안구 산책러 구합니다','동안구 범계역 근처 중앙공원에서 산책하실 분! 구해영','tjdus776',sysdate);
INSERT INTO COMMUNITY VALUES('c0000000002','사람 산책도 가능한가요?','강아지대신 저를 산책해 주실 분 구합니다','pow111',sysdate);
INSERT INTO COMMUNITY VALUES('c0000000003','인삼 개껌 공구하실분','개껌 5개 반값 할인 같이 공구하시분 구합니다. 맛도좋아요.','joke12',sysdate);

ALTER TABLE COMMUNITY
    ADD CONSTRAINT C_CODE_PK PRIMARY KEY (C_CODE);

-- 시간 한국 표준시 (맥북)
-- ALTER SESSION SET TIME_ZONE = '09:00';


-- community 댓글 
CREATE TABLE COMDAT
(
    D_NUM NUMBER(10) NOT NULL,         	   -- 시퀀스 
    D_CODE VARCHAR2(20) NOT NULL,          -- 소모임 코드
    USER_ID VARCHAR2(20) NOT NULL,         -- 회원 아이디
    D_CONTENT VARCHAR2(500) NOT NULL,      -- 댓글 내용
    D_DATE DATE DEFAULT SYSDATE            -- 날짜
);



CREATE SEQUENCE CD_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE COMDAT
    ADD CONSTRAINT D_NUM_PK PRIMARY KEY (D_NUM);
   

INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000000','abc123','신청했습니다~ 쪽주세요~', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000001','tjdus776','안녕따리 안녕 따', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000002','pow111','와 이런게 있네요.', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000003','joke12','저용 >< 이름은 단추입니당', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000004','play66','알바천국에 문의하세요.', sysdate);
INSERT INTO comdat VALUES((cd_seq.NEXTVAL),'c0000000005','ghost44','안사요', sysdate);


SELECT * FROM comdat;
DROP TABLE COMDAT;


-- 설문지 생성 table 
CREATE TABLE SURVEY
(
    S_SVCODE VARCHAR2(20) NOT NULL,     -- 설문지 코드
    S_CODE VARCHAR2(20) NOT NULL,       -- 소모임 코드
    S_TITLE VARCHAR2(200) NOT NULL,      -- 제목
    S_DATE DATE DEFAULT SYSDATE            -- 날짜
);

ALTER TABLE survey
    ADD CONSTRAINT S_SVCODE_PK PRIMARY KEY (s_svcode);

INSERT INTO SURVEY VALUES('s0000000000','c0000000000','관악구 사는 비숑 산책 같이해요', sysdate);
INSERT INTO SURVEY VALUES('s0000000001','c0000000001','개대신 사람 산책하실 분 신청 받습니다', sysdate);
INSERT INTO SURVEY VALUES('s0000000002','c0000000002','산책 조아합니다 일주일에 2번이상', sysdate);
INSERT INTO SURVEY VALUES('s0000000003','c0000000003','안양 산책러 구합니다', sysdate);

SELECT * FROM SURVEY; 
DROP TABLE SURVEY;

-- 설문지 문제 table 
CREATE TABLE SURVEY_DETAIL
(
    SD_NUMBER NUMBER(15) NOT NULL,      -- 시퀀스
    SD_SVCODE VARCHAR2(20) NOT NULL,    -- 설문지 코드
    SD_TYPE VARCHAR2(20) NOT NULL,      -- 질문 유형
    SD_TITLE VARCHAR2(200) NOT NULL,     -- 질문 제목
    SD_ORDER VARCHAR2(20) NOT NULL      -- 순서 코드
);

CREATE SEQUENCE sd_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_detail
    ADD CONSTRAINT SD_NUMBER_PK PRIMARY KEY (sd_number);
   
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','gaek','일주일에 산책 빈도수를 알려주세용ㅋ','od01');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','check','가능한 요일을 모두 선택해주세요', 'od02');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','ju','강아지종이 무엇인가요?', 'od03');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','schedule','강아지 생일이 무엇인가요?', 'od04');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000001','time','산책 시간대를 알려주세요', 'od05');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000002','gaek','사람을 좋아하시나요 ?', 'od01');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000002','ju','인간 존재 가치에 대해서 자신의 의견을 서술해주세요.', 'od02');
INSERT INTO SURVEY_DETAIL VALUES((sd_seq.NEXTVAL),'s0000000002','schedule','저의 생일은 언제일까요?', 'od03');

DROP TABLE SURVEY_DETAIL ;
SELECT * FROM SURVEY_DETAIL;

-- 설문지 문제 답변 table (문제에 따른 답변 생성)
CREATE TABLE SURVEY_CHOICE
(
    SC_NUMBER NUMBER(10) NOT NULL,      -- 시퀀스
    SC_SVCODE VARCHAR2(20) NOT NULL,    -- 설문지 코드
    SC_ORDER VARCHAR2(20) NOT NULL,     -- 순서 코드
    SC_ASCODE VARCHAR2(20) NOT NULL,    -- 답변 코드
    SC_ANSWER VARCHAR2(600) NULL    -- 답변 내용
);

CREATE SEQUENCE sc_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_choice
    ADD CONSTRAINT SC_NUMBER_PK PRIMARY KEY (SC_number);
   
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g01','0번');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g02','1번');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g03','2번');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od01','g04','3번 이상');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c01','월요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c02','화요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c03','수요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c04','목요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od02','c05','금요일');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od03','j01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od04','s01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000001','od05','t01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od01','g01','YES');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od01','g02','NO');
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od02','j01', null);
INSERT INTO SURVEY_CHOICE VALUES((sc_seq.NEXTVAL),'s0000000002','od02','s01', null);

SELECT * FROM SURVEY_CHOICE;
DROP TABLE SURVEY_CHOICE;

-- 설문지 문제 답변 (설문지를 보고 회원이 직접 답변한 내용)
CREATE TABLE SURVEY_ANSWER
(
    SA_NUMBER NUMBER(10) NOT NULL,      -- 시퀀스
    SA_SVCODE VARCHAR2(20) NOT NULL,       -- 설문지 코드
    SA_ORDER VARCHAR2(10) NOT NULL,     -- 순서 코드
    SA_ASCODE VARCHAR2(10) NOT NULL,    -- 답변 코드
    USER_ID VARCHAR2(20) NOT NULL,      -- 회원 아이디
    SA_CONTENT VARCHAR2(600) NULL       -- 답변 내용
);

CREATE SEQUENCE sa_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_answer
    ADD CONSTRAINT SA_NUMBER_PK PRIMARY KEY (sa_number);

INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od01','g03','abc123','3번');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od02','c01','abc123','월요일');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od02','c03','abc123','수요일');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od03','j01','abc123','요크셔테리어');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od04','s01','abc123','2011-11-25');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000001','od04','t01','abc123','13:00');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od01','g01','pow111','YES');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od02','j01','pow111','태어나서?');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od03','s01','pow111','2000-11-13');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od01','g02','ghost44','NO');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od02','j01','ghost44','지구멸망');
INSERT INTO SURVEY_ANSWER VALUES((sa_seq.NEXTVAL),'s0000000002','od03','s01','ghost44','1892-12-24');

DROP TABLE survey_answer;
SELECT * FROM survey_answer;


-- 230203 최지혁 SQL
-- reserv table sequence
CREATE SEQUENCE re_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- reserve table
-- 예약확인페이지에서 구분하기위해서 status칼럼을 추가했습니다.
-- pickup 서비스에서 사용할 주소 칼럼을 추가했습니다.
CREATE TABLE reserve
(   
    re_seq NUMBER(8) NOT NULL,          -- 시퀀스
    reserve_num VARCHAR2(20) NOT NULL,  -- 예약 번호
    reserve_day VARCHAR2(20) NULL,      -- 예약 날짜 /// 데이트타입 고려
    reserve_time VARCHAR2(20) NULL,     -- 예약 시간 /// 데이트타입 고려
    reserve_add VARCHAR2(200) NULL,      -- 예약 주소
    s_num NUMBER(8) NOT NULL,     -- 서비스 번호
    user_id VARCHAR2(20) NOT NULL,      -- 회원 아이디
    part_id VARCHAR2(20) NOT NULL ,      -- 파트너 아이디
    pet_id NUMBER NOT NULL, --펫 아이디 펫테이블과 중복데이터가 많을것같으니 pet_id를 fk로 데이터를 받아오는것이 좋을것 같습니다.
    -- 예약상태 230126
    status number(2) DEFAULT 1, --예약상태 1:매칭중 2:매칭완료/케어중 3:케어완료
    -- pickup 서비스 사용할 주소
    pick_add varchar2(200) NULL,
    -- 요청사항
    reserve_request VARCHAR2(2000) NULL
);

-- reserve table primary key
ALTER TABLE reserve ADD CONSTRAINT re_seq PRIMARY KEY (re_seq);


-- serv table sequence
CREATE SEQUENCE serv_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- serv table
CREATE TABLE serv
(
    s_num NUMBER(8) NOT NULL,   -- 서비스 번호
    s_name VARCHAR2(20) NULL,   -- 서비스 이름
    s_price NUMBER(8) NULL      -- 서비스 가격
);

-- serv table primary key
ALTER TABLE serv ADD CONSTRAINT s_num PRIMARY KEY (s_num);

-- serv table 초기값
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '기본', 15000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '산책', 30000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '픽업', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '병원', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '미용', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '샤워', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '훈련', 50000);
INSERT INTO serv VALUES((serv_seq.NEXTVAL), '호텔', 70000);

select * from serv;

-- tip_board sequence
CREATE SEQUENCE tip_board_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

-- tip_board table
CREATE TABLE tip_board
(
    tip_seq NUMBER(8) NOT NULL,             -- 번호 (자동증가) 시퀀스
    tip_title VARCHAR2(100) NOT NULL,       -- 제목
    tip_content VARCHAR2(500) NOT NULL,     -- 내용
    tip_img_url VARCHAR2(200) NULL,         -- 이미지
    tip_video VARCHAR2(200) NULL,           -- 영상
    tip_create_date DATE DEFAULT sysdate,          -- 발행일
    tip_hit NUMBER(10) NOT NULL,            -- 조회수
    tip_update_date DATE NULL               -- 수정일
);

-- tip_board primary key
ALTER TABLE tip_board ADD CONSTRAINT tip_seq PRIMARY KEY (tip_seq);

-- tip_board table 초기값
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'꿀팁','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'전수','전수입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'강아지','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'고양이','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tip_board_seq.NEXTVAL),'애들','꿀팁입니당',NULL,NULL,1,NULL);


--230203 연은비 DB수정리스트
--table이름 수정 signUp -> users
--add byte크기 수정 50->200
CREATE TABLE users
( user_id VARCHAR2(20) NOT NULL,    -- 회원 아이디
  user_pw VARCHAR2(50) NOT NULL,    -- 회원 비밀번호
  user_name VARCHAR2(15) NOT NULL,  -- 회원 이름
  user_nick VARCHAR2(30) NOT NULL,  -- 회원 닉네임
  user_add VARCHAR2(200) NOT NULL,   -- 주소
  gender CHAR(1) NOT NULL,          -- 성별
  phnumber VARCHAR2(20) NULL,       -- 핸드폰번호
  birth DATE NULL,                  -- 생년월일
  war NUMBER NULL,                  -- 경고 횟수
  user_no NUMBER NULL,              -- 회원 번호 - 시퀀스
  data_create DATE NOT NULL         -- 가입날짜
);

ALTER TABLE users
    ADD CONSTRAINT user_id PRIMARY KEY (user_id);

CREATE SEQUENCE user_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

DROP TABLE users;


--users table 초기값 
INSERT INTO users VALUES('abc123','abc123','김작두','무당','서울시 관악구 신림동 100-1', 'M','010-1111-2222','1989-01-01','0',(user_seq.NEXTVAL),'2023-01-14');
INSERT INTO users VALUES('abc456','abc456','김명태','어부','경기도 과천시 주암동 122-2', 'M','010-2323-1212','1983-06-07','0',(user_seq.NEXTVAL),'2023-01-14');
INSERT INTO users VALUES('abc789','abc789','홍당무','채소가게','서울시 서초구 우면동 30-3', 'F','010-3412-5454','1977-07-07','0',(user_seq.NEXTVAL),'2023-01-14');


--table이름 수정 partSignTup -> partners 
--add byte크기 수정 50->200
CREATE TABLE partners
(
  part_id VARCHAR2(20) NOT NULL,    -- 파트너 아이디
  part_pw VARCHAR2(50) NOT NULL,    -- 파트너 비밀번호
  part_name VARCHAR2(15) NOT NULL,  -- 파트너 이름
  part_nick VARCHAR2(30) NOT NULL,  -- 파트너 닉네임
  part_add VARCHAR2(200) NOT NULL,   -- 주소
  gender CHAR(1) NOT NULL,          -- 성별
  part_phnumber VARCHAR2(20) NULL,  -- 핸드폰번호
  birth DATE NULL,                  -- 생년월일
  war NUMBER NULL,                  -- 경고 횟수
  part_no NUMBER NULL,              -- 회원 번호
  data_create DATE NOT NULL,        -- 가입날짜
  self_infor VARCHAR2(500)          -- 자기소개
);

CREATE SEQUENCE part_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE partners
    ADD CONSTRAINT part_id PRIMARY KEY (part_id);

DROP TABLE part_signup;

--partners table 초기값 
INSERT INTO partners VALUES('ppp222','ppp222','김칼날','파트너','경기도 의왕시 학의동 42-42', 'm','010-5232-2121','1989-01-01','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('bpb222','bpb222','양태양','파트너','서울시 종로구 계동 212-2', 'm','010-5757-3572','1977-07-07','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('bow444','bow444','장독대','파트너','서울시 영등포구 영등포동 321-1', 'f','010-5777-1414','1988-06-17','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('ang1004','ang1004','임천사','파트너','서울시 강서구 화곡동 1004-1', 'f','010-1004-1004','1994-10-04','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('sho232','sho232','정발산','파트너','경기도 남양주시 다산동 34-34', 'm','010-4989-4989','1972-07-02','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('pvp322','pvp322','김질서','파트너','서울시 강동구 고덕동 56-6', 'f','010-7575-2727','1993-07-05','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('ghg989','ghg989','양팔구','파트너','서울시 송파구 거영동 168-2', 'm','010-2929-9292','1992-02-09','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('led333','led333','이빛나','파트너','경기도 성남시 중원구 금광동 933-1', 'f','010-6443-4321','1995-03-16','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('uoi777','uoi777','신한방','파트너','서울시 서초구 양재동 688-2', 'm','010-8234-5432','1969-06-06','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');
INSERT INTO partners VALUES('spp888','spp888','조선소','파트너','서울시 서초구 방배동 42-2', 'm','010-8787-2131','1981-01-01','0',(part_seq.NEXTVAL),'2023-01-14','자기소개애애애애애애애애애애애');





-- **해당테이블은 테이블생성 -> sys로 메타데이터생성-> 인덱스생성후 -> 테이블drop삭제하고 -> 테이블 다시 생성하세요**
-- 230120 pet_img 컬럼추가 pet_work컬럼삭제
CREATE TABLE user_pet
(
    pet_id NUMBER NOT NULL,
    pet_name VARCHAR2(20) NULL,
    pet_type VARCHAR2(20) NULL,
    pet_img VARCHAR2(2000) NULL,
    pet_age NUMBER(8) NULL,
    pet_gender CHAR(1) NULL,
    user_id VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE user_pet_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE user_pet
    ADD CONSTRAINT pet_id PRIMARY KEY (pet_id);

ALTER TABLE user_pet
    ADD (CONSTRAINT F_2 FOREIGN KEY (user_id) REFERENCES users(user_id)on delete cascade);
--user데이터가 삭제되면 펫데이터도 삭제된다.

DROP TABLE user_pet;

--user_pet table 초기값
INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),'뽀또','dog',null,'2','m','abc123');
INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),'치즈','cat',null,'4','f','abc456');
INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),'펀치','cat',NULL,'3','m','abc789');


--산책DB생성
--산책로생성 fk는 users테이블의 user_id
create table user_work(
str_user_id varchar2(20),
geom sdo_geometry,

CONSTRAINT work_fk FOREIGN KEY (str_user_id) REFERENCES USERS (user_id)on delete cascade
);

--메타데이터생성
insert into user_sdo_geom_metadata
(table_name, column_name, diminfo, srid)
values
('user_work','geom',sdo_dim_array(
    sdo_dim_element('longitude',0,100,0.05),
    sdo_dim_element('latituyde',0,100,0.05)),
    8307);

--인덱스생성(검색기능의향상을위함)
create index user_work_IDX 
on user_work(geom)
indextype is MDSYS.SPATIAL_INDEX;

--user_work  table 초기값
INSERT INTO user_work (str_user_id,geom)
VALUES ( 'abc123',
        SDO_GEOMETRY(2003, 4326, NULL,
          SDO_ELEM_INFO_ARRAY(1,1003,3),
          SDO_ORDINATE_ARRAY(37.61753810334461,126.91323151432047, 
                             37.61734422641554,126.91300803714323,
                             37.61708324626182,126.91342459624484,
                             37.61734696756152,126.91367347804402)) );

--x,y검색
SELECT str_user_id, x, y, id
FROM user_work, TABLE(SDO_UTIL.GETVERTICES(user_work.geom))
WHERE STR_USER_ID='abc123'
order by id;


--230207 리뷰테이블
--컬럼을 전체적으로 수정했습니다. (user_id 삭제, dia_num 삭제)
--r_title 바이트를 30 ->100 으로 수정했습니다. 

CREATE TABLE review
(
    r_id NUMBER(8) NOT NULL,                -- 리뷰 ID
    star_rating NUMBER(5) NULL,             -- 별점
    r_content VARCHAR2(2000) NULL,           -- 리뷰 내용
    r_title VARCHAR2(100) NULL,              -- 리뷰 제목
    r_date DATE NULL,                       -- 작성 날짜
    reserv_num NUMBER(8) NOT NULL          -- 리뷰넘버
);

CREATE SEQUENCE r_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

DROP TABLE review;

ALTER TABLE review
    ADD CONSTRAINT r_id PRIMARY KEY (r_id);

ALTER TABLE review
    ADD (CONSTRAINT G_8 FOREIGN KEY (reserv_num) REFERENCES reserve(reserve_num)on delete cascade);

update reserve set status = 3 where reserve_num = '예약넘버';

commit;

-- 230208 이도은 db수정 (NoticeBoard)
-- 테이블, 시퀀스 drop 후 재생성
DROP TABLE NOTICE_BOARD;

CREATE TABLE NOTICE_BOARD
(
    ntc_seq NUMBER(8) NOT NULL,             -- 번호 (자동증가) 시퀀스
    ntc_title VARCHAR2(100) NOT NULL,       -- 제목
    ntc_ctnt VARCHAR2(500) NOT NULL,     -- 내용
    ntc_imgurl VARCHAR2(200) NULL,         -- 이미지
    ntc_cdate DATE DEFAULT sysdate,          -- 발행일
    ntc_hit NUMBER(10) NOT NULL,            -- 조회수
    ntc_udate DATE DEFAULT sysdate       -- 수정일
);

DROP SEQUENCE ntc_seq;

-- 시퀀스 삭제 후 재생성 (nocache)
CREATE SEQUENCE ntc_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE
  NOCACHE;
  
INSERT INTO NOTICE_BOARD VALUES((ntc_seq.NEXTVAL), '공지사항 TEST 입니다.', '공지사항 TEST 입니다.', null, DEFAULT, '0', DEFAULT);
INSERT INTO NOTICE_BOARD VALUES((ntc_seq.NEXTVAL), '공지사항 수정 TEST 입니다.', '공지사항 수정 TEST 입니다.', null, DEFAULT, '0', DEFAULT);

-- ADMIN, 시퀀스 드롭 후 다시 생성
DROP TABLE ADMIN;
DROP SEQUENCE ADM_NO;

CREATE TABLE ADMIN
(
    adm_id VARCHAR2(20) NOT NULL,
    adm_pw VARCHAR2(100) NOT NULL,
    adm_name VARCHAR2(50) NOT NULL,
    adm_phone VARCHAR2(20) NOT NULL,
    adm_email VARCHAR2(100) NOT NULL,
    adm_no NUMBER(10) NOT NULL,
    adm_date DATE DEFAULT SYSDATE
);
    
ALTER TABLE ADMIN
    ADD CONSTRAINT adm_id PRIMARY KEY (adm_id);

CREATE SEQUENCE ADM_NO
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

INSERT INTO ADMIN VALUES('admin123', 'admin1234', '이도은', '010-1231-1231', 'admin1@gmail.com', (adm_no.NEXTVAL), DEFAULT);

select * from admin;

-- 230210 영현님
-- 고객 센터 테이블

CREATE SEQUENCE cust_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

create table customer(
    cust_no NUMBER(8) NOT NULL,
    user_id VARCHAR2(20) NOT NULL,
    part_id VARCHAR2(20) NOT NULL,
    cust_title VARCHAR2(100) NOT NULL,
    cust_content VARCHAR2(1000) NOT NULL,
    cust_date DATE DEFAULT SYSDATE NOT NULL
);

ALTER TABLE customer modify cust_date DATE default sysdate;

commit;

ALTER TABLE customer
    ADD CONSTRAINT cust_no PRIMARY KEY (cust_no);
    
INSERT INTO customer VALUES ((cust_seq.NEXTVAL),'abc123','bpb222','이런경우에는 어떻게 해야하나요','이런저런일이 있을 경우에는 어떻게 해야하나요','2023-02-05');
INSERT INTO customer VALUES ((cust_seq.NEXTVAL),'abc456','ppp222','궁금한게 있습니다.','산책서비스를 이용 하려는데 어떤 형태로 이루어지는지 자세하게 설명 부탁드립니다.','2023-02-06');
INSERT INTO customer VALUES ((cust_seq.NEXTVAL),'abc789','bow444','질문이 있습니다.','병원 방문 서비스를 이용하려는데 어떤 형태로 이루어지는지 자세하게 설명 부탁드립니다.','2023-02-09');
INSERT INTO customer VALUES ((cust_seq.NEXTVAL),'abc123','ang1004','문의 드립니다.','궁금한게 있어서 문의드리는데요','2023-02-10');
INSERT INTO customer VALUES ((cust_seq.NEXTVAL),'abc456','sho232','급합니다!','빨리 대답 해주시면 감사하겠습니다.','2023-02-10');

select * from customer;

--230210 연은비 review DB
CREATE TABLE review
(
    r_id NUMBER(8) NOT NULL,                -- 리뷰 ID
    star_rating NUMBER(5) NULL,             -- 별점
    r_content VARCHAR2(2000) NULL,           -- 리뷰 내용
    r_title VARCHAR2(100) NULL,              -- 리뷰 제목
    r_date DATE NULL,                       -- 작성 날짜
    reserve_num VARCHAR2(20) NOT NULL          -- 리뷰넘버
);

CREATE SEQUENCE r_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

DROP TABLE review;

ALTER TABLE review
    ADD CONSTRAINT r_id PRIMARY KEY (r_id);


COMMIT;



