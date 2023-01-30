package com.forpets.biz.pet.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.pet.WorkVO;

public class WorkRowMapper implements RowMapper<WorkVO> {
	@Override
	public WorkVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WorkVO vo = new WorkVO();
		
		vo.setUser_id(rs.getString("STR_USER_ID"));
		vo.setX(rs.getFloat("X"));
		vo.setY(rs.getFloat("Y"));
		
		return vo;
	}
	
	

}
