package com.forpets.biz.user.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.user.UserVO;

public class UserRowMapper implements RowMapper<UserVO> {

	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO vo = new UserVO();
		
		vo.setUser_id(rs.getString("USER_ID"));
		vo.setUser_pw(rs.getString("USER_PW"));
		vo.setUser_name(rs.getString("USER_NAME"));
		vo.setUser_nick(rs.getString("USER_NICK"));
		vo.setUser_add(rs.getString("USER_ADD"));
		vo.setPhnumber(Integer.parseInt(rs.getString("PHNUMBER").replace("-","")));
		vo.setData_create(rs.getDate("DATA_CREATE"));
		return vo;
	}

}
