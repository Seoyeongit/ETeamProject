package com.forpets.biz.pet.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.user.UserVO;
import com.forpets.biz.user.impl.UserRowMapper;

public class PetRowMapper implements RowMapper<PetVO> {

	@Override
	public PetVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PetVO vo = new PetVO();
		UserVO voU = new UserRowMapper().mapRow(rs, rowNum);
		
		vo.setId(rs.getInt("pet_id"));
		vo.setName(rs.getString("pet_name"));
		vo.setType(rs.getString("pet_type"));
		vo.setImg(rs.getString("pet_img"));
		vo.setAge(rs.getInt("pet_age"));
//		vo.setWark(rs.get);
//		vo.setGender(rs.getString("pet_gender").charAt(0)); //문자는 단일문자이므로 문자열의 첫번째 문자만 가져옵니다.
		vo.setVoU(voU);
		
		return vo;
	}

}