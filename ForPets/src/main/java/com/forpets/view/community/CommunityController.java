package com.forpets.view.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.comdat.ComdatService;
import com.forpets.biz.community.CommunityService;
import com.forpets.biz.community.CommunityVO;

@Controller
public class CommunityController {

	@Autowired
	CommunityService comservice;
	
	@Autowired
	ComdatService datservice;
	
	// 게시판 목록 불러오기
	@RequestMapping("/communitylist.do")
	public ModelAndView community() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Community/community");
		mav.addObject("communityList", comservice.getCommunityList());
		// System.out.println("커뮤니티목록 생성");
		return mav;
	}
	
	// 글 번호 매기기
	@RequestMapping("/getcommunity.do")
	public ModelAndView insertcommunity() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Community/getCommunity");
//		mav.addObject("listcount", comservice.getlistcount());
//		mav.addObject("communityList", comservice.getCommunityList());
		// System.out.println("커뮤니티목록 생성");
		return mav;
	}
	
	
	// 소모임 글 등록
	@RequestMapping("/insertcommunity.do")
	@ResponseBody
	public ModelAndView insertBoard(@ModelAttribute CommunityVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		CommunityVO svo = new CommunityVO();
		svo.setC_code(vo.getC_code());
		svo.setC_title(vo.getC_title());
		svo.setC_content(vo.getC_content());
		svo.setUser_id("pow111");
//		svo.setUser_id(vo.getUser_id());
		comservice.insertCommunity(svo);
		mav.setViewName("/Community/community");
		mav.addObject("communityList", comservice.getCommunityList());
		return mav;
	}
	
	// 커뮤니티 글 상세보기
	@RequestMapping(value = "/getcommunityboard.do/{c_code}", method = RequestMethod.GET) 
	public ModelAndView getCommunityBoard(@PathVariable String c_code) throws Exception {
//		System.out.println(c_code);
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/Community/getCommunityBoard");
		mav.addObject("communityboard", comservice.getCommunityBoard(c_code));
		mav.addObject("getdat", datservice.getComdat(c_code));
		return mav;
	} 
	
	// 글 수정 -> read
	@RequestMapping("/updatecommunity.do/{c_code}") 
	public ModelAndView updateCommunity(@PathVariable String c_code) throws Exception {
//		System.out.println(c_code);
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/Community/updateCommunity"); // jsp로 연결
		mav.addObject("communityboard", comservice.getCommunityBoard(c_code));
		return mav;
	} 
	
	@RequestMapping(value = "/updateboard.do", method = RequestMethod.POST)
	public ModelAndView updateCommunity(@ModelAttribute CommunityVO vo) throws Exception {
		System.out.println("컨트롤러 연결");
		ModelAndView mav = new ModelAndView();
		CommunityVO svo = new CommunityVO();
		svo.setC_title(vo.getC_title());
		svo.setC_content(vo.getC_content());
		svo.setC_code(vo.getC_code());
		comservice.updateComunity(svo);
		mav.setViewName("redirect:/communitylist.do");
		
		return mav;
	}
	
	// 글 삭제
	@RequestMapping("/deletecommunity.do/{c_code}")
	public String deleteCommunity(@PathVariable String c_code) throws Exception {
		// System.out.println("삭제 연결");
		comservice.deleteCommunity(c_code);
		return "redirect:/communitylist.do";
	}
	

}
