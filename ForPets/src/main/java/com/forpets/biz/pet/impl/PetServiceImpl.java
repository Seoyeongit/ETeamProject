package com.forpets.biz.pet.impl;

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
	public PetVO getPetInfo(PetVO vo) {
		return petDAO.getPetInfo(vo);
	}

}
