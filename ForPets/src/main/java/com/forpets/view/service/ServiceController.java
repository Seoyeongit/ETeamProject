package com.forpets.view.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.pet.impl.PetDAO;

public class ServiceController {
	@Autowired
	private PetService petService;
	
	@RequestMapping(value="getPetList.do")
	public String getPetList(PetVO pvo, PetDAO petDAO, Model model) {
		model.addAttribute("getPetList", petService.getPetList(pvo, "abc123"));	// Model 정보 저장
		return "getPetList.jsp";
	}
}
