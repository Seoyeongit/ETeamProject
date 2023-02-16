package com.forpets.biz.partner.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.partner.PartnerVO;

public class PartnerRowMapper implements RowMapper<PartnerVO> {
	
	@Override
	public PartnerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
	PartnerVO vo = new PartnerVO();
	
	vo.setPart_id(rs.getString("PART_ID"));
	vo.setPart_pw(rs.getString("PART_PW"));
	vo.setPart_name(rs.getString("PART_NAME"));
	vo.setPart_nick(rs.getString("PART_NICK"));
	vo.setPart_add(rs.getString("PART_ADD"));
	vo.setGender(rs.getString("GENDER").charAt(0));
	vo.setPart_phnumber(rs.getString("PART_PHNUMBER"));
	vo.setBirth(rs.getDate("BIRTH"));
	vo.setWar(rs.getInt("WAR"));
	vo.setPart_no(rs.getInt("PART_NO"));
	vo.setData_create(rs.getDate("DATA_CREATE"));
	vo.setSelf_infor(rs.getString("SELF_INFOR"));
	
	return vo;
	
	}
}

