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
	private final String GET_DIA = "select care_diary.reserve_num, care_diary.care_content, reserve.reserve_day, reserve.status\r\n" + 
			"from care_diary left outer join reserve\r\n" + 
			"on reserve.reserve_num = care_diary.reserve_num\r\n" + 
			"where reserve.pet_id = (select user_pet.pet_id from user_pet where user_pet.pet_id='26')\r\n" + 
			"and reserve.user_id = (select users.user_id from users where users.user_id = 'abc123')";
	
	public List<CareDiaryVO> getCareDiary(CareDiaryVO vo) {
		return jdbcTemplate.query(GET_DIA, new CareDiaryRowMapper());
	}

}