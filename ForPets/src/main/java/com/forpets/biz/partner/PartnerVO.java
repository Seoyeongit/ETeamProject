package com.forpets.biz.partner;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  파트너모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter @Setter
public class PartnerVO {
	private String part_id; //아이디
	private String part_pw; //비밀번호
	private String part_name; //이름
	private String part_nick; //닉네임
	private String part_add; //주소
	private char gender; //성별
	private String part_phnumber; //핸드폰번호
	private Date birth;
	private int war; //경고횟수
	private int part_no; //회원번호
	private Date data_create; //가입날짜
	private String self_infor; //자기소개
	private String img;
	private MultipartFile part_img;


}
