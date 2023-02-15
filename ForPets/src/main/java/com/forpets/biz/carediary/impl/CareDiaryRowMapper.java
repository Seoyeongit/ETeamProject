package com.forpets.biz.carediary.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.carediary.CareDiaryVO;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.pet.impl.PetRowMapper;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.impl.ReserveRowMapper;
import com.forpets.biz.user.UserVO;
import com.forpets.biz.user.impl.UserRowMapper;

public class CareDiaryRowMapper implements RowMapper<CareDiaryVO> {

	@Override
	public CareDiaryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CareDiaryVO vo = new CareDiaryVO();
		ReServeVO voR = new ReserveRowMapper().mapRow(rs, rowNum);
		
		
		return vo;
	}

}