package com.forpets.view.partner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;

@Controller
public class PartnerController {
	@Autowired
	private PartnerService partnerService;
	
	@RequestMapping(value="getPartnerList.do")
	public String getPartnerList(PartnerVO partvo, PartnerDAO partnerDAO, Model model) {
		System.out.println("---> getPartnerList.do 실행");
		model.addAttribute("getPartnerList", partnerService.getPartnerList(partvo));	// Model 정보 저장
		System.out.println("---> getPartnerList.do 완료");
		return "./Service/getPartnerList.jsp";
	}
	
	@RequestMapping(value="getPartner.do")
	@ResponseBody
	public void getPartner(PartnerVO vo, PartnerDAO partnerDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getPartner.do 실행");
		session.setAttribute("part_info", partnerService.getPartner(vo, request.getParameter("part_id")));
		System.out.println("---> getPartner.do 완료");
	}
}
