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
