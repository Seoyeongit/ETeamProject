package com.forpets.view.comdat;

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

@Controller
public class ComdatController {

	@Autowired
	ComdatService datservice;
	
	
	// 댓글 작성하기
	@RequestMapping(value = "/insertcomdat.do", method = RequestMethod.POST)
	public ModelAndView insertcomdat(@ModelAttribute ComdatVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		cvo.setD_code(vo.getD_code());
		cvo.setUser_id("pow111");
		cvo.setD_content(vo.getD_content());
		mav.setViewName("redirect:/getcommunityboard.do/"+vo.getD_code()+"");
		datservice.insertComdat(cvo);


		return mav;
	}
}
