package com.forpets.view.reserve;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.reserve.impl.ReserveDAO;

@Controller
@RequestMapping(value = "/myInfo")
@SessionAttributes("Reserve")
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	
	
	/**
	 * 예약내역으로 이동하는 메서드
	 */
	
	@RequestMapping(value = "/check-reservation")
	public String viewReserveList (ReServeVO vo, ReserveDAO reserveDAO, Model model) {
		System.out.println("--->Enter in Reserve-check page....");
		
		try {
			model.addAttribute("resultCnt", reserveService.selectCount());
			model.addAttribute("resultCP", reserveService.selectCompleteCount());
			model.addAttribute("reserveList", reserveService.getReserveList(vo));
			
			System.out.println(model.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("--->Reserve Controller Error");
		}
		return "myInfo/my_reserve";
	}	
	

	
}