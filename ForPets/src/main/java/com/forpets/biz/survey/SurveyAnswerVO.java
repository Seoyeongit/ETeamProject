package com.forpets.biz.survey;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  소모임게시판안의 설문지답변모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class SurveyAnswerVO {
	private int sa_number; //시퀀스
	private String c_code; //설문지코드
	private String sa_order; //순서코드
	private String sa_ascode; //답변코드
	private String user_id; //회원아이디
	private String sa_content; //답변내용
}
