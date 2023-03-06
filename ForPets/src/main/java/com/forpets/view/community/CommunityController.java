package com.forpets.view.community;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
import com.forpets.biz.survey.SurveyDetailService;
import com.forpets.biz.user.UserVO;

@Controller
public class CommunityController {

	@Autowired
	CommunityService comservice;
	
	@Autowired
	ComdatService datservice;
	
	@Autowired
	SurveyDetailService svservice;
	
	// 게시판 목록 불러오기
	@RequestMapping("/communitylist")
	public ModelAndView community() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Community/Community_List");
		mav.addObject("communityList", comservice.getCommunityList());
		mav.addObject("svcode", svservice.getSurveyList());	
		return mav;
	}
	
	// 글 번호 매기기
	@RequestMapping("/getcommunity")
	public ModelAndView insertcommunity() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Community/Create_Community");
		return mav;
	}
	
	@RequestMapping("/getcommunity/{c_code}")
	public ModelAndView insertcomm(@PathVariable String c_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Community/Create_Community");
		mav.addObject("cscode", c_code);
		return mav;
	}
	
	
	// 소모임 글 등록
	@RequestMapping("/insertcommunity")
	@ResponseBody
	public ModelAndView insertBoard(@ModelAttribute CommunityVO vo, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		CommunityVO svo = new CommunityVO();
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		
		svo.setC_code(vo.getC_code());
		svo.setC_title(vo.getC_title());
		svo.setC_content(vo.getC_content());
		svo.setC_pet(vo.getC_pet());
		svo.setUser_id(SessionVO.getUser_id());
		comservice.insertCommunity(svo);
		mav.setViewName("/Community/Community_List");
		mav.addObject("communityList", comservice.getCommunityList());
		return mav;
	}
	
	// 커뮤니티 글 상세보기
	@RequestMapping(value = "/viewcommunityboard/{c_code}", method = RequestMethod.GET) 
	public ModelAndView getCommunityBoard(@PathVariable String c_code) throws Exception {
//		System.out.println(c_code);
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/Community/View_Community");
		mav.addObject("communityboard", comservice.getCommunityBoard(c_code));
		mav.addObject("getdat", datservice.getComdat(c_code));
		return mav;
	}
	
	@RequestMapping(value = "/viewcommunityboard/{c_code}/{sv_code}", method = RequestMethod.GET) 
	public ModelAndView getCommunityBoard(@PathVariable("c_code") String c_code, @PathVariable("sv_code") String sv_code) throws Exception {
		System.out.println("c_code : "+c_code);
		System.out.println("sv_code : " + sv_code);
		
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/Community/View_Community");
		mav.addObject("communityboard", comservice.getCommunityBoard(c_code));
		mav.addObject("getdat", datservice.getComdat(c_code));
		mav.addObject("svcode", svservice.getAnswerList(sv_code));
		return mav;
	}
	
	// 글 수정 -> read
	@RequestMapping("/updatecommunity/{c_code}") 
	public ModelAndView updateCommunity(@PathVariable String c_code) throws Exception {
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/Community/Update_Community"); // jsp로 연결
		mav.addObject("communityboard", comservice.getCommunityBoard(c_code));
		return mav;
	} 
	
	@RequestMapping(value = "/updateboard.do", method = RequestMethod.POST)
	public ModelAndView updateCommunity(@ModelAttribute CommunityVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		CommunityVO svo = new CommunityVO();
		svo.setC_title(vo.getC_title());
		svo.setC_content(vo.getC_content());
		svo.setC_pet(vo.getC_pet());
		svo.setC_code(vo.getC_code());
		comservice.updateComunity(svo);
		mav.setViewName("redirect:/communitylist");
		
		return mav;
	}
	
	// 글 삭제
	@RequestMapping("/deletecommunity/{c_code}")
	public String deleteCommunity(@PathVariable String c_code) throws Exception {
		comservice.deleteCommunity(c_code);
		return "redirect:/communitylist";
	}
	

	//마이페이지 마이소모임메인페이지를 불러옵니다.
	@RequestMapping("/myInfo/viewMycommuMain")
	public String viewMyCommuPage() {
		return "myInfo/myCommunity_main";
	}
	
	//내가 작성한 소모임 글을 불러옵니다.
	@RequestMapping("/myInfo/getMyCommu")
	public String getMyCommunity(HttpSession session, Model model) throws Exception {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		try {
			model.addAttribute("myCommuList", comservice.getListMyPost(sessionVO.getUser_id()));
		}catch(EmptyResultDataAccessException e) {
			model.addAttribute("myCommuList", new CommunityVO());
		}
		return "myInfo/myCommunity_post";
	}
	
	//내가참여한소모임글을불러옵니다.
	@RequestMapping("/myInfo/getCommuInMyAnswer")
	public String getCommunityInMyAnswer(HttpSession session, Model model) throws Exception {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		try {
			model.addAttribute("myCommuList", comservice.getPostInMyAnswer(sessionVO.getUser_id()));
		}catch(EmptyResultDataAccessException e) {
			model.addAttribute("myCommuList", new CommunityVO());
		}
		return "myInfo/myCommunity_answerCommunity";
	}
	


}
