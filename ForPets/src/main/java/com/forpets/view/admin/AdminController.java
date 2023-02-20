package com.forpets.view.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.forpets.biz.admin.AdminService;
import com.forpets.biz.admin.AdminVO;
import com.forpets.biz.admin.impl.AdminDAO;
import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.tip.TipService;
import com.forpets.biz.tip.TipVO;
import com.forpets.biz.tip.impl.TipDAO;
import com.forpets.biz.tip.impl.TipServiceImpl;
import com.forpets.biz.user.UserVO;
import com.forpets.biz.user.impl.UserDAO;

@Controller
public class AdminController {

	@Autowired
	private AdminService admService;
	
	// 관리자 로그인
	@RequestMapping(value = "/Admin/login", method = RequestMethod.POST)
	public String login(AdminVO vo, HttpServletRequest rq) throws Exception {
		HttpSession session = rq.getSession();

		if (admService.getAdmin(vo) != null) {
			session.setAttribute("admin", admService.getAdmin(vo));
			System.out.println("로그인 후 mgmt로 이동");
			return "/Admin/mgmt";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/adminLogin.jsp";
		}
	}
	
	// 관리자 메인 이동
	@RequestMapping(value="/Admin/main")
	public String adminMain(AdminVO vo) {
		System.out.println("---> 관리자 메인 이동");
		return "/Admin/mgmt";
	}

	// 관리자 정보 보기
	@RequestMapping(value = "/Admin/adminInfo/{adm_id}")
	public String adminInfo(AdminVO vo, AdminDAO adminDAO, HttpServletRequest request) throws Exception {
		System.out.println("---> adminInfo 이동");
		
		//새로운 세션 생성 방지
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("admin")!=null) {
			admService.getAdmin(vo);
		}
		return "/Admin/adminInfo";
	}
	
	// 회원 관리
	@RequestMapping(value = "/Admin/mgmtUser")
	public String getUserList(UserVO uvo, UserDAO udao, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		model.addAttribute("getUser", admService.getUserList(uvo));
		System.out.println("getUserList");
		return "/Admin/mgmtUser";
	}
	
	// 파트너 관리
	@RequestMapping(value="/Admin/mgmtPartner")
	public String getPartList(PartnerVO pvo, PartnerDAO pdao, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		model.addAttribute("getPartner", admService.getPartList(pvo));	// Model 정보 저장
		System.out.println("getPartnerList");
		return "/Admin/mgmtPartner";
	}

	// 페이지 이동
	@RequestMapping(value = "/Admin/mgmtBoard")
	public String mgmtBoard(TipVO vo,TipDAO tipdao, Model model) throws Exception {
//		System.out.println("---> mgmtBoard 이동");
		
		if (vo.getSearchCondition() == null) { vo.setSearchCondition("TITLE"); }
		if (vo.getSearchKeyword() == null) { vo.setSearchKeyword(""); }
		model.addAttribute("tipList", tipdao.getTipList(vo));
		return "/Admin/mgmtBoard";
	}

//	@RequestMapping(value = "/mgmtPartner")
//	public String mgmtPartner() throws Exception {
////		System.out.println("---> mgmtPartner 이동");
//		return "/Admin/mgmtPartner";
//	}

//	@RequestMapping(value = "/mgmtUser")
//	public String mgmtUser() throws Exception {
////		System.out.println("---> mgmtUser 이동");
//		return "/Admin/mgmtUser";
//	}

}
