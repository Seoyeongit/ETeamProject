package com.forpets.view.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String login(AdminVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

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
	@RequestMapping(value = "/Admin/main")
	public String adminMain(AdminVO vo) {
		System.out.println("---> 관리자 메인 이동");
		return "/Admin/mgmt";
	}

	// 관리자 정보 보기
	@RequestMapping(value = "/Admin/adminInfo/{adm_id}")
	public String adminInfo(AdminVO vo, AdminDAO adminDAO, HttpServletRequest request) throws Exception {
		System.out.println("---> adminInfo 이동");

//		새로운 세션 생성 방지
		HttpSession session = request.getSession(false);
		admService.getAdmin(vo);
		if (session != null && session.getAttribute("admin") != null) {
			admService.getAdmin(vo);
		}
		return "/Admin/adminInfo";
	}

	// 관리자 정보 수정
	@RequestMapping(value = "/Admin/modInfo", method = RequestMethod.POST)
	public String modInfo(AdminVO vo, AdminDAO adminDAO, HttpServletRequest request) throws Exception {
		System.out.println("---> adminInfo update");

		// 새로운 세션 생성 방지
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("admin") != null) {
			admService.updateAdmin(vo);
			session.setAttribute("admin", admService.getAdmin(vo));
			System.out.println("updateAdmin 성공");
		}
		if (session == null) {
			System.out.println("updateAdmin 실패");
			return "세션이 없습니다";
		}
		return "redirect:/Admin/main";
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
	@RequestMapping(value = "/Admin/mgmtPartner")
	public String getPartList(PartnerVO pvo, PartnerDAO pdao, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		model.addAttribute("getPartner", admService.getPartList(pvo)); // Model 정보 저장
		System.out.println("getPartnerList");
		return "/Admin/mgmtPartner";
	}

	// 게시판 관리 view
	@RequestMapping(value = "/Admin/mgmtBoard")
	public String mgmtBoard() {
		return "Admin/mgmtBoard";
	}
	
	
	// tip preview
	@RequestMapping(value = "/Admin/tipPrev")
	public String tipPrev(TipVO tvo, TipDAO tdao, Model model) throws Exception {
		model.addAttribute("tipPrev", admService.getTipPrev(tvo));
		System.out.println("getTipPreview");
		return "/Admin/tipPrev";
	}

	// 소모임 preview
	@RequestMapping(value = "/Admin/communityPrev")
	public String communityPrev() {
		System.out.println("getComPreview");
		return "/Admin/communityPrev";
	}

}
