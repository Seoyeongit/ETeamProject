package com.forpets.biz.pet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;

@Service("petService")
public class PetServiceImpl implements PetService {
	@Autowired
	private PetDAO petDAO;
	

	@Override
	public void insertPet(PetVO vo) {
		petDAO.insertPet(vo);
	}


	@Override
	public List<PetVO> getPetInfo(String user_id) {
		return petDAO.getPetInfo(user_id);
	}
	
	@Override
	public int countPet(PetVO vo) {
		return petDAO.countPet(vo);
	}
	
	@Override
	public PetVO getPetDetail(Integer pet_id) {
		return petDAO.getPetDetail(pet_id);
	}
	
	//230130 최지혁 - 펫 리스트
	@Override
	public List<PetVO> getPetList(PetVO vo, String user_id) {
		return petDAO.getPetList(vo, user_id);
	}
	
	@Override
	public PetVO getPet(PetVO pvo, String pet_id) {
		return petDAO.getPet(pvo, pet_id);
	}


	@Override
	public void updatePet(PetVO vo) {
		petDAO.updatePet(vo);
	}
}
