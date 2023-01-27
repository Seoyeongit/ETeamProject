package com.forpets.biz.reserve.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.reserve.ReServeVO;

@Repository("ResrveDAO")
public class ReserveDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String RESERVE_LIST = "SELECT * FROM RESERVE,PARTNERS,USER_PET WHERE RESERVE.PART_ID= PARTNERS.PART_ID and reserve.pet_id = user_pet.pet_id AND reserve.USER_ID=?";
	private final String GET_PETNAME = "select user_pet.pet_name from reserve,user_pet where reserve.pet_id = user_pet.pet_id;";
	private final String COUNT_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status in(1,2) and reserve.user_id='abc123'";
	private final String COUNT_COMPLETE_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status=3 and reserve.user_id='abc123'";

	
	public List<ReServeVO> getReserveList(ReServeVO vo){
		System.out.println("---> jdbcTemplate로 getReserveList() 기능 처리");
		
		vo.setUser_id("abc123");
		Object[] orgs = {vo.getUser_id()};		
		return jdbcTemplate.query(RESERVE_LIST,orgs,new ReserveRowMapper());
	}
	
	/*
	 * 예약내역수를 조회하는 메서드
	 */
	public int selectCount() {
		int result = 0;
		result = jdbcTemplate.queryForObject(COUNT_RESERVE, Integer.class);
		return result;
	}
	
	/*
	 * 예약완료내역수를 조회하는 메서드
	 */
	public int selectCompleteCount() {
		int resultCP = 0;
		resultCP = jdbcTemplate.queryForObject(COUNT_COMPLETE_RESERVE, Integer.class);
		return resultCP;
	}

}
