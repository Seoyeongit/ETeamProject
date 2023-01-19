package com.forpets.view.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;

@Controller
public class PartnerController {
	@Autowired
	private PartnerService partnerService;
	
	@RequestMapping(value="getPartnerList.do")
	public String getPartnerList(PartnerVO partvo, PartnerDAO partnerDAO, Model model) {
		model.addAttribute("getPartnerList", partnerService.getPartnerList(partvo));	// Model 정보 저장
		return "./Service/getPartnerList.jsp";
	}
}
