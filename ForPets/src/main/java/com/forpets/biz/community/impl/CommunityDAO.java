package com.forpets.biz.community.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.community.CommunityVO;

@Repository("communityDAO")
public class CommunityDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String COMMUNITY_LIST = "select * from community";
	
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
		System.out.println("안녕!");
		
		return jdbcTemplate.query(COMMUNITY_LIST, communityRowMapper);
	}
}

