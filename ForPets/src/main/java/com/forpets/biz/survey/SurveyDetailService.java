package com.forpets.biz.survey;

import java.util.List;

import org.springframework.stereotype.Service;

/*
 *  상세설문지관련 서비스는 여기서 추상메서드를 추가하세요.
 */
@Service
public interface SurveyDetailService {


	// 설문지 작성
	public void insertSurvey(SurveyDetailVO vo);
	public void insertServey2(SurveyChoiceVO vo);
	
	// 설문지 리스트 불러오기
	public List<SurveyVO> getSurveyList() throws Exception;
	
	// 설문지 상세 보기
	public SurveyDetailVO getSurveyBoard(String c_code);
}
