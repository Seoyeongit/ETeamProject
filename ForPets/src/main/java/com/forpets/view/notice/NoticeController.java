package com.forpets.view.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	// 게시판 글 상세보기
	@RequestMapping(value="/Notice/getNoticeBoard.do/{ntc_seq}", method = RequestMethod.GET)
	public String getNoticeBoard(NoticeVO vo, NoticeDAO noticeDAO, HttpSession session, @PathVariable(value="ntc_seq") int ntc_seq) {

		System.out.println("글 상세 조회 처리");
//		logger.debug("[LOG] 글 상세 조회 처리");
	
		// 검색 결과를 세션에 저장하고 목록 화면으로 이동한다.
		try {
			session.setAttribute("getNoticeBoard", notService.getNoticeBoard(vo, ntc_seq));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/Notice/getNoticeBoard";
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
