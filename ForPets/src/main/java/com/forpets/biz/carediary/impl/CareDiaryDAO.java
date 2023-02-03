package com.forpets.biz.carediary.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.carediary.CareDiaryVO;

@Repository("careDiaryDAO")
public class CareDiaryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String GET_DIA = "select * from care_diary,reserve where reserve.reserve_num = care_diary.reserve_num"+ 
								" and reserve.pet_id = (select user_pet.pet_id from user_pet where user_pet.pet_id='26')";
	
	public List<CareDiaryVO> getCareDiary(CareDiaryVO vo) {
		return jdbcTemplate.query(GET_DIA, new CareDiaryRowMapper());
	}

}