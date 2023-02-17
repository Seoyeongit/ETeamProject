package com.forpets.view.comdat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.comdat.ComdatService;
import com.forpets.biz.comdat.ComdatVO;
import com.forpets.biz.community.CommunityService;
import com.forpets.biz.user.UserVO;

@Controller
public class ComdatController {

	@Autowired
	ComdatService datservice;
	
	
	// 댓글 작성하기
	@RequestMapping(value = "/insertcomdat.do", method = RequestMethod.POST)
	public ModelAndView insertcomdat(@ModelAttribute ComdatVO vo, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		
		cvo.setD_code(vo.getD_code());
		cvo.setUser_id(SessionVO.getUser_id());
		cvo.setD_content(vo.getD_content());
		mav.setViewName("redirect:/getcommunityboard.do/"+vo.getD_code()+"");
		datservice.insertComdat(cvo);


		return mav;
	}
	

	@RequestMapping(value = "/updatedat.do", method = RequestMethod.POST)
	public ModelAndView updateComdat(@ModelAttribute ComdatVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		cvo.setD_content(vo.getD_content());
		cvo.setD_code(vo.getD_code());
		cvo.setD_num(vo.getD_num());
		datservice.updateComdat(cvo);
		mav.setViewName("redirect:/getcommunityboard.do/"+vo.getD_code()+"");
		
		return mav;
	}
	
	@RequestMapping(value="/deletedat.do")
	public ModelAndView deleteComdat(@ModelAttribute ComdatVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		cvo.setD_code(vo.getD_code());
		cvo.setD_num(vo.getD_num());
		datservice.deleteComdat(cvo);
		mav.setViewName("redirect:/getcommunityboard.do/"+vo.getD_code()+"");
		
		return mav;
	}
	
	
}
