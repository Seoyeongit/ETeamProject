package com.forpets.biz.pet;
/*
 *  펫관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface PetService {
	//CRUD메서드 기능 
	
	/**
	 * 펫정보를 DB에 인서트한다.
	 * @param 펫모듈을 파라미터값으로한다.
	 */
	void insertPet(PetVO vo);
	
	/**
	 * 펫정보를 DB에서 가져온다.
	 * @param vo 펫모듈을 파라미터 값으로 한다.
	 * @return petVO가 리턴되며 해당객체는 가져온 펫정보가 초기화된 객체이다.
	 */
	PetVO getPetInfo (PetVO vo);
}
