package com.forpets.biz.survey.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.survey.SurveyAnswerVO;
import com.forpets.biz.survey.SurveyChoiceVO;
import com.forpets.biz.survey.SurveyDetailVO;
import com.forpets.biz.survey.SurveyVO;

@Repository("surveyDetailDAO")
public class SurveyDetailDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 설문지 등록
	private final String INSERT_SURVEY = "insert into SURVEY_DETAIL(SD_NUMBER, SD_SVCODE, SD_TYPE, SD_TITLE, SD_ORDER) values ((sd_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String INSERT_SURVEY_CHOICE = "insert into SURVEY_CHOICE(SC_NUMBER, SC_SVCODE, SC_ORDER, SC_ASCODE, SC_ANSWER) values ((sc_seq.NEXTVAL), ?, ?, ?, ?)";
	private final String INSERT_SURVEY_TITLE = "insert into SURVEY(S_SVCODE, S_CODE, S_TITLE, S_DATE) values (?, ?, ? , sysdate)";
	
	// 설문지 리스트 불러오기
	private final String SURVEY_LIST = "select * from Survey order by s_date DESC";
	
	// 설문지 상세보기
	private final String GET_SURVEYBOARD = "select * from survey_detail where sd_svcode=?";
	private final String GET_SURVEYBOARD2 = "select * from survey_choice where sc_svcode=?";
	private final String GET_SURVEYBOARD3 = "select * from survey where s_svcode=?";
	
	// 설문지 글 삭제
	public final String DELETE_SURVEY_SD = "delete from Survey_detail where sd_svcode=?";
	public final String DELETE_SURVEY_SC = "delete from survey_choice where sc_svcode=?";
	public final String DELETE_SURVEY_S = "delete from survey where s_svcode=?";
	
	// 설문지 답변 내용 저장
	public final String INSERT_ANSWER = "insert into SURVEY_ANSWER(SA_NUMBER, SA_SVCODE, SA_ORDER, SA_ASCODE, USER_ID, SA_CONTENT) values ((sa_seq.NEXTVAL), ?, ?, ?, ?, ?)";
	public final String SD_NUMBER = "select count(*) from survey_detail where sd_svcode=?";
	
	// 설문지 답변 리스트 불러오기
	public final String ANSWER_LIST = "select * from Survey_answer order by sa_svcode DESC";
	
	// 설문지 답변 내용 보기
	public final String GET_ANSWER = "select * from survey_detail where sd_svcode=?";
	public final String GET_ANSWER2 = "select * from survey_choice where sc_svcode=?";
	public final String GET_ANSWER3 = "select * from survey where s_svcode=?";
	public final String GET_ANSWER4 = "select * from survey_answer where sa_svcode=? and user_id=?";
	
	// 설문지 답변 삭제
	public final String DELETE_ANSWER = "delete from survey_answer where sa_svcode=? and user_id=?";
	
	
	
	// 설문지 등록
	public void insertSurvey(SurveyDetailVO vo) {
		jdbcTemplate.update(INSERT_SURVEY, vo.getSd_svcode(), vo.getSd_type(), vo.getSd_title(), vo.getSd_order());
	
	}
	
	public void insertSurvey2(SurveyChoiceVO vo) {
	//	System.out.println(vo.toString());
		jdbcTemplate.update(INSERT_SURVEY_CHOICE, vo.getSc_svcode(), vo.getSc_order(), vo.getSc_ascode(), vo.getSc_answer());
	} 
	
	public void insertSurvey3(SurveyVO vo) {
	//	System.out.println(vo);
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
	
	
	
	// 설문지 삭제하기
	public void deleteSurvey(String sd_svcode) {
		jdbcTemplate.update(DELETE_SURVEY_SD, sd_svcode);
	}
	
	public void deleteSurvey2(String sc_svcode) {
		jdbcTemplate.update(DELETE_SURVEY_SC, sc_svcode);
	}
	
	public void deleteSurvey3(String s_svcode) {
		jdbcTemplate.update(DELETE_SURVEY_S, s_svcode);
	} // 설문지 삭제하기 end
	
	
	
	// 설문지 답변 저장하기
	public void insertAnswer(SurveyAnswerVO vo) {
		jdbcTemplate.update(INSERT_ANSWER, vo.getSa_svcode(), vo.getSa_order(), vo.getSa_ascode(), vo.getUser_id(), vo.getSa_content());
	} 
		// 설문지 문항 갯수 count
	public String count(String sd_svcode) {
		String count = jdbcTemplate.queryForObject(SD_NUMBER, String.class, sd_svcode);
		return count;
	} // 설문지 답변 저장 end
	
	
	// 설문지 답변 리스트 불러오기
	private final RowMapper<SurveyAnswerVO> answerRowMapper = (resultSet, rowNum) -> {
		SurveyAnswerVO vo = new SurveyAnswerVO();
		vo.setSa_number(resultSet.getInt("SA_NUMBER"));
		vo.setSa_svcode(resultSet.getString("SA_SVCODE"));
		vo.setSa_order(resultSet.getString("SA_ORDER"));
		vo.setSa_ascode(resultSet.getString("SA_ASCODE"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setSa_content(resultSet.getString("SA_CONTENT"));
		
		return vo;
	};
	
	public List<SurveyAnswerVO> getAnswerList() {
		List<SurveyAnswerVO> voList = jdbcTemplate.query(ANSWER_LIST, answerRowMapper);
		List<SurveyAnswerVO> newList = new ArrayList<SurveyAnswerVO>();
		String id = "";
		int count = voList.toArray().length;
		for(int i=0;i<count;i++) {
			SurveyAnswerVO svo = voList.get(i);
			System.out.println("id : " + id);
			System.out.println("user_id : " + svo.getUser_id());
			if(svo.getUser_id().equals(id)) {
				System.out.println("같은 id 이므로 넘어갑니다. ");
				continue;
			}
			System.out.println("다른 Id 이므로 저장합니다.");
			id = svo.getUser_id();
			newList.add(svo);
		}
		return newList;
	} // 설문지 리스트 end
	
	
	
	// 설문지 답변 상세 불러오기
	public final RowMapper<SurveyDetailVO> sdRowMapper = (resultSet, rowNum) -> {
		SurveyDetailVO vo = new SurveyDetailVO();
		vo.setSd_number(resultSet.getInt("SD_NUMBER"));
		vo.setSd_svcode(resultSet.getString("SD_SVCODE"));
		vo.setSd_type(resultSet.getString("SD_TYPE"));
		vo.setSd_title(resultSet.getString("SD_TITLE"));
		vo.setSd_order(resultSet.getString("SD_ORDER"));
		return vo;
	};
	
	public List<SurveyDetailVO> getAnswerBoard(String sd_svcode){
		return jdbcTemplate.query(GET_ANSWER, sdRowMapper, sd_svcode);
	}
	
	private final RowMapper<SurveyChoiceVO> scRowMapper = (resultSet, rowNum) -> {
		SurveyChoiceVO vo = new SurveyChoiceVO();
		vo.setSc_number(resultSet.getInt("SC_NUMBER"));
		vo.setSc_svcode(resultSet.getString("SC_SVCODE"));
		vo.setSc_order(resultSet.getString("SC_ORDER"));
		vo.setSc_ascode(resultSet.getString("SC_ASCODE"));
		vo.setSc_answer(resultSet.getString("SC_ANSWER"));
		return vo;
	};
	
	public List<SurveyChoiceVO> getAnswerBoard2(String sc_svcode) {
		return jdbcTemplate.query(GET_ANSWER2, scRowMapper, sc_svcode);
	}
	
	public SurveyVO getAnswerBoard3(String s_svcode) {
		SurveyVO vo = jdbcTemplate.queryForObject(GET_ANSWER3, 
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
	}
	
	private final RowMapper<SurveyAnswerVO> ansRowMapper = (resultSet, rowNum) -> {
		SurveyAnswerVO vo = new SurveyAnswerVO();
		vo.setSa_number(resultSet.getInt("SA_NUMBER"));
		vo.setSa_svcode(resultSet.getString("SA_SVCODE"));
		vo.setSa_order(resultSet.getString("SA_ORDER"));
		vo.setSa_ascode(resultSet.getString("SA_ASCODE"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setSa_content(resultSet.getString("SA_CONTENT"));
		
		return vo;
	};

	public List<SurveyAnswerVO> getAnswerBoard4(String sa_svcode, String user_id) {
		 Object[] obj = {sa_svcode, user_id};
		return jdbcTemplate.query(GET_ANSWER4, obj, ansRowMapper);
	} // 설문지 상세 불러오기 END
	

	// 설문지 답변 삭제 
	public void deleteAnswer(String sa_svcode, String user_id) {
		jdbcTemplate.update(DELETE_ANSWER, sa_svcode, user_id);
	}
	
	
	
}