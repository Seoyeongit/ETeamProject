package com.forpets.view.reserve;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
import com.forpets.biz.service.ServiceVO;
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
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("--->Reserve Controller Error");
		}
		return "myInfo/my_reserve";
	}	
	
	
	//예약내역데이터를 가져온 뒤 . 리뷰작성view로 넘어가는 메서드
	@RequestMapping(value = "/myInfo/review")
	public String viewReviewReserveList (ReServeVO vo, ReserveDAO reserveDAO, Model model,HttpSession session) {
		
			UserVO voU = (UserVO) session.getAttribute("member");
			vo.setUser_id(voU.getUser_id());
			model.addAttribute("reserveList", reserveService.getCPTReserveList(vo));
		
		return "myInfo/myReview";
		
	}
	
	
	
	@RequestMapping(value="/Service/choice")
	public String choice(UserVO vo, HttpSession session) {
		System.out.println("---> choice 실행");
		if(session.getAttribute("member") == null) {
			System.out.println("---> choice 완료, login 이동");
			return "member/login";
		}
		else {
			System.out.println("---> choice 완료, choice 이동");
			return "Service/choice";
		}
		
	}
	
	@RequestMapping(value="/Service/reserve")
	public String reserve(ReServeVO vo, ReserveDAO reserveDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> reserve 실행");
		session.setAttribute("reserve", reserveService.makeReserve(vo, request));
		String[] pa_List = request.getParameterValues("pick_add");
		session.setAttribute("pa_List", pa_List);
		System.out.println("---> reservo 완료");
		return "Service/reserve";
	}
	
	@RequestMapping(value="/Service/reserveInsert")
	public String insertReserve(ReServeVO vo, PetVO pvo, Model model, HttpSession session) {
		System.out.println("---> reserveInsert 실행");
		pvo = (PetVO) session.getAttribute("pet_info");
		vo = (ReServeVO) session.getAttribute("reserve");
		boolean check = false;
		if(session.getAttribute("pa_List") != null) check = true;
		String[] pa_List = (String[]) session.getAttribute("pa_List");
		ArrayList<ServiceVO> svoList = (ArrayList) session.getAttribute("servList");
		int count = svoList.toArray().length;
		for(int i=0;i<count;i++) {
			ServiceVO svo = svoList.get(i);
			System.out.println(i+ "번째 s_num : " + svo.getS_num());
			vo.setS_num(svo.getS_num());
			if(check) {
				int j = i;
				System.out.println(j + "번째 pick_add : " + pa_List[j]);
				vo.setPick_add(pa_List[j]);
			}
			reserveService.insertReserve(vo, pvo);
		}
		System.out.println("---> reserveInsert 완료");
		return "Service/complete";
	}
	
}