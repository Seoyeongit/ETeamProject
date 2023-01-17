package com.forpets.biz.user;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  유저모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class UserVO {
	private String user_id; //아이디
	private String user_pw; //비밀번호
	private String user_name; //이름
	private String user_nick; //닉네임
	private String user_add; //주소
	private char gender; //성별
	private int phnumber; //핸드폰번호
	private Date birth; //생년월일
	private int war; //경고횟수
	private int user_no; //회원번호
	private Date data_create; //가입날짜
}
