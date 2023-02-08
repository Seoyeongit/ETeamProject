package com.forpets.biz.survey;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  소모임게시판안의 상세설문지서비스모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class SurveyDetailVO {
	private int sd_number; //시퀀스
	private String sd_svcode; //설문지코드
	private String sd_type; //질문유형
	private String sd_title; //질문제목
	private String sd_order; //순서코드
}
