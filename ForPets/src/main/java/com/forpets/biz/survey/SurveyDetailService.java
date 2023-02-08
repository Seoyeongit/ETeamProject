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
	public void insertSurvey2(SurveyChoiceVO vo);
	public void insertsurvey3(SurveyVO vo);
	
	// 설문지 리스트 불러오기
	public List<SurveyVO> getSurveyList() throws Exception;
	
	// 설문지 상세 보기
	public List<SurveyDetailVO> getSurveyBoard(String sd_svcode);
	public List<SurveyChoiceVO> getSurveyBoard2(String sc_svcode);
	public SurveyVO getSurveyBoard3(String s_svcode);
	
	// 설문지 삭제
	void deleteSurvey(String sd_svcode);
	void deleteSurvey2(String sc_svcode);
	void deleteSurvey3(String s_svcode);
	
	// 설문지 답변 저장
	public void insertAnswer(SurveyAnswerVO vo);
	public String count(String sd_svcode);
}
