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
	List<CareDiaryVO> getCareDiary (CareDiaryVO vo);
	
	/**
	 * 돌봄일지를 등록합니다.
	 */
	 void insertCareDiary(CareDiaryVO vo);

}
