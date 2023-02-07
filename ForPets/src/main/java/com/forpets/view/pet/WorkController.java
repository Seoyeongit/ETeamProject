package com.forpets.view.pet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forpets.biz.pet.WorkService;
import com.forpets.biz.pet.WorkVO;
import com.forpets.biz.pet.impl.WorkDAO;
import com.forpets.biz.user.UserVO;

@Controller
@SessionAttributes("member")
public class WorkController {
	@Autowired
	private WorkService workservice;


	@RequestMapping(value = "/myInfo/createWork", method = RequestMethod.POST)
	public  ResponseEntity<String>  insertWork(WorkVO vo, WorkDAO workDAO, float[] listX, float[] listY, String userId) {
		float[] X = new float[listX.length];
		float[] Y = new float[listY.length];
		int count = 0;
		
		for(float list : listX) {
			X[count]=list;
			count++;
		}
		
		count = 0;
		
		for(float list : listY ) {
			Y[count] = list;
			count++;
		}
		
		
		vo.setXArr(X);
		vo.setYArr(Y);
		vo.setUser_id(userId);
		
		workservice.insertWork(vo);

		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	 
	
	@RequestMapping(value = "/myInfo/selectWork")
	public String selectWork(WorkVO vo, WorkDAO workDAO, Model model, HttpSession session) {
		System.out.println("=>selct work start");
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		vo.setUser_id(SessionVO.getUser_id());
		model.addAttribute("petWork",workservice.ListWork(vo));
		return "myInfo/main";
		
	}
	
	@RequestMapping(value = "/myInfo/modify-roadMap")
	public String modifyWork(WorkVO vo, HttpSession session) {
		System.out.println("=>deleteWork start");
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		vo.setUser_id(SessionVO.getUser_id());
		workservice.DeleteWork(vo);
		return "myInfo/my_pet_work";
	}
	
	@RequestMapping(value="/Service/showPetWork")
	public String showPetWork(WorkVO vo, WorkDAO workDAO, Model model,HttpSession session) {
		System.out.println("=>show pet work start");
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		vo.setUser_id(SessionVO.getUser_id());
		model.addAttribute("petWork",workservice.ListWork(vo));
		System.out.println("=>show pet work end");
		return "Service/showPetWork";
	}
}
