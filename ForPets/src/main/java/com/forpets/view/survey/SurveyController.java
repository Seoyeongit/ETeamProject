package com.forpets.view.survey;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forpets.biz.community.CommunityService;
import com.forpets.biz.survey.SurveyAnswerVO;
import com.forpets.biz.survey.SurveyChoiceVO;
import com.forpets.biz.survey.SurveyDetailService;
import com.forpets.biz.survey.SurveyDetailVO;
import com.forpets.biz.survey.SurveyVO;
import com.forpets.biz.user.UserVO;

@Controller
public class SurveyController {
	
	@Autowired
	SurveyDetailService surdservice;

	

	// 설문지 열기
	@RequestMapping("/survey.do/{c_code}")
	public ModelAndView Survey(@PathVariable String c_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Survey/Survey");
		mav.addObject("c_code", c_code);
		return mav;
	}

	// 설문지 등록
	@RequestMapping(value="/insertsurvey.do", method = RequestMethod.POST)
	public @ResponseBody ModelAndView insertSurvey(@RequestParam String sd_svcode, HttpServletRequest req, @RequestParam String c_code) throws Exception {
		ModelAndView mav = new ModelAndView();
		int survey_count = Integer.parseInt(req.getParameter("survey_count"));
		// 설문지 제목 생성
		SurveyVO ssvo = new SurveyVO();
		String s_title = req.getParameter("s_title");
		 ssvo.setS_svcode(sd_svcode);
		 ssvo.setS_code(c_code);  // 소모임에서 코드 가져오기
		 ssvo.setS_title(s_title);
		 surdservice.insertsurvey3(ssvo);
		
		 
		 
		 // 문제, 문제답안 반복
		for(int k=1;k<=survey_count;k++) {
		
			String sd_title = req.getParameter("sd_title"+k);
			String sd_type = req.getParameter("sd_type"+k);
		
			String[] sc_answer = req.getParameterValues("sc_answer"+k);
			String[] sc_ascode = req.getParameterValues("sc_ascode");

			SurveyDetailVO vo = new SurveyDetailVO();
			SurveyChoiceVO cvo = new SurveyChoiceVO();
			
			vo.setSd_svcode(sd_svcode);
			vo.setSd_title(sd_title);
			vo.setSd_type(sd_type);
			String od = "od"+(k);
			vo.setSd_order(od);
			surdservice.insertSurvey(vo);
		
		
			for(int j=0; j<sc_answer.length; j++) {
				 cvo.setSc_svcode(sd_svcode);
				 cvo.setSc_order(od);
				 String asc = sd_type.substring(0,1)+(j+1);					
				 cvo.setSc_ascode(asc);
				 cvo.setSc_answer(sc_answer[j]);
				 surdservice.insertSurvey2(cvo);
			}	// for end
				
		} // for end
		
		mav.setViewName("redirect:/getcommunity/"+c_code+"");
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
		mav.setViewName("/Survey/getSurvey");
		mav.addObject("surveyboard", surdservice.getSurveyBoard(sd_svcode));
		mav.addObject("surveyboard2", surdservice.getSurveyBoard2(sd_svcode));
		mav.addObject("surveyboard3", surdservice.getSurveyBoard3(sd_svcode));

		
		return mav;
	}
	
	// 설문지 삭제
	@RequestMapping("/deletesurvey.do/{sd_svcode}")
	public String deleteSurvey(@PathVariable String sd_svcode) throws Exception {
		surdservice.deleteSurvey(sd_svcode);
		surdservice.deleteSurvey2(sd_svcode);
		surdservice.deleteSurvey3(sd_svcode);
		return "redirect:/communitylist";
	}
		
	// 설문지 답변 저장
	@RequestMapping(value="/insertanswer.do", method = RequestMethod.POST)
	public ModelAndView insertAnswer(@RequestParam String sd_svcode, HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		SurveyAnswerVO vo = new SurveyAnswerVO();
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		
		int count = Integer.parseInt(surdservice.count(sd_svcode));
		
		// check일 때 반복해서 여러개 생성해주고, 아닐 시 하나만 값을 넣을수 있도록 하는 반복문
		for(int i=1; i<=count; i++) {
			vo.setSa_svcode(sd_svcode);
			vo.setSa_order("od"+i+"");
			String sc_ascode = req.getParameter("od"+i+"");
			String sa_content = req.getParameter("od"+i+"-"+sc_ascode+"");
					

			if (sc_ascode.substring(0,1).equals("c")) {
				String[] check = req.getParameterValues("od"+i+"");
				for (int j=0; j<check.length; j++) {
					vo.setSa_ascode(check[j]);
					vo.setUser_id(SessionVO.getUser_id());
					String check_content = req.getParameter(check[j]);
					vo.setSa_content(check_content);
					surdservice.insertAnswer(vo);	
				}
			} else {
				vo.setSa_ascode(sc_ascode);
				vo.setUser_id(SessionVO.getUser_id());
				vo.setSa_content(sa_content);
				surdservice.insertAnswer(vo);
			}
			
				
		}

		mav.setViewName("redirect:/communitylist");
		return mav;
	}
	
	
	// 답변 리스트 불러오기
	@RequestMapping("/answerlist.do/{sa_svcode}")
	public ModelAndView answerList(@PathVariable String sa_svcode) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("sa_svcode : " + sa_svcode);
		mav.setViewName("/Survey/AnswerList");
		mav.addObject("add", sa_svcode);
		mav.addObject("answerList",surdservice.getAnswerName(sa_svcode));
		System.out.println(surdservice.getAnswerName(sa_svcode));
		mav.addObject("surveyboard", surdservice.getAnswerBoard(sa_svcode));
		mav.addObject("surveyboard2", surdservice.getAnswerBoard2(sa_svcode));
		mav.addObject("surveyboard3", surdservice.getAnswerBoard3(sa_svcode));
		
		return mav;
	}
	
	// 질문 답변 불러오기 
	@RequestMapping("/answerboard.do/{sd_svcode}/{user_id}")
	public @ResponseBody ModelAndView getAnswerBoard(@PathVariable String sd_svcode, @PathVariable String user_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println("sd_svcode :" + sd_svcode +", user_id :" + user_id );
		mav.setViewName("/Survey/Answer");
		mav.addObject("add", sd_svcode);
		mav.addObject("nowid", user_id);
		mav.addObject("answerList",surdservice.getAnswerName(sd_svcode));
		mav.addObject("answerboard", surdservice.getAnswerBoard(sd_svcode));
		mav.addObject("answerboard2", surdservice.getAnswerBoard2(sd_svcode));
		mav.addObject("answerboard3", surdservice.getAnswerBoard3(sd_svcode));
		mav.addObject("answerboard4", surdservice.getAnswerBoard4(sd_svcode, user_id));
	
		System.out.println(surdservice.getAnswerBoard4(sd_svcode, user_id));
		return mav;
	}
	
	
	// 설문지 답변 삭제하기 
	@RequestMapping("/deleteanswer.do/{sd_svcode}&{user_id}")
	public String deleteAnswer(@PathVariable String sd_svcode, @PathVariable String user_id) throws Exception{
		surdservice.deleteAnswer(sd_svcode, user_id);
		
		return "redirect:/answerlist.do";
	}
}
	
	

	

