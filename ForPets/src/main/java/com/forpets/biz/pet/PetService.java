package com.forpets.biz.pet;

import java.util.List;

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
	
	/**
	 * 펫정보가 몇개인지 count한다.
	 */
	int countPet(PetVO vo);
	
	/**
	 * 펫정보를 수정한다.
	 * @param vo
	 * @param user_id
	 * @return
	 */
	void updatePet(PetVO vo);
	
	//230130 최지혁
	List<PetVO> getPetList(PetVO vo, String user_id);
	
	//230130 최지혁
	PetVO getPet(PetVO pvo, String user_id);
}
