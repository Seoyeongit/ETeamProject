package com.forpets.view.reserve;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.reserve.impl.ReserveDAO;
import com.forpets.biz.user.UserVO;

@Controller
@SessionAttributes("Reserve")
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	
	
	/**
	 * 예약내역으로 이동하는 메서드
	 */
	
	@RequestMapping(value = "/myInfo/check-reservation")
	public String viewReserveList (ReServeVO vo, ReserveDAO reserveDAO, Model model,HttpSession session) {
		System.out.println("--->Enter in Reserve-check page....");
		
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		vo.setUser_id(SessionVO.getUser_id());
		
		try {
			model.addAttribute("resultCnt", reserveService.selectCount(vo));
			model.addAttribute("resultCP", reserveService.selectCompleteCount(vo));
			model.addAttribute("reserveList", reserveService.getReserveList(vo));
			
			System.out.println(model.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("--->Reserve Controller Error");
		}
		return "myInfo/my_reserve";
	}	
	
	
	@RequestMapping(value="/Service/reserve")
	public String reserve(ReServeVO vo, ReserveDAO reserveDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> reserve.do 실행");
		session.setAttribute("reserve", reserveService.makeReserve(vo, request));
		System.out.println("---> reservo.do 완료");
		return "Service/reserve";
	}
	
	@RequestMapping(value="/Service/reserveInsert")
	public String insertReserve(ReServeVO vo, PetVO pvo, Model model, HttpSession session) {
		System.out.println("---> reserveInsert.do 실행");
		pvo = (PetVO) session.getAttribute("pet_info");
		vo = (ReServeVO) session.getAttribute("reserve");
		reserveService.insertReserve(vo, pvo);
		System.out.println("---> reserveInsert.do 완료");
		return "Service/complete";
	}
	
}