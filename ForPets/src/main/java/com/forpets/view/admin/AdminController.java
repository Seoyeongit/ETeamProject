package com.forpets.view.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.admin.AdminService;
import com.forpets.biz.admin.AdminVO;
import com.forpets.biz.admin.SearchCriteria_user;
import com.forpets.biz.admin.UserInfoPagingDTO;
import com.forpets.biz.admin.impl.AdminDAO;
import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.community.impl.CommunityDAO;
import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.tip.SearchCriteria;
import com.forpets.biz.tip.TipPagingDTO;
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
			session.setAttribute("role", "admin");
			System.out.println("로그인 후 mgmt로 이동");
			return "redirect:/Admin/mgmt";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/rofstep";
		}
	}

	// 관리자 로그아웃
	@RequestMapping(value="/Admin/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session != null) {
			session.invalidate();
			System.out.println("로그아웃");
		}
		return "redirect:/rofstep";
	}

	// 관리자 메인 이동
	@RequestMapping(value = "/Admin/main")
	public String adminMain(AdminVO vo, HttpServletRequest request) throws Exception {
		System.out.println("---> 관리자 메인 이동");
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("admin") != null) {
			System.out.println("관리자 세션 검증 후 main 이동");
			return "redirect:/Admin/mgmt";
		} else {
			System.out.println("관리자 페이지 접근 불가");
			return "redirect:/";
		}
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

//	// 회원 관리
//	@RequestMapping(value = "/Admin/mgmtUser")
//	public String getUserList(UserVO uvo, UserDAO udao, Model model, HttpServletRequest request) {
//		HttpSession session = request.getSession(false);
//
//		model.addAttribute("getUser", admService.getUserList(uvo));
//		System.out.println("getUserList");
//		return "/Admin/mgmtUser";
//	}
//	
	// 회원 탈퇴
	@RequestMapping(value = "/Admin/deleteUser/{user_id}")
	public String deleteUser(UserVO uvo, @PathVariable("user_id") String user_id) {
		admService.deleteUser(uvo, user_id);
		System.out.println("deleteUser 완료");
		return "redirect:/Admin/mgmtUser";
	}
	

	// 파트너 관리
	@RequestMapping(value = "/Admin/mgmtPartner")
	public String getPartList(PartnerVO pvo, ReServeVO rvo, PartnerDAO pdao, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		List<PartnerVO> mgmt = admService.getPartList(pvo);
		// 주소 자르기
		for (int i = 0; i < mgmt.size(); i++) {
			String part_add = mgmt.get(i).getPart_add();
			System.out.print(mgmt.get(i).getPart_add());
			String[] arr = part_add.split(" ");
			part_add = " ";
			part_add += arr[0] + " " + arr[1];
			System.out.print(part_add);
			mgmt.get(i).setPart_add(part_add);
		}

		model.addAttribute("getPartner", mgmt); // Model 정보 저장
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
	public String communityPrev(CommunityVO cvo, CommunityDAO cdao, Model model) {
		model.addAttribute("comPrev", admService.getComPrev(cvo));
		System.out.println("getComPreview");
		return "/Admin/communityPrev";
	}
	

	
	// 대시보드 controller
	// 통계 List
	@RequestMapping(value = "Admin/mgmt")
	public String getDashBoard(AdminVO vo, AdminDAO dao, PartnerVO pvo, PartnerDAO pdao, Model model) {
		System.out.println("dashboard 이동");
		
		
		HashMap<String, Integer> stats = new HashMap<String, Integer>();
		stats.put("earnings", admService.getEarnings());
		stats.put("userCount", admService.getUserCount());
		stats.put("reserveCount", admService.getReserveCount());
		HashMap<String, Double> dstats = new HashMap<String, Double>();
		dstats.put("reviewAvg", admService.getReviewAvg());
		model.addAttribute("stats", stats);
		model.addAttribute("dstats", dstats);
		
		model.addAttribute("reserve_chart", admService.getMontlyReserve(vo));
		model.addAttribute("service_chart", admService.getServiceCount(vo));
		model.addAttribute("getPartner", admService.getPartRank(pvo));
		return "/Admin/mgmt";
		
//		HashMap<String, Integer> var = new HashMap<String, Integer>();
//		
//		var.put("회원통계", AdminService.get)
//		VAR.PUT("무슨통계", AdminService,=.get)
//		model.addAttribute("전체통계리스트", var);
//		
//		전체통계리스트.회원통계 
//		전체통계리스트.무슨통계
	}
	
	// 유저 paging 처리
	@RequestMapping(value="/Admin/mgmtUser")
	public String getTipList(UserVO uvo, UserDAO udao, SearchCriteria_user cri, Model model) {
		System.out.println("---> getUSERList 실행");
		
		System.out.println("SearchCondition : " + cri.getSearchCondition());
		System.out.println("SearchKeyword : " + cri.getSearchKeyword());
		
		if (cri.getSearchCondition() == null) { cri.setSearchCondition("NAME"); }
		if (cri.getSearchKeyword() == null) { cri.setSearchKeyword(""); }
		
		System.out.println("SearchCondition : " + cri.getSearchCondition());
		System.out.println("SearchKeyword : " + cri.getSearchKeyword());
		
		System.out.println("totalpages : " + admService.getTotalPages(cri));
		
		UserInfoPagingDTO pageMaker = new UserInfoPagingDTO(cri, admService.getTotalPages(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("getUser", admService.getListWithDynamicPaging(cri));
		System.out.println("---> getUSERList 완료");
		return "/Admin/mgmtUser";
	}
	


}
