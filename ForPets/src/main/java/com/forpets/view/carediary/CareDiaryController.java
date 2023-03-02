package com.forpets.view.carediary;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

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
import com.forpets.biz.user.UserVO;

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
	public String getCareDIAList(CareDiaryVO vo, Model model, HttpSession session) {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		model.addAttribute("careDIA", careDiaryService.getCareDiary(vo, sessionVO.getUser_id()));
		return "myInfo/my_careDiary";
	}
	
	//돌봄일지중 특정돌봄일지를 봅니다.
	@RequestMapping(value="/myInfo/my_careDiary_detail")
	public String getCareDIA(HttpSession session,@RequestParam(value = "diary_id")int diary_id,Model model) {
		UserVO sessionVO = (UserVO) session.getAttribute("member");
		
		CareDiaryVO result = careDiaryService.getCareDiaryDetail(diary_id, sessionVO.getUser_id());
		
		if(result.getBeauty_list() != null) {
			String[] list = result.getBeauty_list().split(" ");
			model.addAttribute("beauty_list", list);
		}
		
		model.addAttribute("careDIA", result);
		return "myInfo/my_careDiary2";
		
	}
	
	
	//돌봄일지작성하기 페이지를 불러옵니다.
	@RequestMapping(value="/partner/viewWriteCare", method = RequestMethod.GET)
	public String ViewWriteCareDiary(Model model,ReServeVO voR,PetVO voP) {
		
		
		voR = reserveService.getReserve(voR);
		
		Integer pet_id = voR.getPet_id();
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String strNowDate = format.format(date);
		
		
		model.addAttribute("now", strNowDate );
		model.addAttribute("reserve",reserveService.getReserve(voR));
		model.addAttribute("pet", petService.getPet(voP, pet_id.toString()));
		return "/partner/writeCareDiary";
	}
	
	
	//돌봄일지를 작성합니다.
	@RequestMapping(value="/partner/writeCare", method = RequestMethod.POST)
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
		return "partner/careDiaryList";
	}
	

}