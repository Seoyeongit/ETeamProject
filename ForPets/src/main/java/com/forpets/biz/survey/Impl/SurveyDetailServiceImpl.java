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
		// TODO Auto-generated method stub
		return  surdDAO.getSurveyList();
	}
	
	@Override
	public SurveyDetailVO getSurveyBoard(String sd_svcode) {
		return surdDAO.getSurveyBoard(sd_svcode);
	}
}
