package com.forpets.view.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.forpets.biz.admin.AdminService;
import com.forpets.biz.admin.AdminVO;
import com.forpets.biz.admin.impl.AdminDAO;

@Controller
@RequestMapping("/Admin")
public class AdminController {

	@Autowired
	private AdminService admService;

	// 관리자 로그인
	@RequestMapping(value = "/mgmt", method = RequestMethod.POST)
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

	// 관리자 정보 보기
	@RequestMapping(value = "/adminInfo")
	public String adminInfo(AdminVO vo, AdminDAO adminDAO, HttpServletRequest request) throws Exception {
		System.out.println("---> adminInfo 이동");
		
		//새로운 세션 생성 방지
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("admin")!=null) {
			admService.getAdmin(vo);
		}
		return "/Admin/adminInfo";
	}

	// 페이지 이동
	@RequestMapping(value = "/mgmtBoard")
	public String mgmtBoard() throws Exception {
//		System.out.println("---> mgmtBoard 이동");
		return "/Admin/mgmtBoard";
	}

	@RequestMapping(value = "/mgmtPartner")
	public String mgmtPartner() throws Exception {
//		System.out.println("---> mgmtPartner 이동");
		return "/Admin/mgmtPartner";
	}

	@RequestMapping(value = "/mgmtUser")
	public String mgmtUser() throws Exception {
//		System.out.println("---> mgmtUser 이동");
		return "/Admin/mgmtUser";
	}

}
