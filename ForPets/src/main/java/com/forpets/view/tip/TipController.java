package com.forpets.view.tip;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forpets.biz.tip.TipService;
import com.forpets.biz.tip.TipVO;
import com.forpets.biz.tip.impl.TipDAO;

@Controller
public class TipController {
	
	@Autowired
	private TipService tipService;
	
	@RequestMapping(value="insertTip.do")
	public String insertTip(TipVO vo, TipDAO tipDAO, HttpServletRequest request) throws IOException {
		System.out.println("---> insertTip.do 실행");
		tipService.insertTip(vo);
		System.out.println("---> insertTip.do 완료");
		return "getTipList.do";
	}
	
	@RequestMapping(value="updateTip.do")
	public String updateTip(TipVO vo, TipDAO tipDAO) throws IOException {
		System.out.println("---> updateTip.do 실행");
		tipService.updateTip(vo);
		System.out.println("---> updateTip.do 완료");
		return "getTipList.do";
	}
	
	@RequestMapping(value="deleteTip.do")
	public String deleteTip(TipVO vo, TipDAO tipDAO) throws IOException {
		System.out.println("---> deleteTip.do 실행");
		tipService.deleteTip(vo);
		System.out.println("---> deleteTip.do 완료");
		return "getTipList.do";
	}
	
	@RequestMapping(value="/getTip.do")
	public String getTip(TipVO vo, TipDAO tipDAO, Model model) {
		System.out.println("---> getTip.do 실행");
		model.addAttribute("tip", tipService.getTip(vo));
		System.out.println("---> getTip.do 완료");
		return "getTip.jsp";
	}
	
	@RequestMapping(value="/getTipList.do")
	public String getTipList(TipVO vo, TipDAO tipDAO, Model model) {
		System.out.println("---> getTipList.do 실행");
		model.addAttribute("tipList", tipService.getTipList(vo));
		System.out.println("---> getTipList.do 완료");
		return  "getTipList.jsp";
	}
	
}
