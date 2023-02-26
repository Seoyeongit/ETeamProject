package com.forpets.biz.carediary.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.carediary.CareDiaryVO;
import com.forpets.biz.reserve.ReServeVO;

@Repository("careDiaryDAO")
public class CareDiaryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final String INSERT_DIA ="INSERT INTO CAREDIARY VALUES((CDIA_SEQ.NEXTVAL),?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private final String 
			GETLIST_DIA = "select * " + 
			"from carediary\r\n" + 
			"join reserve on carediary.reserve_num = reserve.reserve_num\r\n" + 
			"join partners on reserve.part_id = partners.part_id\r\n" + 
			"join user_pet on reserve.pet_id = user_pet.pet_id\r\n" + 
			"where reserve.user_id = ?";
	
	private final String GET_DIA = "select * " + 
			"from carediary\r\n" + 
			"join reserve on carediary.reserve_num = reserve.reserve_num\r\n" + 
			"join partners on reserve.part_id = partners.part_id\r\n" + 
			"join user_pet on reserve.pet_id = user_pet.pet_id\r\n" + 
			"where reserve.user_id = ? " + 
			"and carediary.diary_id = ?";
	
	
	
	public List<CareDiaryVO> getCareDiary(CareDiaryVO vo, String user_id) {
		Object[] obj = {user_id};
		
		List<CareDiaryVO> list = jdbcTemplate.query(GETLIST_DIA, obj, new CareDiaryRowMapper());
		
		List<CareDiaryVO> newList = new ArrayList<CareDiaryVO>();
		
		String number = "";
		
		int count = list.toArray().length;

		for(int i = 0; i<count;i++) {
			CareDiaryVO rvo = list.get(i);
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
	
	public CareDiaryVO getCareDiaryDetail(int diary_id, String user_id) {
		Object[] obj = {user_id, diary_id};
		List<CareDiaryVO> list = jdbcTemplate.query(GET_DIA, obj, new CareDiaryRowMapper());
		
		//중복되는 리뷰넘버는 서비스넘버빼고는 모두 동일하니 인덱스0의 데이터를 셋팅합니다.
		CareDiaryVO listvo = list.get(0);
		CareDiaryVO vo = new CareDiaryVO();
		
		vo.setDiary_id(listvo.getDiary_id());
		vo.setPet_condition(listvo.getPet_condition());
		vo.setCare_review(listvo.getCare_review());
		vo.setMedi_result(listvo.getMedi_result());
		vo.setWalk_time(listvo.getWalk_time());
		vo.setShower_serv(listvo.getShower_serv());
		vo.setTraining_serv(listvo.getTraining_serv());
		vo.setMeal(listvo.getMeal());
		vo.setSnak(listvo.getSnak());
		vo.setPet_play(listvo.getPet_play());
		vo.setComplete_day(listvo.getComplete_day());
		vo.setComplete_time(listvo.getComplete_time());
		vo.setVoR(listvo.getVoR());
		vo.setBeauty_list(listvo.getBeauty_list());
		
		//중복된 리뷰넘버의 서로다른 서비스넘버를 리스트로 받아옵니다.
		List<Integer> snumList = new ArrayList<Integer>();
		
		for(CareDiaryVO snum : list) {
			if(snum.getVoR().getS_num()==2) {
				continue;
			}
			snumList.add(snum.getVoR().getS_num());
		}
		vo.getVoR().setS_numArr((ArrayList<Integer>) snumList);
		
		
		return vo;
	}
	
	
	public void insertCareDiary(CareDiaryVO vo) {
		Object[] obj = {vo.getPet_condition(), vo.getCare_review(), vo.getMedi_result(), vo.getBeauty_list(), vo.getWalk_time(), vo.getShower_serv(), vo.getTraining_serv(), vo.getMeal(), vo.getSnak(), vo.getPet_play(), vo.getReserve_num(),vo.getComplete_day(),vo.getComplete_time()};
		jdbcTemplate.update(INSERT_DIA, obj);
	}

}