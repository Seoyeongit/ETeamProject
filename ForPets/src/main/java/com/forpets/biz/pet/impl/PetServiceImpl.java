package com.forpets.biz.pet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;

@Service("PetService")
public class PetServiceImpl implements PetService {
	
	@Autowired
	private PetDAO petDAO;

	@Override
	public PetVO getPet(PetVO pvo, String user_id) {
		return petDAO.getPet(pvo, user_id);
	}

	@Override
	public List<PetVO> getPetList(PetVO vo, String user_id) {
		return petDAO.getPetList(vo, user_id);
	}

}
