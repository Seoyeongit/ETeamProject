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
		
		vo.setId(rs.getInt("pet_id"));
		vo.setName(rs.getString("pet_name"));
		vo.setType(rs.getString("pet_type"));
		vo.setImg(rs.getString("pet_img"));
		vo.setAge(rs.getInt("pet_age"));
		try {
		vo.setGender(rs.getString("PET_GENDER").charAt(0)); //문자는 단일문자이므로 문자열의 첫번째 문자만 가져옵니다.
		}catch(NullPointerException e) {
			vo.setGender(' ');
		}
		vo.setWeight(rs.getInt("WEIGHT"));
		vo.setType_detail(rs.getString("PET_TYPE_DETAIL"));
		vo.setLicense(rs.getString("LICENSE"));
		try {
		vo.setIsNeutered(rs.getString("IS_NEUTERED").charAt(0));
		}catch(NullPointerException e) {
			vo.setIsNeutered(' ');
		}
		vo.setSocial(rs.getString("PET_SOCIAL"));
		try {
		vo.setIsVaccin(rs.getString("IS_VACCIN").charAt(0));
		}catch(NullPointerException e) {
			vo.setIsVaccin(' ');
		}
		
		return vo;
	}

}
