package com.forpets.view.partner;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.pet.impl.PetDAO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.reserve.ReserveService;
import com.forpets.biz.reserve.impl.ReserveDAO;
import com.forpets.biz.reserve.impl.ReserveServiceImpl;


@Controller
public class PartnerController {
	
	@Autowired
	private PartnerService partnerService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="/partner/partnerMain")
	public String partner(PartnerVO vo, PartnerDAO dao) {
		return "/partner/partnerMain";
	}
	
	@RequestMapping(value="getPartnerList")
	public String getPartnerList(PartnerVO partvo, PartnerDAO partnerDAO, Model model) {
		System.out.println("---> getPartnerList.do 실행");
		model.addAttribute("getPartnerList", partnerService.getPartnerList(partvo));	// Model 정보 저장
		System.out.println("---> getPartnerList.do 완료");
		return "./Service/getPartnerList";
	}
	
	@RequestMapping(value="getPartner")
	@ResponseBody
	public void getPartner(PartnerVO vo, PartnerDAO partnerDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getPartner 실행");
		session.setAttribute("part_info", partnerService.getPartner(vo, request.getParameter("part_id")));
		System.out.println("---> getPartner 완료");
	}
	
	@RequestMapping(value="/partner/partnerGet")
	public String partnerGet(PartnerVO vo, PartnerDAO dao, HttpSession session) throws IOException{
		PartnerVO sessionVO = (PartnerVO) session.getAttribute("partners");
		vo.setPart_id(sessionVO.getPart_id());
		session.setAttribute("partners",partnerService.partnerGet(vo));
		return "/partner/partnerGet";
		
	}
	
	@RequestMapping(value="/partner/modifyyy", method = RequestMethod.GET)
	public String modifyView() {
		return "/partner/modify";
	}
	
	@RequestMapping(value="/partner/modifyyy", method = RequestMethod.POST)
	@ResponseBody
	public void updatePartner(PartnerVO vo, PartnerDAO dao, HttpServletRequest request) throws IOException{
		
			vo.setPart_pw(request.getParameter("part_pw"));
			vo.setPart_nick(request.getParameter("part_nick"));
			vo.setPart_add(request.getParameter("part_add"));
			vo.setPart_phnumber(request.getParameter("part_phnumber"));
			vo.setSelf_infor(request.getParameter("self_infor"));
			vo.setImg(request.getParameter("img"));
			partnerService.updatePartner(vo);
			
			HttpSession session = request.getSession(false);
			
			//1.session이 있고 + 2.session정보가 있으면 
			if(session != null && session.getAttribute("partners") != null) { 
			//updateform에있는 정보를 받아와 수정한다.
				partnerService.updatePartner(vo);
				session.setAttribute("partners", partnerService.partnerGet(vo));
			}

		}
	
	@RequestMapping(value="/partner/login",method = RequestMethod.GET)
	public String loginForm() {
		return "partner/login";
	}

	@RequestMapping(value="/partner/login", method = RequestMethod.POST)
	public String login(PartnerVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		System.out.println("아이디 : " + vo.getPart_id());
		
		if(partnerService.partnerGet(vo) != null) {
			session.setAttribute("role","partners" );
			session.setAttribute("partners", partnerService.partnerGet(vo));
			System.out.println(session.getAttribute("partners").toString());
			return "forward://";
		}else {
			return "/";
		}
		
	}	
	
	@RequestMapping(value = "/partner/partImgUpd", method = RequestMethod.POST)
	public String updatePartnerImg(PartnerVO vo, PartnerDAO DAO) {
		System.out.println("==>partner udpate start");
		
		partnerService.updatePartnerImg(vo);
		return "partner/modify";
	}

	//partner정보를 등록한다.
	@RequestMapping(value = "/partner/partImgIns", method = RequestMethod.POST)
	public String insertPartnerImg(PartnerVO vo, PartnerDAO DAO) {
		System.out.println("==>partner insert start");
		System.out.println(vo.toString());
		
		partnerService.insertPartnerImg(vo);
		return "partner/modify";
	}
	

	
	@RequestMapping(value = "/partner/my-partnerImgUpload", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PartnerVO> uploadPetImageActionPOST(MultipartFile uploadFile, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("uploadAjaxActionPOST..........");
		
		File checkfile = new File(uploadFile.getOriginalFilename());
		String type = null;
		
		type = Files.probeContentType(checkfile.toPath());
		System.out.println("MIME TYPE : " + type  );
		
		if(!type.startsWith("image")) {
			PartnerVO check = null;
			return new ResponseEntity<PartnerVO>(check, HttpStatus.BAD_REQUEST);
		}
		
		String applicationPath = request.getServletContext().getRealPath("/");
		String[] personalPath = applicationPath.split("\\.metadata");
		String part_img_path = personalPath[0] + "ForPets\\src\\main\\webapp\\resources\\assets\\upload";
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		/* 폴더 생성 */
		File uploadPath = new File(part_img_path, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		PartnerVO vo = new PartnerVO();
		
		/* 파일 이름 */
		String uploadFileName = uploadFile.getOriginalFilename();
		/* uuid적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		
		uploadFileName = uuid+"_"+uploadFileName;
		
		/* 파일위치, 파일 이름을 합칙 file 객체 */
		File saveFile = new File(uploadPath, uploadFileName);
		vo.setImg(saveFile.toString());
		
		/* 파일저장 */
		uploadFile.transferTo(saveFile);
		
		ResponseEntity<PartnerVO> result = new ResponseEntity<PartnerVO>(vo, HttpStatus.OK);
		
		return result;
		
	}
	
	@RequestMapping("/partner/display")
	public ResponseEntity<byte[]>getImage(String fileName, HttpServletRequest request){
		System.out.println("getImage()....." + fileName);
		
		String applicationPath = request.getServletContext().getRealPath("/");
		String[] personalPath = applicationPath.split("\\.metadata");
		String part_img_path = personalPath[0] + "ForPets\\src\\main\\webapp\\resources\\assets\\upload";
		
		
		File file = new File(part_img_path + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "/partner/delete", method = RequestMethod.POST)
	public ResponseEntity<String> DeleteImage(String fileName) {
		System.out.println("deleteImage()...."+fileName);
		String resourcePath = servletContext.getRealPath("/resource");
		String path = resourcePath + "/assts/upload";
		File file = null;
		try {
			file = new File(path + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
}
