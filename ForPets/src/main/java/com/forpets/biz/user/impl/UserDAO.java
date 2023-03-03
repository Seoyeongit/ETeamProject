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
	private final String INSERT_USER = "INSERT INTO USERS VALUES(?,?,?,?,null,null,?,null,default,(user_seq.NEXTVAL),sysdate)";
	private final String GET_USERBYID = "SELECT * FROM USERS WHERE USER_ID=?";
	
	public UserVO getUser(UserVO vo) {
		Object[] obj = {vo.getUser_id(),vo.getUser_pw()};
		return jdbcTemplate.queryForObject(GET_USER,obj, new UserRowMapper());
	}
	
	public void updateUser(UserVO vo) {
		Object[] obj = {vo.getUser_id(),vo.getUser_pw(),vo.getUser_name(),vo.getUser_nick(),vo.getPhnumber()};
		jdbcTemplate.update(UPDATE_USER,obj);
	}
	
	public void saveUser(UserVO vo) {
		Object[] obj = {vo.getUser_id(),vo.getUser_pw(),vo.getUser_name(),vo.getUser_nick(),vo.getPhnumber()};
		jdbcTemplate.update(INSERT_USER,obj);
	}
	
	public UserVO getUserById(UserVO vo) {
		Object[] obj = {vo.getUser_id()};
		return jdbcTemplate.queryForObject(GET_USERBYID, obj,new UserRowMapper());
	}
	
	
}
