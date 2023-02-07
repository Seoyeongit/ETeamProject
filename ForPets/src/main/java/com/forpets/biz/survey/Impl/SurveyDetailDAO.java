package com.forpets.biz.survey.Impl;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.survey.SurveyChoiceVO;
import com.forpets.biz.survey.SurveyDetailVO;
import com.forpets.biz.survey.SurveyVO;

@Repository("surveyDetailDAO")
public class SurveyDetailDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT_SURVEY = "insert into SURVEY_DETAIL(SD_NUMBER, SD_SVCODE, SD_TYPE, SD_TITLE, SD_ORDER) values ((sd_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String INSERT_SURVEY_CHOICE = "insert into SURVEY_CHOICE(SC_NUMBER, SC_SVCODE, SC_ORDER, SC_ASCODE, SC_ANSWER) values ((sc_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String INSERT_SURVEY_TITLE = "insert into SURVEY(S_SVCODE, S_CODE, S_TITLE, S_DATE) values (?, ?, ? , sysdate)";
	private final String SURVEY_LIST = "select * from Survey order by s_date DESC";
	private final String GET_SURVEYBOARD = "select * from survey_detail where sd_svcode=?";
	private final String GET_SURVEYBOARD2 = "select * from survey_choice where sc_svcode=?";
	private final String GET_SURVEYBOARD3 = "select * from survey where s_svcode=?";
	
	
	
	// 설문지 등록
	public void insertSurvey(SurveyDetailVO vo) {
		jdbcTemplate.update(INSERT_SURVEY, vo.getSd_svcode(), vo.getSd_type(), vo.getSd_title(), vo.getSd_order());
	
	}
	
	public void insertSurvey2(SurveyChoiceVO vo) {
		System.out.println(vo.toString());
		jdbcTemplate.update(INSERT_SURVEY_CHOICE, vo.getSc_svcode(), vo.getSc_order(), vo.getSc_ascode(), vo.getSc_answer());
	} 
	
	public void insertSurvey3(SurveyVO vo) {
		System.out.println(vo);
		jdbcTemplate.update(INSERT_SURVEY_TITLE, vo.getS_svcode(), vo.getS_code(), vo.getS_title());
	} // 설문지 등록 end
	
	
	// 설문지 리스트 불러오기
	private final RowMapper<SurveyVO> surveyRowMapper = (resultSet, rowNum) -> {
		SurveyVO vo = new SurveyVO();
		vo.setS_code(resultSet.getString("S_CODE"));
		vo.setS_svcode(resultSet.getString("S_SVCODE"));
		vo.setS_title(resultSet.getString("S_TITLE"));
		vo.setS_date(resultSet.getDate("S_DATE"));	
		
		return vo;
	};
	
	public List<SurveyVO> getSurveyList() {
		return jdbcTemplate.query(SURVEY_LIST, surveyRowMapper);
	} // 설문지 리스트 end
	
	
	// 설문지 상세 보기
	private final RowMapper<SurveyDetailVO> surveydetailRowMapper = (resultSet, rowNum) -> {
		SurveyDetailVO vo = new SurveyDetailVO();
		vo.setSd_number(resultSet.getInt("SD_NUMBER"));
		vo.setSd_svcode(resultSet.getString("SD_SVCODE"));
		vo.setSd_type(resultSet.getString("SD_TYPE"));
		vo.setSd_title(resultSet.getString("SD_TITLE"));
		vo.setSd_order(resultSet.getString("SD_ORDER"));
		return vo;
	};
	
	public List<SurveyDetailVO> getSurveyBoard(String sd_svcode) {
		System.out.println("============== Survey detail 뷰보드 연결");
		return jdbcTemplate.query(GET_SURVEYBOARD,surveydetailRowMapper,sd_svcode);
	}
	
	private final RowMapper<SurveyChoiceVO> surveychoiceRowMapper = (resultSet, rowNum) -> {
		SurveyChoiceVO vo = new SurveyChoiceVO();
		vo.setSc_number(resultSet.getInt("SC_NUMBER"));
		vo.setSc_svcode(resultSet.getString("SC_SVCODE"));
		vo.setSc_order(resultSet.getString("SC_ORDER"));
		vo.setSc_ascode(resultSet.getString("SC_ASCODE"));
		vo.setSc_answer(resultSet.getString("SC_ANSWER"));
		return vo;
	};
	
	public List<SurveyChoiceVO> getSurveyBoard2(String sc_svcode) {
		System.out.println("============== Survey Choice 뷰 보드 연결");
		return jdbcTemplate.query(GET_SURVEYBOARD2, surveychoiceRowMapper, sc_svcode);
	}
	
	public SurveyVO getSurveyBoard3(String s_svcode) {
		System.out.println("============== Survey 뷰 보드 연결 ");
		SurveyVO vo = jdbcTemplate.queryForObject(GET_SURVEYBOARD3, 
				(resultSet, rowNum) -> {
					SurveyVO ssvo = new SurveyVO();
					ssvo.setS_svcode(resultSet.getString("S_SVCODE"));
					ssvo.setS_code(resultSet.getString("S_CODE"));
					ssvo.setS_title(resultSet.getString("S_TITLE"));
					ssvo.setS_date(resultSet.getDate("S_DATE"));
					
					return ssvo;
				}
				, s_svcode);
		
		return vo;
	} // 설문지 상세보기 end
	
	
	
}