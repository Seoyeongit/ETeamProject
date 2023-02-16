package com.forpets.biz.carediary;

import java.util.List;

/*
 *  돌봄일지관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface CareDiaryService {
	
	
	/**
	 * 돌봄일지를 리스트로 불러옵니다.
	 * @param vo
	 * @return List<CareDiaryVO>
	 */
	List<CareDiaryVO> getCareDiary (CareDiaryVO vo, String user_id);
	
	/**
	 * 특정 돌봄일지 하나를 불러옵니다.
	 * @param diary_id
	 * @param user_id
	 * @return
	 */
	CareDiaryVO getCareDiaryDetail (int diary_id,String user_id );
	
	/**
	 * 돌봄일지를 등록합니다.
	 */
	 void insertCareDiary(CareDiaryVO vo);
	 
	 

}
