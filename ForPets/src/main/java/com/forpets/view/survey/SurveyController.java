package com.forpets.view.survey;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.community.CommunityVO;
import com.forpets.biz.survey.SurveyChoiceVO;
import com.forpets.biz.survey.SurveyDetailService;
import com.forpets.biz.survey.SurveyDetailVO;
import com.forpets.biz.survey.SurveyVO;

@Controller
@RequestMapping("/")
public class SurveyController {
	
	@Autowired
	SurveyDetailService surdservice;
	

	// 설문지 열기
	@RequestMapping("/survey.do/{c_code}")
	public ModelAndView Survey(@PathVariable String c_code) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Survey/Survey");
		mav.addObject("c_code", c_code);
		System.out.println(c_code);
		return mav;
	}

	// 설문지 등록
	@RequestMapping(value="/insertsurvey.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertSurvey(@RequestParam String sd_svcode, HttpServletRequest req, @RequestParam String c_code) throws Exception {
		System.out.println("========= insertSurvey Controller Start ========= ");
		ModelAndView mav = new ModelAndView();
		
		int survey_count = Integer.parseInt(req.getParameter("survey_count"));
		
		// 설문ㄴ지 제목 생성
		SurveyVO ssvo = new SurveyVO();
		String s_title = req.getParameter("s_title");
		 ssvo.setS_svcode(sd_svcode);
		 ssvo.setS_code(c_code);  // 소모임에서 코드 가져오기
		 System.out.println(c_code);
		 ssvo.setS_title(s_title);
		 surdservice.insertsurvey3(ssvo);
		 
		 
		 // 문제, 문제답안 반복
		for(int k=1;k<=survey_count;k++) {
		
			String sd_title = req.getParameter("sd_title"+k);
			String sd_type = req.getParameter("sd_type"+k);
		
			String[] sc_answer = req.getParameterValues("sc_answer"+k);
			String[] sc_ascode = req.getParameterValues("sc_ascode");
		
			System.out.println(sd_svcode);
			SurveyDetailVO vo = new SurveyDetailVO();
			SurveyChoiceVO cvo = new SurveyChoiceVO();
			
			System.out.println(sd_title);
			vo.setSd_svcode(sd_svcode);
			vo.setSd_title(sd_title);
			vo.setSd_type(sd_type);
			String od = "od"+(k);
			vo.setSd_order(od);
			System.out.println(vo);
			surdservice.insertSurvey(vo);
		
		
			for(int j=0; j<sc_answer.length; j++) {
				 System.out.println(sd_title);
				 cvo.setSc_svcode(sd_svcode);
				 cvo.setSc_order(od);
				 String asc = sd_type.substring(0,1)+(j+1);					
				 cvo.setSc_ascode(asc);
				 cvo.setSc_answer(sc_answer[j]);
				 surdservice.insertSurvey2(cvo);
			}	// for end
				
		} // for end
		
		/* 서연 문제 풀이 
		  String[] sd_title = req.getParameterValues("sd_title");
		  String[] sd_type = req.getParameterValues("sd_type");
		  String[] sc_answer = req.getParameterValues("sc_answer");
		  String[] sc_ascode = req.getParameterValues("sc_ascode"); 
		  System.out.println(sd_svcode);
		  
		  SurveyDetailVO vo = new SurveyDetailVO();
		  SurveyChoiceVO cvo = new SurveyChoiceVO();
		  
		  for(int i=0; i<sd_title.length; i++) {
			  System.out.println(sd_title);
			  vo.setSd_svcode(sd_svcode);
			  vo.setSd_title(sd_title[i]);
			  vo.setSd_type(sd_type[i]);
			  String od = "order"+(i+1);
			  vo.setSd_order(od);
			  System.out.println(vo);
			  surdservice.insertSurvey(vo);
				  for(int j=0; j<sc_answer.length; j++) {
				  System.out.println(sd_title);
				  cvo.setSc_svcode(sd_svcode);
				  cvo.setSc_order("od");
				  String asc = sd_type[j].substring(0,1)+(j+1);
				  cvo.setSc_ascode("asc");
				  cvo.setSc_answer(sc_answer[j]);
				  surdservice.insertServey2(cvo);
			 
				}	// for end
			} */
		
		mav.setViewName("redirect:/surveylist.do");
		return mav;
	} // 설문지 등록 end
	
	
	// 설문지 리스트
	@RequestMapping("/surveylist.do")
	public ModelAndView SurveyList() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Survey/SurveyList");
		mav.addObject("surveyList", surdservice.getSurveyList());
		return mav;
	} // 설문지 리스트 END
	

	// 설문지 불러오기
	@RequestMapping(value="/surveyboard.do/{sd_svcode}", method=RequestMethod.GET)
	public ModelAndView getSurveyboard(@PathVariable String sd_svcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println(sd_svcode);
		mav.setViewName("/Survey/getSurvey");
		mav.addObject("surveyboard", surdservice.getSurveyBoard(sd_svcode));
		mav.addObject("surveyboard2", surdservice.getSurveyBoard2(sd_svcode));
		mav.addObject("surveyboard3", surdservice.getSurveyBoard3(sd_svcode));
		System.out.println(surdservice.getSurveyBoard(sd_svcode));
		System.out.println(surdservice.getSurveyBoard2(sd_svcode));
		System.out.println(surdservice.getSurveyBoard3(sd_svcode));
		return mav;
	}
	
		
		
		
	}
	
	

	

