package com.forpets.view.carediary;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.forpets.biz.carediary.CareDiaryService;
import com.forpets.biz.carediary.CareDiaryVO;
import com.forpets.biz.carediary.impl.CareDiaryDAO;
import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.ReserveService;

@Controller
public class CareDiaryController {
	@Autowired
	private CareDiaryService careDiaryService;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private PetService petService;
	
	//돌봄일지데이터를 가져옵니다.
	@RequestMapping(value="/myInfo/viewCare")
	public String getCareDIA(CareDiaryVO vo, CareDiaryDAO careDiaryDAO, Model model) {
		model.addAttribute("DIA",careDiaryService.getCareDiary(vo));
		return "myInfo/my_careDiary";
	}
	
	
	//돌봄일지작성하기 페이지를 불러옵니다.
	@RequestMapping(value="/partners/writeCare", method = RequestMethod.GET)
	public String ViewWriteCareDiary(Model model,ReServeVO voR,PetVO voP) {
		
		voR.setReserve_num("RN_27");
		voR.setUser_id("abc123");
		
		voR = reserveService.getReserve(voR);
		
		Integer pet_id = voR.getPet_id();
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String strNowDate = format.format(date);
		
		
		model.addAttribute("now", strNowDate );
		model.addAttribute("reserve",reserveService.getReserve(voR));
		model.addAttribute("pet", petService.getPet(voP, pet_id.toString()));
		return "partners/writeCareDiary";
	}
	
	
	//돌봄일지를 작성합니다.
	@RequestMapping(value="/partners/writeCare", method = RequestMethod.POST)
	public String WriteCareDiary(CareDiaryVO vo, @RequestParam(value = "hiddenVal", required = false)String[] list) {
		System.out.println(vo.toString());
		if(list!=null) {
			StringBuilder sb = new StringBuilder();
			for(String r : list) {
				sb.append(r+" ");
			}
			System.out.println(sb.toString());
			vo.setBeauty_list(sb.toString());
		}
		careDiaryService.insertCareDiary(vo);
		return "redirect:/";
	}
}