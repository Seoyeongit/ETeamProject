package com.forpets.biz.community.impl;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.community.CommunityVO;

@Repository("communityDAO")
public class CommunityDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String COMMUNITY_LIST = "select * from community order by C_DATE DESC ";
	private final String INSERT_COMMUNITY = "INSERT INTO COMMUNITY (C_CODE, C_TITLE, C_CONTENT, USER_ID, C_DATE) VALUES(?, ?, ?, ?, sysdate)";
	private final String GET_COMMUNITY = "select * from community where C_CODE=?";
	private final String ALL_NUMBER = "select count(*) from community";
	private final String UPDATE_COMMUNITY = "update community set C_TITLE=?, C_CONTENT=? where C_CODE=?";
	private final String DELETE_COMMUNITY = "delete from community where C_CODE=? ";
	
	private final RowMapper<CommunityVO> communityRowMapper = (resultSet, rowNum) -> {
		CommunityVO vo = new CommunityVO();
		vo.setC_code(resultSet.getString("C_CODE"));
		vo.setC_title(resultSet.getString("C_TITLE"));
		vo.setC_content(resultSet.getString("C_CONTENT"));
		vo.setUser_id(resultSet.getString("USER_ID"));
		vo.setC_date(resultSet.getDate("C_DATE"));
		
		return vo;
	};
	
	public List<CommunityVO> getCommunityList() {
		// System.out.println("안녕!");
		
		return jdbcTemplate.query(COMMUNITY_LIST, communityRowMapper);
	}
	
	public void insertCommunity(CommunityVO vo) {
		// System.out.println("인서트 보드");
		jdbcTemplate.update(INSERT_COMMUNITY,vo.getC_code(), vo.getC_title(), vo.getC_content(), vo.getUser_id());
	}
	
	
	public CommunityVO getCommunityBoard(String c_code) {
//		System.out.println("DAO 연결");
		CommunityVO vo = jdbcTemplate.queryForObject(GET_COMMUNITY,
			(resultSet, rowNum) -> {
				CommunityVO newvo = new CommunityVO();
				newvo.setC_code(resultSet.getString("C_CODE"));
				newvo.setC_title(resultSet.getString("C_TITLE"));
				newvo.setC_content(resultSet.getString("C_CONTENT"));
				newvo.setUser_id(resultSet.getString("USER_ID"));
				newvo.setC_date(resultSet.getDate("C_DATE"));
				return newvo;
			}
			, c_code);
		return vo;
	} 
	

	// 소모임 번호
	public String getlistcount() {
		String count = jdbcTemplate.queryForObject(ALL_NUMBER, String.class);
		return count;
	}
		
	
	public void updateCommunity(CommunityVO vo) {
		jdbcTemplate.update(UPDATE_COMMUNITY, vo.getC_title(), vo.getC_content(), vo.getC_code());
	}

	public void deleteCommunity(String c_code) {
		System.out.println(c_code);
		jdbcTemplate.update(DELETE_COMMUNITY, c_code);

	}
	
}
	
	
	
	
