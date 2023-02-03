CREATE USER forpets IDENTIFIED BY pets;
GRANT Connect, RESOURCE TO forpets;
GRANT create view, create synonym to forpets;


CREATE TABLE community
(
    c_code VARCHAR2(15) NOT NULL,           -- 소모임 코드
    c_title VARCHAR2(30) NOT NULL,          -- 제목
    c_content VARCHAR2(255) NOT NULL,       -- 내용
    user_id VARCHAR2(20) NOT NULL,          -- 회원 아이디
    c_date DATE NOT NULL                    -- 날짜
);

ALTER TABLE community
    ADD CONSTRAINT c_code PRIMARY KEY (c_code);

drop table survey;

-- 설문지 생성
   CREATE TABLE survey
(
    s_svcode VARCHAR2(15) NOT NULL,     -- 설문지 코드
    c_code VARCHAR2(15) NOT NULL,       -- 소모임 코드
    s_title VARCHAR2(30) NOT NULL,      -- 제목
    s_regdate DATE NOT NULL             -- 날짜
);


ALTER TABLE survey
    ADD CONSTRAINT s_svcode PRIMARY KEY (s_svcode);

drop table survey_detail;

-- 설문지 질문
   CREATE TABLE survey_detail
(
    sd_number NUMBER(15) NOT NULL,      -- 시퀀스
    c_code VARCHAR2(20) NOT NULL,       -- 설문지 코드
    sd_type VARCHAR2(10) NOT NULL,      -- 질문 유형
    sd_title VARCHAR2(30) NOT NULL,     -- 질문 제목
    sd_order VARCHAR2(10) NOT NULL      -- 순서 코드
);

CREATE SEQUENCE sd_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_detail
    ADD CONSTRAINT sd_number PRIMARY KEY (sd_number);


drop table survey_choice;

   -- 설문지 답변
   CREATE TABLE survey_choice
(
    sc_number NUMBER(10) NOT NULL,      -- 시퀀스
    c_code VARCHAR2(20) NOT NULL,       -- 설문지 코드
    sc_order VARCHAR2(10) NOT NULL,     -- 순서 코드
    sc_ascode VARCHAR2(10) NOT NULL,    -- 답변 코드
    sc_answer VARCHAR2(255) NOT NULL    -- 답변 내용
);

CREATE SEQUENCE sc_seq
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

ALTER TABLE survey_choice
    ADD CONSTRAINT sc_number PRIMARY KEY (sc_number);

commit;

select * from survey_choice;

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
    pick_add varchar2(200) NULL
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
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tb_seq.NEXTVAL),'꿀팁','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tb_seq.NEXTVAL),'전수','전수입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tb_seq.NEXTVAL),'강아지','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tb_seq.NEXTVAL),'고양이','꿀팁입니당',NULL,NULL,1,NULL);
INSERT INTO tip_board(tip_seq, tip_title, tip_content, tip_img_url, tip_video, tip_hit, tip_update_date) VALUES ((tb_seq.NEXTVAL),'애들','꿀팁입니당',NULL,NULL,1,NULL);