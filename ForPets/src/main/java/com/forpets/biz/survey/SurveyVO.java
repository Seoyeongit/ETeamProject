package com.forpets.biz.survey;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  소모임게시판안의 설문지서비스모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class SurveyVO {
	private String s_svcode; //설문지코드
	private String c_code; //소모임코드
	private String s_title; //제목
	private Date s_regDate; //날짜

}
