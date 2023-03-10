package com.forpets.view.review;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.review.ReviewService;
import com.forpets.biz.review.ReviewVO;
import com.forpets.biz.user.UserVO;

@Controller
public class ReviewController {
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping(value="/myInfo/review")
	public String viewReviewMain() {
		return "myInfo/myReview_main";
	}
	
	@RequestMapping(value = "/myInfo/writeReview")
	public String writeReviewView(ReServeVO vo, Model model, HttpSession session) {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		vo.setUser_id(sessionVO.getUser_id());
		model.addAttribute("reserve",reserveService.getReserve(vo));
		System.out.println(reserveService.getReserve(vo).toString());
		return "myInfo/myReview_modal";
	}
	
	@RequestMapping(value ="/myInfo/writeReview_go")
	@ResponseBody
	public void writeReviewGo(ReviewVO vo) {
		reviewService.insertReview(vo);
	}
	
	//특정회원의 리뷰리스트를 가져옵니다.
	@RequestMapping(value="/myInfo/getwrittenReview")
	public String writtenReviewView(ReviewVO vo, Model model, HttpSession session) {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		String user_id = sessionVO.getUser_id();
		model.addAttribute("myReview",reviewService.getReviewList(vo, user_id));
		return "myInfo/myReview2";
	}
	
	

}
