package com.forpets.view.comdat;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.comdat.ComdatService;
import com.forpets.biz.comdat.ComdatVO;
import com.forpets.biz.community.CommunityService;
import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.pet.impl.PetDAO;
import com.forpets.biz.user.UserVO;

@Controller
public class ComdatController {

	@Autowired
	ComdatService datservice;
	@Autowired
	CommunityService commuService;
	
	
	// 댓글 작성하기
	@RequestMapping(value = "/insertcomdat", method = RequestMethod.POST)
	public ModelAndView insertcomdat(@ModelAttribute ComdatVO vo, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		
		cvo.setD_code(vo.getD_code());
		cvo.setUser_id(SessionVO.getUser_id());
		cvo.setD_content(vo.getD_content());
		mav.setViewName("redirect:/viewcommunityboard/"+vo.getD_code()+"");
		datservice.insertComdat(cvo);


		return mav;
	}
	

	@RequestMapping(value = "/updatedat", method = RequestMethod.POST)
	public ModelAndView updateComdat(@ModelAttribute ComdatVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		cvo.setD_content(vo.getD_content());
		cvo.setD_code(vo.getD_code());
		cvo.setD_num(vo.getD_num());
		datservice.updateComdat(cvo);
		mav.setViewName("redirect:/viewcommunityboard/"+vo.getD_code()+"");
		
		return mav;
	}
	
	@RequestMapping(value="/deletedat")
	public ModelAndView deleteComdat(@ModelAttribute ComdatVO vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		ComdatVO cvo = new ComdatVO();
		cvo.setD_code(vo.getD_code());
		cvo.setD_num(vo.getD_num());
		datservice.deleteComdat(cvo);
		mav.setViewName("redirect:/viewcommunityboard/"+vo.getD_code()+"");
		
		return mav;
	}
	
	@RequestMapping(value="/myInfo/getMyDat")
	public String getMyComdat(HttpSession session, Model model) {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		try {
			HashMap<Integer, CommunityVO>list = new HashMap<Integer, CommunityVO>();
			List<ComdatVO> result = datservice.getMyComdat(sessionVO.getUser_id());
			
			for(int i = 0; i<result.size(); i++) {
				try {
				list.put(result.get(i).getD_num(), commuService.getCommunityBoard(result.get(i).getD_code()));
				}catch(EmptyResultDataAccessException e) {
					list.put(-0,new CommunityVO());
				}
			}
			model.addAttribute("myDat", result);
			model.addAttribute("postInMyDat",list);
			
		}catch(EmptyResultDataAccessException e) {
			System.out.println("--->catch메서드실행되었습니다.");
			model.addAttribute("myDat", new ArrayList<ComdatVO>());
		}
		return "myInfo/myCommunity_comment";
	}
	
	@RequestMapping(value = "/myInfo/deleteMyDat", method = RequestMethod.POST)
	public  ResponseEntity<String> insertPet(ComdatVO vo) {
		datservice.deleteComdat(vo);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
}
