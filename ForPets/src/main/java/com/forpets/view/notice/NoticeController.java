package com.forpets.view.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.forpets.biz.notice.NoticeService;
import com.forpets.biz.notice.NoticeVO;
import com.forpets.biz.notice.impl.NoticeDAO;
import com.forpets.biz.notice.SearchCriteria;
import com.forpets.biz.notice.NoticePagingDTO;
import com.forpets.biz.tip.TipVO;
import com.forpets.biz.tip.impl.TipDAO;

@Controller
@RequestMapping("/Notice")
@SessionAttributes("noticeBoard")
public class NoticeController {

	@Autowired
	private NoticeService notService;
	
//	// 게시판 목록
//	@RequestMapping(value="/noticeBoard")
//	public String noticeBoard(NoticeVO notvo, NoticeDAO noticeDAO, Model model) throws Exception {
//		if (notvo.getSearchCondition() == null) {notvo.setSearchCondition("TITLE"); }
//		if (notvo.getSearchKeyword() == null) {notvo.setSearchKeyword(""); }
//		System.out.println("SearchCondition : " + notvo.getSearchCondition());
//		System.out.println("SearchKeyword : " + notvo.getSearchKeyword());
//		model.addAttribute("noticeBoard", notService.getNoticeList(notvo));	// Model 정보 저장
//		System.out.println("getNoticeList");
//		return "./Notice/noticeBoard";
//	}
	
	// paging 처리
		@RequestMapping(value="/noticeBoard")
		public String getTipList(NoticeVO vo, NoticeDAO noticeDAO, SearchCriteria cri, Model model) {
			System.out.println("---> getNoticeList 실행");
			System.out.println("SearchCondition : " + cri.getSearchCondition());
			System.out.println("SearchKeyword : " + cri.getSearchKeyword());
			if (cri.getSearchCondition() == null) { cri.setSearchCondition("TITLE"); }
			if (cri.getSearchKeyword() == null) { cri.setSearchKeyword(""); }
			System.out.println("SearchCondition : " + cri.getSearchCondition());
			System.out.println("SearchKeyword : " + cri.getSearchKeyword());
			
			System.out.println("totalpages : " + notService.getTotalPages(cri));
			
			NoticePagingDTO pageMaker = new NoticePagingDTO(cri, notService.getTotalPages(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("noticeBoard", notService.getNoticeWithDynamicPaging(cri));
			System.out.println("---> getNoticeList 완료");
			return  "./Notice/noticeBoard";
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
	public String insertNotice(NoticeVO vo) throws Exception {
		notService.insertNotice(vo);
		System.out.println("insertNotice 완료");
		return "redirect:/Notice/noticeBoard";
	}
	
	// 글 삭제
	@RequestMapping(value="/deleteNotice")
	public String deleteNotice(@ModelAttribute NoticeVO vo) throws Exception {
		notService.deleteNotice(vo);
		System.out.println("deleteNotice 완료");
		return "redirect:/Notice/noticeBoard";
	}
	
}
