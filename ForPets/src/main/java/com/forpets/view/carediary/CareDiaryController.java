package com.forpets.view.carediary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forpets.biz.carediary.CareDiaryService;
import com.forpets.biz.carediary.CareDiaryVO;
import com.forpets.biz.carediary.impl.CareDiaryDAO;

@Controller
public class CareDiaryController {
	@Autowired
	private CareDiaryService careDiaryService;
	
	//돌봄일지데이터를 가져옵니다.
	@RequestMapping(value="/myInfo/viewCare")
	public String getCareDIA(CareDiaryVO vo, CareDiaryDAO careDiaryDAO, Model model) {
		model.addAttribute("DIA",careDiaryService.getCareDiary(vo));
		return "myInfo/my_careDiary";
	}
}