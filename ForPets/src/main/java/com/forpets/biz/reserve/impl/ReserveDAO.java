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
	private final String RESERVE_GET = "SELECT * FROM RESERVE,PARTNERS,USER_PET " + 
			"WHERE RESERVE.PART_ID= PARTNERS.PART_ID " + 
			"AND reserve.pet_id = user_pet.pet_id " + 
			"AND reserve.USER_ID=? " + 
			"AND reserve_num=?";
	private final String RESERVE_LIST = "SELECT * FROM RESERVE,PARTNERS,USER_PET WHERE RESERVE.PART_ID= PARTNERS.PART_ID and reserve.pet_id = user_pet.pet_id AND reserve.USER_ID=? ORDER BY RESERVE.STATUS";
	private final String RESERVE_COMPLETELIST = "SELECT * FROM RESERVE,PARTNERS,USER_PET WHERE RESERVE.PART_ID= PARTNERS.PART_ID and reserve.pet_id = user_pet.pet_id AND reserve.USER_ID=? AND reserve.status=3 ORDER BY RESERVE_NUM DESC";
	private final String GET_PETNAME = "select user_pet.pet_name from reserve,user_pet where reserve.pet_id = user_pet.pet_id;";
	private final String COUNT_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status in(1,2) and reserve.user_id=?";
	private final String COUNT_COMPLETE_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status=3 and reserve.user_id=?";
	
	
	//230130 최지혁
	private final String RESERVE_INSERT = "insert into reserve(re_seq,"
			+ "reserve_num, reserve_day, reserve_time, reserve_add, s_num, user_id, part_id, pet_id, pick_add, reserve_request)"
					+ "values((reserve_seq.NEXTVAL), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	private final String RESERVE_LAST_SEQ = "select NVL(max(re_seq),0) FROM reserve";
	
	/*
	 * 특정회원의 예약리스트중 특정예약정보를 조회하는 메서드
	 */
	public ReServeVO getReserve(ReServeVO vo) {
		System.out.println("--->jdbcTemplate로 getReserve() 기능 처리");
		Object[] orgs = {vo.getUser_id(), vo.getReserve_num()};
		return jdbcTemplate.queryForObject(RESERVE_GET,orgs, new ReserveRowMapper());
		
	}
	
	
	/*
	 * 특정회원의 예약내역리스트를 조회하는 메서드
	 */
	public List<ReServeVO> getReserveList(ReServeVO vo){
		System.out.println("---> jdbcTemplate로 getReserveList() 기능 처리");
		
		Object[] orgs = {vo.getUser_id()};		
		return jdbcTemplate.query(RESERVE_LIST,orgs,new ReserveRowMapper());
	}
	
	/*
	 * 서비스가완료된 예약내역리스트를 조회하는 메서드
	 */
	
	public List<ReServeVO> getCPTReserveList(ReServeVO vo) {
		System.out.println("---> jdbcTemplate로 getCPTReserveList() 기능 처리");
		
		Object[] orgs = {vo.getUser_id()};		
		return jdbcTemplate.query(RESERVE_COMPLETELIST,orgs,new ReserveRowMapper());
	}
	
	/*
	 * 예약내역수를 조회하는 메서드
	 */
	public int selectCount(ReServeVO vo) {
		int result = 0;
		Object[] obj = {vo.getUser_id()};
		result = jdbcTemplate.queryForObject(COUNT_RESERVE,obj, Integer.class);
		return result;
	}
	
	/*
	 * 예약완료내역수를 조회하는 메서드
	 */
	public int selectCompleteCount(ReServeVO vo) {
		int resultCP = 0;
		Object[] obj = {vo.getUser_id()};
		resultCP = jdbcTemplate.queryForObject(COUNT_COMPLETE_RESERVE,obj, Integer.class);
		return resultCP;
	}
	
	//230130 최지혁
	//Reserve Table에 데이터 추가
	public void insertReserve(ReServeVO vo, PetVO pvo) {
		jdbcTemplate.update(RESERVE_INSERT,vo.getReserve_num(), vo.getReserve_day(), vo.getReserve_time(), vo.getReserve_add(), vo.getS_num(), vo.getUser_id(), vo.getPart_id(), vo.getPet_id(), vo.getPick_add(), vo.getReserve_request());
	}
	
	//230130 최지혁
	//Reserve Table에 데이터 추가를 위한 정보
	public ReServeVO makeReserve(ReServeVO vo, HttpServletRequest request) {
		int last = lastSeq() + 1;
		System.out.println("last : " + last);
		ReServeVO reserve = new ReServeVO();
		reserve.setReserve_num("RN_" + last);
		reserve.setReserve_day(request.getParameter("reserve_day"));
		reserve.setReserve_time(request.getParameter("reserve_start")+"~"+request.getParameter("reserve_end"));
		reserve.setReserve_add(request.getParameter("address") + " " + request.getParameter("detailAddress"));
		//reserve.setS_num(Integer.parseInt(request.getParameter("s_num")));
		reserve.setUser_id(request.getParameter("user_id"));
		reserve.setPart_id(request.getParameter("part_id"));
		reserve.setPet_id(Integer.parseInt(request.getParameter("pet_id")));
		reserve.setPick_add(request.getParameter("pick_add"));
		reserve.setReserve_request(request.getParameter("reserve_request"));
		return reserve;
	}
	
	public int lastSeq() {
		int last_num = 0;
		last_num = jdbcTemplate.queryForObject(RESERVE_LAST_SEQ, Integer.class);
		return last_num;
	}
	
}
