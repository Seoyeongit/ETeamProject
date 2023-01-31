package com.forpets.view.pet;

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

@Controller
@RequestMapping(value = "/myInfo")
@SessionAttributes("Petwork")
public class WorkController {
	@Autowired
	private WorkService workservice;


	@RequestMapping(value = "/createWork", method = RequestMethod.POST)
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
	
	
	@RequestMapping(value = "/selectWork")
	public String selectWork(WorkVO vo, WorkDAO workDAO, Model model) {
		System.out.println("=>selct work start");
		vo.setUser_id("abc123");
		model.addAttribute("petWork",workservice.ListWork(vo));
		return "myInfo/main";
		
	}
	
	@RequestMapping(value = "/modify-roadMap")
	public String modifyWork(WorkVO vo, String userId) {
		System.out.println("=>deleteWork start");
		vo.setUser_id(userId);
		workservice.DeleteWork(vo);
		return "myInfo/my_pet_work";
	}
	
	
}
