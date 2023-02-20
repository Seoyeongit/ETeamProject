package com.forpets.view.PartnerReview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.partnerReview.PartnerReviewService;
import com.forpets.biz.partnerReview.PartnerReviewVO;

@Controller
public class PartnerReviewController {
	
		 @Autowired
		 PartnerReviewService prservice;
		 
		 // 파트너 리스트
		 @RequestMapping("/partnerlist.do")
		 public ModelAndView PartnerList() throws Exception {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/PartnerList");
			 mav.addObject("prList", prservice.getPartnerList()); 
			 
			 return mav;
		 }
		 
		 // 파트너 리뷰 리스트
		 @RequestMapping("/prlist.do/{part_id}")
		 public ModelAndView PRList(@PathVariable String part_id) throws Exception {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/PartnerBoard");
			 mav.addObject("prList", prservice.partName(part_id));
			 mav.addObject("reviewList", prservice.getprReviewList(part_id));
			 mav.addObject("avg",prservice.avg(part_id));
			return mav;
			
		 }
		 
		 // 파트너 글 읽기 
		 @RequestMapping(value ="/prboard.do/{pr_num}", method = RequestMethod.GET)
		 public ModelAndView PRBoard(@PathVariable int pr_num) throws Exception {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/ReviewBoard");
			 mav.addObject("prboard", prservice.PRBoard(pr_num));
			 
			 return mav;
		 }
		 
		 @RequestMapping("/getpr.do")
		 public ModelAndView getPRBoard() {
			 ModelAndView mav = new ModelAndView();
			 mav.setViewName("/PartnerReview/getPRBoard");
			 
			 return mav;
		 }
		 
		 @RequestMapping("/insertpr.do")
		 public ModelAndView insertPRBoard(@ModelAttribute PartnerReviewVO vo) throws Exception {
			 ModelAndView mav = new ModelAndView();
			 PartnerReviewVO pvo = new PartnerReviewVO();
			 pvo.setPart_id("ang1004");
			 pvo.setUser_id("a123334");
			 pvo.setPr_avg(vo.getPr_avg());
			 pvo.setPr_title(vo.getPr_title());
			 pvo.setPr_content(vo.getPr_content());
			 prservice.insertPRBoard(pvo);
			 mav.setViewName("/PartnerReview/PartnerBoard");
			
			 return mav;
		 }
		 
		  @RequestMapping("/deletepr.do/{pr_num}")
		  public String deletePR(@PathVariable int pr_num) throws Exception {
			  prservice.deletePR(pr_num);
			  return "redirect:/partnerlist.do";
		  }
		  
		  @RequestMapping("/updatepr.do/{pr_num}")
		  public ModelAndView updatePR(@PathVariable int pr_num) {
			  ModelAndView mav = new ModelAndView();
			  mav.setViewName("/PartnerReview/updatePRBoard");
			  mav.addObject("prboard", prservice.PRBoard(pr_num));
			  return mav;
		  }
		  

		  @RequestMapping(value="/updateprboard.do", method = RequestMethod.POST)
		  public ModelAndView updatePRBoard(@ModelAttribute PartnerReviewVO vo) {
			  ModelAndView mav = new ModelAndView();
			  PartnerReviewVO pvo = new PartnerReviewVO();
			  pvo.setPr_avg(vo.getPr_avg());
			  pvo.setPr_title(vo.getPr_title());
			  pvo.setPr_content(vo.getPr_content());
			  pvo.setPr_num(vo.getPr_num());
			  prservice.updatePRBoard(pvo);
			  mav.setViewName("redirect:/prlist.do/{part_id}");
			
			  return mav;
		  }
	}

