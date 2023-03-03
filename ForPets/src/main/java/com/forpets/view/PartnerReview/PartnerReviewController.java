package com.forpets.view.PartnerReview;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.forpets.biz.partnerReview.PartnerReviewService;
import com.forpets.biz.partnerReview.PartnerReviewVO;
import com.forpets.biz.user.UserVO;

@Controller
public class PartnerReviewController {
	
		 @Autowired
		 PartnerReviewService prservice;
		 
		 // 파트너 리스트
		 @RequestMapping("/partnerlist")
		 public ModelAndView PartnerList() throws Exception {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/PartnerList");
			 mav.addObject("prList", prservice.getPartnerList()); 
			 
			 return mav;
		 }
		 
		 // 파트너 리뷰 리스트
		 @RequestMapping("/partnerreviewlist/{part_id}")
		 public ModelAndView PRList(@PathVariable String part_id) throws Exception {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/PartnerReview_List");
			 mav.addObject("prList", prservice.partName(part_id));
			 mav.addObject("reviewList", prservice.getprReviewList(part_id));
			 mav.addObject("avg",prservice.avg(part_id));
			 mav.addObject("part_id", part_id);
			return mav;
			
		 }
		 
		 // 파트너 글 읽기 
		 @RequestMapping(value ="/viewpartreview/{pr_num}", method = RequestMethod.GET)
		 public ModelAndView PRBoard(@PathVariable int pr_num) throws Exception {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/View_PartnerReview");
			 mav.addObject("prboard", prservice.PRBoard(pr_num));
			 
			 return mav;
		 }
		 
		 @RequestMapping("/createpartreview/{part_id}")
		 public ModelAndView getPRBoard(@PathVariable String part_id) {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/Create_PartReview");
			 mav.addObject("part_id", part_id);
			 return mav;
		 }
		 
		 @RequestMapping("/insertpartreview")
		 public ModelAndView insertPRBoard(@ModelAttribute PartnerReviewVO vo, HttpSession session) throws Exception {
			 ModelAndView mav = new ModelAndView();
			 PartnerReviewVO pvo = new PartnerReviewVO();
			 UserVO SessionVO = (UserVO) session.getAttribute("member");
			 pvo.setPart_id(vo.getPart_id());
			 pvo.setUser_id(SessionVO.getUser_id());
			 pvo.setPr_avg(vo.getPr_avg());
			 pvo.setPr_title(vo.getPr_title());
			 pvo.setPr_content(vo.getPr_content());
			 prservice.insertPRBoard(pvo);
			 mav.setViewName("redirect:/partnerreviewlist/"+vo.getPart_id()+"");
			 
			 return mav;
		 }
		 
		  @RequestMapping("/deletepartreview/{pr_num}&{part_id}")
		  public String deletePR(@PathVariable int pr_num, @PathVariable String part_id) throws Exception {
			  prservice.deletePR(pr_num);
			  
			  return "redirect:/partnerreviewlist/"+part_id+"";
			
		  }
		  
		  
		  @RequestMapping("/updatepartreview/{pr_num}")
		  public ModelAndView updatePR(@PathVariable int pr_num) {
			  ModelAndView mav = new ModelAndView();
			  mav.setViewName("/PartnerReview/Update_PartnerReview");
			  mav.addObject("prboard", prservice.PRBoard(pr_num));
			  return mav;
		  }
		  
		  // 수정 
		  @RequestMapping(value="/updatepartreview", method = RequestMethod.POST)
		  public ModelAndView updatePRBoard(@ModelAttribute PartnerReviewVO vo) throws Exception{
			  
			  ModelAndView mav = new ModelAndView();
			  PartnerReviewVO pvo = new PartnerReviewVO();
			  pvo.setPr_avg(vo.getPr_avg());
			  pvo.setPr_title(vo.getPr_title());
			  pvo.setPr_content(vo.getPr_content());
			  pvo.setPr_num(vo.getPr_num());
			  System.out.println(vo.getPr_avg()+vo.getPr_title()+vo.getPr_content()+vo.getPr_num());
			  prservice.updatePRBoard(pvo);
			  mav.setViewName("redirect:/partnerreviewlist/"+vo.getPart_id()+"");
			  
			  return mav;
		  }
	}

