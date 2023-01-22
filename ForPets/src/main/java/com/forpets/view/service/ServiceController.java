package com.forpets.view.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.pet.impl.PetDAO;

@Controller
public class ServiceController {
	@Autowired
	private PetService petService;
	
	@RequestMapping(value="getPet.do")
	public void getPet(PetVO vo, PetDAO petDAO, HttpSession session, HttpServletRequest request) {
		session.setAttribute("pet_info", petService.getPet(vo, request.getParameter("pet_id")));
		System.out.println("OK");
	}
	
	@RequestMapping(value="getPetList.do")
	public String getPetList(PetVO pvo, PetDAO petDAO, Model model) {
		System.out.println("---> getPetList.do 실행");
		model.addAttribute("getPetList", petService.getPetList(pvo, "abc123"));	// Model 정보 저장
		return "./Service/getPetList.jsp";
	}
}
