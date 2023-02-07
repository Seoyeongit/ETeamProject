package com.forpets.biz.reserve.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;

@Repository("ResrveDAO")
public class ReserveDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String RESERVE_LIST = "SELECT * FROM RESERVE,PARTNERS,USER_PET WHERE RESERVE.PART_ID= PARTNERS.PART_ID and reserve.pet_id = user_pet.pet_id AND reserve.USER_ID=? ORDER BY RESERVE.STATUS";
	private final String GET_PETNAME = "select user_pet.pet_name from reserve,user_pet where reserve.pet_id = user_pet.pet_id;";
	private final String COUNT_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status in(1,2) and reserve.user_id='abc123'";
	private final String COUNT_COMPLETE_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status=3 and reserve.user_id='abc123'";
	
	//230130 최지혁
	private final String RESERVE_INSERT = "insert into reserve(reserve_num,"
			+ " pet_name, pet_type, pet_age,"
			+ " reserve_day, reserve_time, reserve_add, s_num, user_id, part_id, pick_add)"
					+ "values((reserve_seq.NEXTVAL), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
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
	
	//230130 최지혁
	//Reserve Table에 데이터 추가
	public void insertReserve(ReServeVO vo, PetVO pvo) {
		jdbcTemplate.update(RESERVE_INSERT, pvo.getName(), pvo.getType(), pvo.getAge(), vo.getReserve_day(), vo.getReserve_time(), vo.getReserve_add(), vo.getS_num(), vo.getUser_id(), vo.getPart_id(), vo.getPick_add());
	}
	
	//230130 최지혁
	//Reserve Table에 데이터 추가를 위한 정보
	public ReServeVO makeReserve(ReServeVO vo, HttpServletRequest request) {
		ReServeVO reserve = new ReServeVO();
		reserve.setReserve_day(request.getParameter("reserve_day"));
		reserve.setReserve_time(request.getParameter("reserve_start")+"~"+request.getParameter("reserve_end"));
		reserve.setReserve_add(request.getParameter("address") + " " + request.getParameter("detailAddress"));
		reserve.setS_num(Integer.parseInt(request.getParameter("s_num")));
		reserve.setUser_id(request.getParameter("user_id"));
		reserve.setPart_id(request.getParameter("part_id"));
		reserve.setPet_id(Integer.parseInt(request.getParameter("pet_id")));
		reserve.setPick_add(request.getParameter("pick_add"));
		return reserve;
	}

}
