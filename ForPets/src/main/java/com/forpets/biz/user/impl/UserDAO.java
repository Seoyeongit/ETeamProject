package com.forpets.biz.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String GET_USER ="select * from users where user_id=? and user_pw=?";
	private final String UPDATE_USER ="update USERS set user_pw=?, user_name=?, user_nick=?, user_add=?, phnumber=?" + " where user_id = ?";
	
	public UserVO getUser(UserVO vo) {
		Object[] obj = {vo.getUser_id(),vo.getUser_pw()};
		return jdbcTemplate.queryForObject(GET_USER,obj, new UserRowMapper());
		
	}
	
	public void updateUser(UserVO vo) {
		Object[] obj = {vo.getUser_pw(),vo.getUser_name(),vo.getUser_nick(),vo.getUser_add(),vo.getPhnumber(),vo.getUser_id()};
		jdbcTemplate.update(UPDATE_USER,obj);
	}
}
