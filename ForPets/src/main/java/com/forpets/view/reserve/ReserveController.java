package com.forpets.view.reserve;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.reserve.ReserveVO;
import com.forpets.biz.reserve.impl.ReserveDAO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	@RequestMapping(value="/Service/{pageName}")
	public String getServicePage(@PathVariable("pageName")String pageName) {
		return "Service/" + pageName;
	}
	
	@RequestMapping(value="/FindHospital/{pageName}")
	public String getFindHospitalPage(@PathVariable("pageName")String pageName) {
		return "FindHospital/" + pageName;
	}
	
	@RequestMapping(value="/Service/reserve")
	public String reserve(ReserveVO vo, ReserveDAO reserveDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> reserve.do 실행");
		session.setAttribute("reserve", reserveService.makeReserve(vo, request));
		System.out.println("---> reservo.do 완료");
		return "Service/reserve";
	}
	
	@RequestMapping(value="/Service/reserveInsert")
	public String insertReserve(ReserveVO vo, PetVO pvo, Model model, HttpSession session) {
		System.out.println("---> reserveInsert.do 실행");
		pvo = (PetVO) session.getAttribute("pet_info");
		vo = (ReserveVO) session.getAttribute("reserve");
		reserveService.insertReserve(vo, pvo);
		System.out.println("---> reserveInsert.do 완료");
		return "Service/complete";
	}
	
}
