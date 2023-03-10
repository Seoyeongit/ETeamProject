package com.forpets.view.tip;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.tip.SearchCriteria;
import com.forpets.biz.tip.TipPagingDTO;
import com.forpets.biz.tip.TipService;
import com.forpets.biz.tip.TipVO;
import com.forpets.biz.tip.impl.TipDAO;

@Controller
@RequestMapping(value="/Tip")
public class TipController {
	
	@Autowired
	private TipService tipService;
	
	@RequestMapping(value="insertTip")
	public String insert() {
		return "/Tip/insertTip";
	}
	
	@RequestMapping(value="insertTip.do")
	public String insertTip(TipVO vo, TipDAO tipDAO, HttpServletRequest request) throws IOException {
		System.out.println("---> insertTip.do 실행");
		tipService.insertTip(vo);
		System.out.println("---> insertTip.do 완료");
		return "redirect:/Tip/getTipList";
	}
	
	@RequestMapping(value="updateTip")
	public String updateTip(TipVO vo, TipDAO tipDAO, HttpServletRequest request) throws IOException {
		System.out.println("---> updateTip 실행");
//		vo.setTip_title(request.getParameter("tip_title"));
//		vo.setTip_content(request.getParameter("tip_content"));
//		vo.setTip_video("tip_video");
		tipService.updateTip(vo);
		System.out.println("---> updateTip 완료");
		return "redirect:/Tip/getTipList";
	}
	
	@RequestMapping(value="deleteTip")
	public String deleteTip(TipVO vo, TipDAO tipDAO) throws IOException {
		System.out.println("---> deleteTip 실행");
		tipService.deleteTip(vo);
		System.out.println("---> deleteTip 완료");
		return "redirect:/Tip/getTipList";
	}
	
	@RequestMapping(value="getTip")
	public String getTip(TipVO vo, TipDAO tipDAO, Model model) {
		System.out.println("---> getTip 실행");
		model.addAttribute("tip", tipService.getTip(vo));
		System.out.println("---> getTip 완료");
		return "/Tip/getTip";
	}
	
	/*
	@RequestMapping(value="getTipList")
	public String getTipList(TipVO vo, TipDAO tipDAO, Model model) {
		System.out.println("---> getTipList 실행");
		System.out.println("SearchCondition : " + vo.getSearchCondition());
		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
		if (vo.getSearchCondition() == null) { vo.setSearchCondition("TITLE"); }
		if (vo.getSearchKeyword() == null) { vo.setSearchKeyword(""); }
		System.out.println("SearchCondition : " + vo.getSearchCondition());
		System.out.println("SearchKeyword : " + vo.getSearchKeyword());
		
		model.addAttribute("tipList", tipService.getTipList(vo));
		System.out.println("---> getTipList 완료");
		return  "/Tip/getTipList";
	}
	*/
	
	// paging 처리
	@RequestMapping(value="getTipList")
	public String getTipList(TipVO vo, TipDAO tipDAO, SearchCriteria cri, Model model) {
		System.out.println("---> getTipList 실행");
		System.out.println("SearchCondition : " + cri.getSearchCondition());
		System.out.println("SearchKeyword : " + cri.getSearchKeyword());
		if (cri.getSearchCondition() == null) { cri.setSearchCondition("TITLE"); }
		if (cri.getSearchKeyword() == null) { cri.setSearchKeyword(""); }
		System.out.println("SearchCondition : " + cri.getSearchCondition());
		System.out.println("SearchKeyword : " + cri.getSearchKeyword());
		
		System.out.println("totalpages : " + tipService.getTotalPages(cri));
		
		TipPagingDTO pageMaker = new TipPagingDTO(cri, tipService.getTotalPages(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("tipList", tipService.getTipListWithDynamicPaging(cri));
		System.out.println("---> getTipList 완료");
		return  "/Tip/getTipList";
	}
	
}
