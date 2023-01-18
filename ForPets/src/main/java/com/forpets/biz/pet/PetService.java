package com.forpets.biz.pet;

import java.util.List;

/*
 *  펫관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface PetService {
	
	PetVO getPet(PetVO pvo, String user_id);
	
	List<PetVO> getPetList(PetVO vo, String user_id);
}
