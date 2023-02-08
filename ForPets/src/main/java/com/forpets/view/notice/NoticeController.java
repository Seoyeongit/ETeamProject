package com.forpets.view.notice;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.notice.NoticeService;
import com.forpets.biz.notice.NoticeVO;
import com.forpets.biz.notice.impl.NoticeDAO;

@Controller
@RequestMapping("/Notice")
@SessionAttributes("noticeBoard")
public class NoticeController {

	@Autowired
	private NoticeService notService;
	
	// 게시판 목록
	@RequestMapping(value="/noticeBoard")
	public String noticeBoard(NoticeVO notvo, NoticeDAO noticeDAO, Model model) throws Exception {
		model.addAttribute("noticeBoard", notService.getNoticeList(notvo));	// Model 정보 저장
		System.out.println("getNoticeList");
		return "./Notice/noticeBoard";
	}
	
	
	// 게시판 글 상세보기
	@RequestMapping(value="/getNoticeBoard.do/{ntc_seq}", method = RequestMethod.GET)
	public String getNoticeBoard(NoticeVO vo, NoticeDAO noticeDAO, HttpSession session, @PathVariable(value="ntc_seq") int ntc_seq) {

		System.out.println("getNoticeBoard");
	
		try {
			session.setAttribute("getNoticeBoard", notService.getNoticeBoard(vo, ntc_seq));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/Notice/getNoticeBoard";
	} 
	
	// 글 수정폼 이동
	@RequestMapping(value="/updateNoticeForm.do/{ntc_seq}")
	public String updateNoticeForm(NoticeVO vo, NoticeDAO noticeDAO, HttpSession session, @PathVariable(value="ntc_seq") int ntc_seq) throws Exception {
		session.setAttribute("getNoticeBoard", notService.getNoticeBoard(vo, ntc_seq));
		System.out.println("updateNoticeForm 이동");
		return "/Notice/updateNoticeForm";
	}
	
	// 글 수정
	@RequestMapping(value="/updateNotice", method=RequestMethod.POST)
	public String updateNotice(@ModelAttribute NoticeVO vo) throws Exception {
		notService.updateNotice(vo);
		System.out.println("updateNotice 완료");
		return "redirect:/Notice/noticeBoard";
	}
	
	// 글 작성폼 보기
	@RequestMapping(value="/noticeForm")
	public String noticeForm() throws Exception {
		System.out.println("noticeForm 이동");
		return "/Notice/noticeForm";
	}
	
	// 글 작성
	@RequestMapping(value="/insertNotice")
	public String insertNotice(NoticeVO vo, NoticeDAO noticeDAO) throws Exception {
		System.out.println("insertNotice 완료");
		notService.insertNotice(vo);
		return "redirect:/Notice/noticeBoard";
	}
	

	
	
}
