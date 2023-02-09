package com.forpets.biz.survey.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.survey.SurveyChoiceVO;
import com.forpets.biz.survey.SurveyDetailService;
import com.forpets.biz.survey.SurveyDetailVO;
import com.forpets.biz.survey.SurveyVO;


@Service("surveyDetailService")
public class SurveyDetailServiceImpl implements SurveyDetailService {

	@Autowired
	private SurveyDetailDAO surdDAO;
	
	// 설문지 작성 start
	@Override
	public void insertSurvey(SurveyDetailVO vo) {
		surdDAO.insertSurvey(vo);
	}
	@Override
	public void insertServey2(SurveyChoiceVO vo) {
		surdDAO.insertSurvey2(vo);
		
	}
	
	// 설문지 List 불러오기
	@Override
	public List<SurveyVO> getSurveyList() throws Exception {
		return  surdDAO.getSurveyList();
	}
	
	@Override
	public SurveyDetailVO getSurveyBoard(String c_code) {
		return surdDAO.getSurveyBoard(c_code);
	}
	
	// 설문지 답변 리스트 불러오기
	@Override
	public List<SurveyAnswerVO> getAnswerList() throws Exception {
		return surdDAO.getAnswerList();
	}
	
	// 설문지 답변 불러오기
	@Override
	public List<SurveyDetailVO> getAnswerBoard(String sd_svcode) {
		return surdDAO.getAnswerBoard(sd_svcode);
	}
	
	@Override
	public List<SurveyChoiceVO> getAnswerBoard2(String sc_svcode) {
		return surdDAO.getAnswerBoard2(sc_svcode);
	}
	
	@Override
	public SurveyVO getAnswerBoard3(String s_svcode) {
		return surdDAO.getAnswerBoard3(s_svcode);
	}
	
	@Override
	public List<SurveyAnswerVO> getAnswerBoard4(String sa_svcode, String user_id) {
		return surdDAO.getAnswerBoard4(sa_svcode, user_id);
	}
	

}
