package com.forpets.biz.reserve.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.reserve.ReserveVO;

@Repository("reserveDAO")
public class ReserveDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// SQL명령어
	private final String RESERVE_INSERT = "insert into reserve(reserve_num, pet_name, pet_type, pet_image, pet_age,"
			+ " walk_ho, walk_ver, reserve_day, reserve_time, reserve_add, s_num, user_id, part_id)"
			+ "values((select nvl(max(seq),0) + 1 from reserve), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?";
	
	public void insertReserve(ReserveVO vo) {
		System.out.println("---> JdbcTemplate을 통한 insertReserve()");
	}
	
}
