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
		
		vo.setDiary_id(rs.getInt("DIARY_ID"));
		vo.setPet_condition(rs.getString("PET_CONDITION"));
		vo.setCare_review(rs.getString("CARE_REVIEW"));
		vo.setMedi_result(rs.getString("MEDI_RESULT"));
		vo.setBeauty_list(rs.getString("BEAUTY_LIST"));
		vo.setWalk_time(rs.getString("WALK_TIME"));
		vo.setShower_serv(rs.getString("SHOWER_SERV"));
		vo.setTraining_serv(rs.getString("TRAINING_SERV"));
		vo.setMeal(rs.getString("MEAL"));
		vo.setSnak(rs.getString("SNACK"));
		vo.setPet_play(rs.getString("PET_PLAY"));
		vo.setComplete_day(rs.getString("COMPLETE_DAY"));
		vo.setComplete_time(rs.getString("COMPLETE_TIME"));
		vo.setReserve_num(rs.getString("RESERVE_NUM"));
		vo.setVoR(voR);
		
		return vo;
	}

}