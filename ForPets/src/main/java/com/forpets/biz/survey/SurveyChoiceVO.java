package com.forpets.biz.survey;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  소모임게시판안의 설문지선택모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class SurveyChoiceVO {
	private int sc_number; //시퀀스
	private String c_code; //설문지코드
	private String sc_order; //순서코드
	private String sc_ascode; //답변코드
	private String sc_answer; //답변내용
}
