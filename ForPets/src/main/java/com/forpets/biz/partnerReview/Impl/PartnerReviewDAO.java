package com.forpets.biz.partnerReview.Impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partnerReview.PartnerReviewVO;

@Repository("partnerreviewDAO")
public class PartnerReviewDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 파트너 리스트 불러오기
	private final String PARTNER_LIST = "select * from partners order by part_id";
	
	// 파트너 리뷰 리스트 불러오기
	private final String PT_NAME = "select part_name from partners where part_id=?";
	private final String PT_REVIEW = "select * from partner_review where part_id=?";
	private final String AVG = "SELECT avg(pr_avg) FROM PARTNER_REVIEW WHERE PART_ID=?";
	
	// 리뷰 글 내용 불러오기
	private final String GET_PRBOARD = "select * from partner_review where pr_num=?";
	
	// 리뷰 글 작성하기
	private final String INSERT_PRBOARD = "insert into partner_review (PR_NUM, PART_ID, USER_ID, PR_AVG, PR_TITLE, PR_CONTENT, PR_DATE) VALUES ((pr_seq.NEXTVAL), ?, ?, ?, ?, ?,sysdate)";
	
	// 리뷰 글 삭제하기
	private final String DELETE_PRBOARD = "delete from partner_review where pr_num=?";
	
	// 리뷰 글 수정하기
	private final String UPDATE_PRBOARD = "update partner_review set PR_AVG=?, PR_TITLE=?, PR_CONTENT=? where PR_NUM=?";
	
	
	
	// 파트너 리스트 불러오기
	private final RowMapper<PartnerVO> prRowMapper = (resultSet, rowNum) -> {
		PartnerVO vo = new PartnerVO();
		vo.setPart_id(resultSet.getString("PART_ID"));
		vo.setPart_pw(resultSet.getString("PART_PW"));
		vo.setPart_name(resultSet.getString("PART_NAME"));
		vo.setPart_nick(resultSet.getString("PART_NICK"));
		vo.setPart_add(resultSet.getString("PART_ADD"));
		vo.setGender(resultSet.getString("GENDER").charAt(0));
		vo.setPart_phnumber(resultSet.getString("PART_PHNUMBER"));
		vo.setBirth(resultSet.getDate("BIRTH"));
		vo.setWar(resultSet.getInt("WAR"));
		vo.setPart_no(resultSet.getInt("PART_NO"));
		vo.setData_create(resultSet.getDate("DATA_CREATE"));
		vo.setSelf_infor(resultSet.getString("SELF_INFOR"));
		
		return vo;
	};
	
	public List<PartnerVO> getPartnerList() {
		return jdbcTemplate.query(PARTNER_LIST, prRowMapper);
	}
	
	// 파트너 리뷰 리스트 불러오기
	// 이름 불러오기
	public String partName(String part_id) {
		String name = jdbcTemplate.queryForObject(PT_NAME, String.class, part_id);
		return name;
	}
	
	// 리스트 불러오기
	private final RowMapper<PartnerReviewVO> previewRowMapper = (resultSet, rowNum) -> {
		PartnerReviewVO vo = new PartnerReviewVO();
		vo.setPr_num(resultSet.getInt("PR_NUM"));
		vo.setPart_id(resultSet.getString("PART_ID"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setPr_avg(resultSet.getInt("PR_AVG"));
		vo.setPr_title(resultSet.getString("PR_TITLE"));
		vo.setPr_content(resultSet.getString("PR_CONTENT"));
		vo.setPr_date(resultSet.getDate("PR_DATE"));
		
		return vo;
	};
	
	public List<PartnerReviewVO> getprReviewList(String part_id) {
		return jdbcTemplate.query(PT_REVIEW, previewRowMapper, part_id);
	}
	
	public Double avg(String part_id) {
		Double avg = jdbcTemplate.queryForObject(AVG, double.class, part_id);
		return avg;
	}
	
	public PartnerReviewVO PRBoard(int pr_num) {
		System.out.println("PRBOARD DAO 실행");
		PartnerReviewVO vo = jdbcTemplate.queryForObject(GET_PRBOARD,
			(resultSet, rowNum) -> {
				PartnerReviewVO pvo = new PartnerReviewVO();
				pvo.setPr_num(resultSet.getInt("PR_NUM"));
				pvo.setPart_id(resultSet.getString("PART_ID"));
				pvo.setUser_id(resultSet.getString("USER_ID"));
				pvo.setPr_avg(resultSet.getInt("PR_AVG"));
				pvo.setPr_title(resultSet.getString("PR_TITLE"));
				pvo.setPr_content(resultSet.getString("PR_CONTENT"));
				pvo.setPr_date(resultSet.getDate("PR_DATE"));
				return pvo;
			}
			, pr_num);
		return vo;
	}
	
	public void insertPRBoard(PartnerReviewVO vo) {
		jdbcTemplate.update(INSERT_PRBOARD, vo.getPart_id(), vo.getUser_id(), vo.getPr_avg(), vo.getPr_title(), vo.getPr_content());
	}
	
	// 리뷰 글 삭제하기
	public void deletePR(int pr_num) {
		jdbcTemplate.update(DELETE_PRBOARD, pr_num);
	}
	
	// 리뷰 글 수정하기 
	public void updatePRBoard(PartnerReviewVO vo) {
		jdbcTemplate.update(UPDATE_PRBOARD, vo.getPr_avg(), vo.getPr_title(), vo.getPr_content(), vo.getPr_num());
		System.out.println(vo.getPr_avg()+vo.getPr_title()+vo.getPr_content()+vo.getPr_num());
	}
}

