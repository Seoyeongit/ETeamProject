package com.forpets.view.partner;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.user.UserVO;

@Controller
public class PartnerController {
	
	//230130 최지혁
	@Autowired
	private PartnerService partnerService;
	
	@RequestMapping(value="/partner/partner")
	public String partner(PartnerVO vo, PartnerDAO dao) {
		return "/partner/partner";
	}
	
	@RequestMapping(value="getPartnerList")
	public String getPartnerList(PartnerVO partvo, PartnerDAO partnerDAO, Model model) {
		System.out.println("---> getPartnerList.do 실행");
		model.addAttribute("getPartnerList", partnerService.getPartnerList(partvo));	// Model 정보 저장
		System.out.println("---> getPartnerList.do 완료");
		return "./Service/getPartnerList";
	}
	
	@RequestMapping(value="getPartner")
	@ResponseBody
	public void getPartner(PartnerVO vo, PartnerDAO partnerDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getPartner 실행");
		session.setAttribute("part_info", partnerService.getPartner(vo, request.getParameter("part_id")));
		System.out.println("---> getPartner 완료");
	}
	
	@RequestMapping(value="/partner/login",method = RequestMethod.GET)
	public String loginForm() {
		return "partner/login";
	}
	
	@RequestMapping(value="/partner/partnerGet")
	public String partnerGet(PartnerVO vo, PartnerDAO dao, HttpSession session) throws IOException{
		PartnerVO sessionVO = (PartnerVO) session.getAttribute("partners");
		vo.setPart_id(sessionVO.getPart_id());
		session.setAttribute("partners",partnerService.partnerGet(vo));
		return "/partner/partnerGet";
		
	}
	
	@RequestMapping(value="/partner/Modify.do")
	public String updatePartner(PartnerVO vo, PartnerDAO dao) throws IOException{
		return "/partner/partnerModify";
	}
	
	@RequestMapping(value="/partner/login", method = RequestMethod.POST)
	public String login(PartnerVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		System.out.println("아이디 : " + vo.getPart_id());
		
		if(partnerService.partnerGet(vo) != null) {
			session.setAttribute("role","partners" );
			session.setAttribute("partners", partnerService.partnerGet(vo));
			System.out.println(session.getAttribute("partners").toString());
			return "forward://";
		}else {
			return "partner/login";
		}
		
	}	
	
}
