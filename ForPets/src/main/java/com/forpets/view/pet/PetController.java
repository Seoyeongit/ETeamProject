package com.forpets.view.pet;


import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.pet.WorkVO;
import com.forpets.biz.pet.impl.PetDAO;
import com.forpets.biz.pet.impl.WorkDAO;
import com.forpets.biz.user.UserVO;

@Controller
@SessionAttributes("UserPet")
public class PetController{
	@Autowired
	private PetService petService;
	
	//pet정보를 수정한다.
	@RequestMapping(value = "/myInfo/my-petUpd", method = RequestMethod.POST)
	public String updatePet(PetVO vo, PetDAO petDAO) {
		System.out.println("==>pet udpate start");
		
		petService.updatePet(vo);
		return "myInfo/main";
	}

	//pet정보를 등록한다.
	@RequestMapping(value = "/myInfo/my-petReg", method = RequestMethod.POST)
	public String insertPet(PetVO vo, PetDAO petDAO) {
		System.out.println("==>pet insert start");
		System.out.println(vo.toString());
		
		petService.insertPet(vo);
		return "myInfo/main";
	}
	
	//pet등록jsp를 View.
	@RequestMapping(value="/myInfo/my-petView")
	public String myPetView() {
		return "myInfo/mypet";
	}
	
	
	//pet_work 등록jsp를 View.
	@RequestMapping(value="/myInfo/create-roadMap")
	public String myPetWorkView() {
		System.out.println("==>myPetWorkView() start");
		return "myInfo/my_pet_work";
	}
	
	
	
	
	
	//main화면에 들어올때 pet등록정보를 가져온다.
	@RequestMapping(value="/myInfo/main")
	public String getPetInfo(PetVO vo, PetDAO petDAO, HttpSession session,Model model) {
		System.out.println("===>pet get start");
		
		UserVO SessionVO = (UserVO) session.getAttribute("member");
		vo.setUser_id(SessionVO.getUser_id());
		
		int result = petService.countPet(vo);
		//유저의펫이 한마리라면 userpet을 session으로 
		
		System.out.println("result : "+result);
		
		if(result==1) {
			System.out.println("result 1개");
			session.setAttribute("userPet", petService.getPetInfo(vo));
		}else if(result>1){
			System.out.println("result 1개 이상");
			session.setAttribute("userPetList", petService.getPetList(vo, vo.getUser_id()));
		}
		return "forward:/myInfo/selectWork";
		
		
	}

	@RequestMapping(value = "/myInfo/my-petImgUpload", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<PetVO> uploadPetImageActionPOST(MultipartFile uploadFile) throws IllegalStateException, IOException {
		System.out.println("uploadAjaxActionPOST..........");
		
		File checkfile = new File(uploadFile.getOriginalFilename());
		String type = null;
		
		type = Files.probeContentType(checkfile.toPath());
		System.out.println("MIME TYPE : " + type  );
		
		if(!type.startsWith("image")) {
			PetVO check = null;
			return new ResponseEntity<PetVO>(check, HttpStatus.BAD_REQUEST);
		}
		
		String uploadFolder = "C:\\DevSpace\\springSpace\\ETeamProject\\ForPets\\src\\main\\webapp\\resources\\assets\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		PetVO vo = new PetVO();
		
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
		
		ResponseEntity<PetVO> result = new ResponseEntity<PetVO>(vo, HttpStatus.OK);
		
		return result;
		
	}
	
	@RequestMapping("/myInfo/display")
	public ResponseEntity<byte[]>getImage(String fileName){
		System.out.println("getImage()....." + fileName);
		
		File file = new File("C:\\DevSpace\\springSpace\\ETeamProject\\ForPets\\src\\main\\webapp\\resources\\assets\\upload" + fileName);
		
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
	
	@RequestMapping(value = "/myInfo/delete", method = RequestMethod.POST)
	public ResponseEntity<String> DeleteImage(String fileName) {
		System.out.println("deleteImage()...."+fileName);
		File file = null;
		try {
			file = new File("C:\\DevSpace\\springSpace\\ETeamProject\\ForPets\\src\\main\\webapp\\resources\\assets\\upload" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
		}catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value="getPet")
	@ResponseBody
	public void getPet(PetVO vo, PetDAO petDAO, HttpSession session, HttpServletRequest request) {
		System.out.println("---> getPet 실행");
		session.setAttribute("pet_info", petService.getPet(vo, request.getParameter("pet_id")));
		System.out.println("---> getPet 완료");
	}
	
	@RequestMapping(value="getPetList")
	public String getPetList(PetVO pvo, PetDAO petDAO, HttpSession session, Model model) {
		System.out.println("---> getPetList 실행");
		UserVO uvo = (UserVO) session.getAttribute("member");
		System.out.println("user_id : " + uvo.getUser_id());
		model.addAttribute("getPetList", petService.getPetList(pvo, uvo.getUser_id()));	// Model 정보 저장
		System.out.println("---> getPetList 완료");
		return "./Service/getPetList";
	}
	
	@RequestMapping(value="findPetWork")
	public String choicePetInfo(PetVO vo, PetDAO petDAO, HttpSession session,WorkVO voW, WorkDAO workDAO,Model model) {
		System.out.println("===>pet get start");
		UserVO voP = (UserVO) session.getAttribute("member");
		vo.setUser_id(voP.getUser_id());
		session.setAttribute("userPet", petService.getPetInfo(vo));
		return "forward:/Service/showPetWork";
		
	}
	
}
