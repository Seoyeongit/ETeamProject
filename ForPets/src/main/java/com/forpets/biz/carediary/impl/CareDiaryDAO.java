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
	private final String INSERT_DIA ="INSERT INTO CAREDIARY VALUES((CDIA_SEQ.NEXTVAL),?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	public List<CareDiaryVO> getCareDiary(CareDiaryVO vo) {
		return jdbcTemplate.query(GET_DIA, new CareDiaryRowMapper());
	}
	
	public void insertCareDiary(CareDiaryVO vo) {
		Object[] obj = {vo.getPet_condition(), vo.getCare_review(), vo.getMedi_result(), vo.getBeauty_list(), vo.getWalk_time(), vo.getShower_serv(), vo.getTraining_serv(), vo.getMeal(), vo.getSnak(), vo.getPet_play(), vo.getReserve_num(),vo.getComplete_day(),vo.getComplete_time()};
		jdbcTemplate.update(INSERT_DIA, obj);
	}

}