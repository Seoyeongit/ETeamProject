package com.forpets.biz.reserve.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.reserve.ReServeVO;

public class ReservePartRowMapper implements RowMapper<ReServeVO> {

	@Override
	public ReServeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReServeVO vo = new ReServeVO();
		
		vo.setPart_id(rs.getString("part_id"));
		vo.setReserve_num(rs.getString("reserve_num"));
		vo.setReserve_day(rs.getString("reserve_day"));
		vo.setReserve_add(rs.getString("reserve_add"));
		vo.setUser_id(rs.getString("user_id"));
		vo.setReserve_time(rs.getString("reserve_time"));
		vo.setStatus(rs.getShort("status"));
	
		return vo;
	}
}
