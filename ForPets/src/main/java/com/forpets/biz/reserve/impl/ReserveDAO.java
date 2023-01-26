package com.forpets.biz.reserve.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReserveVO;
import com.forpets.biz.tip.TipVO;

@Repository("reserveDAO")
public class ReserveDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// SQL명령어
	private final String RESERVE_INSERT = "insert into reserve(reserve_num,"
			+ " pet_name, pet_type, pet_age,"
			+ " reserve_day, reserve_time, reserve_add, s_num, user_id, part_id)"
					+ "values((reserve_seq.NEXTVAL), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	public void insertReserve(ReserveVO vo, PetVO pvo) {
		jdbcTemplate.update(RESERVE_INSERT, pvo.getName(), pvo.getType(), pvo.getAge(), vo.getReserve_day(), vo.getReserve_time(), vo.getReserve_add(), vo.getS_num(), vo.getUser_id(), vo.getPart_id());
	}
	
	public ReserveVO makeReserve(ReserveVO vo, HttpServletRequest request) {
		ReserveVO reserve = new ReserveVO();
		reserve.setReserve_day(request.getParameter("reserve_day"));
		reserve.setReserve_time(request.getParameter("reserve_time"));
		reserve.setReserve_add(request.getParameter("address") + " " + request.getParameter("detailAddress"));
		reserve.setS_num(Integer.parseInt(request.getParameter("s_num")));
		reserve.setUser_id(request.getParameter("user_id"));
		reserve.setPart_id(request.getParameter("part_id"));
		reserve.setPet_id(Integer.parseInt(request.getParameter("pet_id")));
		return reserve;
	}
	
}
