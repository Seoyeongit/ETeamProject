package com.forpets.biz.reserve.impl;

import java.util.ArrayList;
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
	private final String RESERVE_GETTO = "SELECT * FROM RESERVE,USERS,USER_PET " + 
			"WHERE RESERVE.USER_ID= USERS.USER_ID " + 
			"AND reserve.pet_id = user_pet.pet_id " + 
			"AND reserve.USER_ID=? " + 
			"AND reserve_num=?";
	
	private final String RESERVE_LIST = "SELECT * FROM RESERVE,PARTNERS,USER_PET WHERE RESERVE.PART_ID= PARTNERS.PART_ID and reserve.pet_id = user_pet.pet_id AND reserve.USER_ID=? ORDER BY RESERVE.STATUS, RE_SEQ asc";
	private final String RESERVE_COMPLETELIST = "select reserve.*, partners.part_name, user_pet.pet_name " + 
			"from reserve " + 
			"join partners on reserve.part_id = partners.part_id " + 
			"join user_pet on reserve.pet_id = user_pet.pet_id " + 
			"left outer join review on reserve.reserve_num = review.reserve_num " + 
			"where review.reserve_num IS NULL " + 
			"and reserve.USER_ID= ? " + 
			"and reserve.status = '3' " + 
			"ORDER BY reserve.reserve_num DESC";
	private final String GET_PETNAME = "select user_pet.pet_name from reserve,user_pet where reserve.pet_id = user_pet.pet_id;";
	private final String COUNT_RESERVE = "select count(*) from reserve,users where reserve.user_id = users.user_id and reserve.status in(1,2) and reserve.user_id=?";
	private final String COUNT_COMPLETE_RESERVE = "select count(distinct reserve.reserve_num) from reserve,users where reserve.user_id = users.user_id and reserve.status=3 and reserve.user_id=?";
	//230217 정영현
	private final String GETRESERVE_LIST = "select * from reserve where part_id=?";
	private final String GETRESERVE_LISTCAREBEFORE = "select * from reserve where part_id=? and status=1";
	private final String GETRESERVE_LISTCARE = "select * from reserve where part_id=? and status=2";
	private final String GETRESERVE_LISTCAREAFTER = "select * from reserve where part_id=? and status=3";
	
	//230130 최지혁
	private final String RESERVE_INSERT = "insert into reserve(re_seq,"
			+ "reserve_num, reserve_day, reserve_time, reserve_add, s_num, user_id, part_id, pet_id, pick_add, reserve_request)"
					+ "values((re_seq.NEXTVAL), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	private final String RESERVE_LAST_SEQ = "select NVL(max(re_seq),0) FROM reserve";
	
	/*
	 * 특정회원의 예약리스트중 특정예약정보를 조회하는 메서드
	 */
	public ReServeVO getReserve(ReServeVO vo) {
		System.out.println("--->jdbcTemplate로 getReserve() 기능 처리");
		Object[] orgs = {vo.getUser_id(), vo.getReserve_num()};
		
		List<ReServeVO> list =  jdbcTemplate.query(RESERVE_GET,orgs, new RserveRowMapper_2());
		
		//중복되는 리뷰넘버는 서비스넘버빼고는 모두 동일하니 인덱스0의 데이터를 셋팅합니다.
		ReServeVO listvo = list.get(0);
		
		vo.setPart_id(listvo.getPart_id());
		vo.setS_num(listvo.getS_num());
		vo.setReserve_day(listvo.getReserve_day());
		vo.setPart_id(listvo.getPart_id());
		vo.setPet_id(listvo.getPet_id());
		vo.setStatus(listvo.getStatus());
		vo.setVoPet(listvo.getVoPet());
		vo.setVoP(listvo.getVoP());
		vo.setReserve_time(listvo.getReserve_time());
		vo.setReserve_add(listvo.getReserve_add());
		vo.setReserve_request(listvo.getReserve_request());
		vo.setPick_add(listvo.getPick_add());
		
		//중복된 리뷰넘버의 서로다른 서비스넘버를 리스트로 받아옵니다.
		List<Integer> snumList = new ArrayList<Integer>();
		
		for(ReServeVO snum : list) {
			if(snum.getS_num()==2 || snum.getS_num()==1 || snum.getS_num()==3 || snum.getS_num()==4 || snum.getS_num()==5 || snum.getS_num()==8) {
				continue;
			}
			snumList.add(snum.getS_num());
		}
		vo.setS_numArr((ArrayList<Integer>) snumList);
		
		return vo;
	}
	
	
	/*
	 * 특정회원의 예약내역리스트를 조회하는 메서드
	 */
	public List<ReServeVO> getReserveList(ReServeVO vo){
		System.out.println("---> jdbcTemplate로 getReserveList() 기능 처리");
		
		Object[] orgs = {vo.getUser_id()};		
		List<ReServeVO> list =  jdbcTemplate.query(RESERVE_LIST,orgs,new RserveRowMapper_2());
		List<ReServeVO> newList = new ArrayList<ReServeVO>();
		String number = "";
		
		int count = list.toArray().length;
		for(int i = 0; i<count;i++) {
			ReServeVO rvo = list.get(i);
			if(rvo.getReserve_num().equals(number)) {
				
				System.out.println("같은 예약번호이므로 넘어갑니다.");
				continue;
			}
			System.out.println("다른 예약번호이므로 저장합니다.");
			number = rvo.getReserve_num();
			newList.add(rvo);
		}

		return newList;
		
	}
	
	/*
	 * 서비스가완료된 예약내역리스트를 조회하는 메서드
	 */
	
	public List<ReServeVO> getCPTReserveList(ReServeVO vo) {
		System.out.println("---> jdbcTemplate로 getCPTReserveList() 기능 처리");
		
		Object[] orgs = {vo.getUser_id()};		
		List<ReServeVO> list =  jdbcTemplate.query(RESERVE_COMPLETELIST,orgs,new RserveRowMapper_2());
		List<ReServeVO> newList = new ArrayList<ReServeVO>();
		String number = "";
		
		int count = list.toArray().length;
		for(int i = 0; i<count;i++) {
			ReServeVO rvo = list.get(i);
			if(rvo.getReserve_num().equals(number)) {
				
				System.out.println("같은 예약번호이므로 넘어갑니다.");
				continue;
			}
			System.out.println("다른 예약번호이므로 저장합니다.");
			number = rvo.getReserve_num();
			newList.add(rvo);
		}

		return newList;
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
		int last = lastSeq()+1;
		
		System.out.println("last : " + last);
		ReServeVO reserve = new ReServeVO();
		reserve.setReserve_num("RN_" + last);
		reserve.setReserve_day(request.getParameter("reserve_day"));
		reserve.setReserve_time(request.getParameter("reserve_time"));
		reserve.setReserve_add(request.getParameter("address") + " " + request.getParameter("detailAddress"));
		//reserve.setS_num(Integer.parseInt(request.getParameter("s_num")));
		reserve.setUser_id(request.getParameter("user_id"));
		reserve.setPart_id(request.getParameter("part_id"));
		reserve.setPet_id(Integer.parseInt(request.getParameter("pet_id")));
		//reserve.setPick_add(request.getParameter("pick_add"));
		reserve.setReserve_request(request.getParameter("reserve_request"));
		return reserve;
	}
	
	public int lastSeq() {
		int last_num = 0;
		last_num = jdbcTemplate.queryForObject(RESERVE_LAST_SEQ, Integer.class);
		return last_num;
	}

	// 230217 정영현
	public List<ReServeVO> getReserveListPart(ReServeVO vo){
		Object[] obj = {vo.getPart_id()};
		List<ReServeVO> list =  jdbcTemplate.query(GETRESERVE_LIST,obj, new ReserveRowMapper());
		List<ReServeVO> newList = new ArrayList<ReServeVO>();
		String number = "";
		
		int count = list.toArray().length;
		for(int i = 0; i<count;i++) {
			ReServeVO rvo = list.get(i);
			if(rvo.getReserve_num().equals(number)) {
				
				System.out.println("같은 예약번호이므로 넘어갑니다.");
				continue;
			}
			System.out.println("다른 예약번호이므로 저장합니다.");
			number = rvo.getReserve_num();
			newList.add(rvo);
		}

		return newList;
		
	}
	
	public List<ReServeVO> getReserveListCare(ReServeVO vo){
		Object[] obj = {vo.getPart_id()};
		List<ReServeVO> list =  jdbcTemplate.query(GETRESERVE_LISTCARE,obj, new ReserveRowMapper());
		List<ReServeVO> newList = new ArrayList<ReServeVO>();
		String number = "";
		
		int count = list.toArray().length;
		for(int i = 0; i<count;i++) {
			ReServeVO rvo = list.get(i);
			if(rvo.getReserve_num().equals(number)) {
				
				System.out.println("같은 예약번호이므로 넘어갑니다.");
				continue;
			}
			System.out.println("다른 예약번호이므로 저장합니다.");
			number = rvo.getReserve_num();
			newList.add(rvo);
		}

		return newList;
	}
	// 예약 일정 관리 확인
	public ReServeVO getReserveDetail(ReServeVO vo) {
		System.out.println("--->jdbcTemplate로 getReserve() 기능 처리");
		Object[] orgs = {vo.getUser_id(), vo.getReserve_num()};
		
		List<ReServeVO> list =  jdbcTemplate.query(RESERVE_GETTO,orgs, new ReserveRowMapper());
		
		//중복되는 리뷰넘버는 서비스넘버빼고는 모두 동일하니 인덱스0의 데이터를 셋팅합니다.
		ReServeVO listvo = list.get(0);
		
		vo.setPart_id(listvo.getPart_id());
		vo.setS_num(listvo.getS_num());
		vo.setReserve_day(listvo.getReserve_day());
		vo.setPart_id(listvo.getPart_id());
		vo.setPet_id(listvo.getPet_id());
		vo.setStatus(listvo.getStatus());
		vo.setVoPet(listvo.getVoPet());
		vo.setReserve_time(listvo.getReserve_time());
		vo.setReserve_add(listvo.getReserve_add());
		vo.setReserve_request(listvo.getReserve_request());
		vo.setPick_add(listvo.getPick_add());
		vo.setVoU(listvo.getVoU());
		
		//중복된 리뷰넘버의 서로다른 서비스넘버를 리스트로 받아옵니다.
		List<Integer> snumList = new ArrayList<Integer>();
		
		for(ReServeVO snum : list) {
			if(snum.getS_num()==2 || snum.getS_num()==1 || snum.getS_num()==3 || snum.getS_num()==4 || snum.getS_num()==5 || snum.getS_num()==8) {
				continue;
			}
			snumList.add(snum.getS_num());
		}
		vo.setS_numArr((ArrayList<Integer>) snumList);
		
		return vo;
	}
	
	

}
