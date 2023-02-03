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
	
	private final String INSERT_SURVEY = "insert into SURVEY_DETAIL(SD_NUMBER, C_CODE, SD_TYPE, SD_TITLE, SD_ORDER) values ((sd_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String INSERT_SURVEY_CHOICE = "insert into SURVEY_CHOICE(SC_NUMBER, C_CODE, SC_ORDER, SC_ASCODE, SC_ANSWER) values ((sc_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String SURVEY_LIST = "select * from Survey order by s_regdate DESC";
	private final String GET_SURVEYBOARD = "select * from survey_detail where c_code=?";
	// 설문지 등록
	public void insertSurvey(SurveyDetailVO vo) {
		jdbcTemplate.update(INSERT_SURVEY, vo.getC_code(), vo.getSd_type(), vo.getSd_title(), vo.getSd_order());
	
	}
	
	
	public void insertSurvey2(SurveyChoiceVO vo) {
		System.out.println(vo.toString());
		jdbcTemplate.update(INSERT_SURVEY_CHOICE, vo.getC_code(), vo.getSc_order(), vo.getSc_ascode(), vo.getSc_answer());
	} // 설문지 등록 end
	
	
	// 설문지 리스트 불러오기
	private final RowMapper<SurveyVO> surveyRowMapper = (resultSet, rowNum) -> {
		SurveyVO vo = new SurveyVO();
		vo.setC_code(resultSet.getString("C_CODE"));
		vo.setS_svcode(resultSet.getString("S_SVCODE"));
		vo.setS_title(resultSet.getString("S_TITLE"));
		vo.setS_regDate(resultSet.getDate("S_REGDATE"));	
		
		return vo;
	};
	
	public List<SurveyVO> getSurveyList() {
		return jdbcTemplate.query(SURVEY_LIST, surveyRowMapper);
	} // 설문지 리스트 end
	
	
	// 설문지 상세 보기
	public SurveyDetailVO getSurveyBoard(String c_code) {
		System.out.println("뷰보드 연결");
		SurveyDetailVO vo = jdbcTemplate.queryForObject(GET_SURVEYBOARD,
				(resultSet, rowNum) -> {
					SurveyDetailVO svo = new SurveyDetailVO();
					svo.setSd_number(resultSet.getInt("SD_NUMBER"));
					svo.setC_code(resultSet.getString("C_CODE"));
					svo.setSd_type(resultSet.getString("SD_TYPE"));
					svo.setSd_title(resultSet.getString("SD_TITLE"));
					svo.setSd_order(resultSet.getString("SD_ORDER"));
					return svo;
				}
				, c_code);
		
		return vo;

	}
}