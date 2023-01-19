package com.forpets.view.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.community.CommunityService;

@Controller
@RequestMapping("/")
public class CommunityController {

	@Autowired
	CommunityService comservice;
	
	@RequestMapping("/communitylist.do")
	public ModelAndView community() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/community");
		mav.addObject("communityList", comservice.getCommunityList());
		// System.out.println("커뮤니티목록 생성");
		return mav;
	}
}
