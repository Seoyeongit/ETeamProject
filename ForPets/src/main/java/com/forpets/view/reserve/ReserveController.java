package com.forpets.view.reserve;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.reserve.ReserveVO;
import com.forpets.biz.reserve.impl.ReserveDAO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	@RequestMapping(value="reserve.do")
	public String reserve(ReserveVO vo, ReserveDAO reserveDAO, Model model, HttpServletRequest request) {
		System.out.println("---> reserve.do 실행");
		model.addAttribute("reserve", reserveService.makeReserve(vo, request));
		System.out.println("---> reservo.do 완료");
		return "./Service/reserve.jsp";
	}
	
}
