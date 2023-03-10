package com.forpets.biz.survey.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.survey.SurveyAnswerVO;
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
	public void insertSurvey2(SurveyChoiceVO vo) {
		surdDAO.insertSurvey2(vo);
		
	}
	@Override
	public void insertsurvey3(SurveyVO vo) {
		surdDAO.insertSurvey3(vo);
		
	}
	
	// 설문지 List 불러오기
	@Override
	public List<SurveyVO> getSurveyList() throws Exception {
		return  surdDAO.getSurveyList();
	}
	
	// 설문지 상세 보기
	@Override
	public List<SurveyDetailVO> getSurveyBoard(String sd_svcode) {
		return surdDAO.getSurveyBoard(sd_svcode);
	}
	
	@Override
	public List<SurveyChoiceVO> getSurveyBoard2(String sc_svcode) {
		return surdDAO.getSurveyBoard2(sc_svcode);
	}
	@Override
	public SurveyVO getSurveyBoard3(String s_svcode) {
		return surdDAO.getSurveyBoard3(s_svcode);
	}
	
	// 설문지 삭제하기
	@Override
	public void deleteSurvey(String sd_svcode) {
		surdDAO.deleteSurvey(sd_svcode);
		
	}
	
	@Override
	public void deleteSurvey2(String sc_svcode) {
		surdDAO.deleteSurvey2(sc_svcode);
		
	}
	
	@Override
	public void deleteSurvey3(String s_svcode) {
		surdDAO.deleteSurvey3(s_svcode);
		
	}
	
	// 설문지 답변 저장
	@Override
	public void insertAnswer(SurveyAnswerVO vo) {
		surdDAO.insertAnswer(vo);
		
	}
	
	@Override
	public String count(String sd_svcode) {
		return surdDAO.count(sd_svcode);
	}
	
	// 설문지 답변 리스트 불러오기
	@Override
	public List<SurveyAnswerVO> getAnswerList(String sa_svcode) throws Exception {
		return surdDAO.getAnswerList(sa_svcode);
	}
	
	// 설문지 답변 불러오기
	@Override
	public List<SurveyDetailVO> getAnswerBoard(String sd_svcode) {
		return surdDAO.getAnswerBoard(sd_svcode);
	}
	
	// 설문지 답변 이름 불러오기
	@Override
	public List<String> getAnswerName(String sa_svcode) {
		return surdDAO.getAnswerName(sa_svcode);
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
	
	@Override
	public void deleteAnswer(String sa_svcode, String user_id) {
		surdDAO.deleteAnswer(sa_svcode, user_id);
	}

}
