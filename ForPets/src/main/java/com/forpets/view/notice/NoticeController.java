package com.forpets.view.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.notice.NoticeService;
import com.forpets.biz.notice.NoticeVO;
import com.forpets.biz.notice.impl.NoticeDAO;

@Controller
@RequestMapping("/")
@SessionAttributes("noticeBoard")
public class NoticeController {

	@Autowired
	private NoticeService notService;
	
	// 게시판 목록
	@RequestMapping(value="/Notice/noticeBoard")
	public String noticeBoard(NoticeVO notvo, NoticeDAO noticeDAO, Model model) throws Exception {
		System.out.println("---> getNoticeList 실행");
		model.addAttribute("noticeBoard", notService.getNoticeList(notvo));	// Model 정보 저장
		System.out.println("---> getNoticeList 완료");
		return "./Notice/noticeBoard";
	}
	
	
//	@RequestMapping(value="noticeBoard")
//	public ModelAndView noticeBoard() throws Exception {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("./Notice/noticeBoard");
//		mav.addObject("noticeBoardList", notService.getNoticeList(vo)());
//		// System.out.println("공지 목록 생성");
//		return mav;
//	}
	
}
