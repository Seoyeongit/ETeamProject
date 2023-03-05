package com.forpets.biz.pet;


import org.springframework.web.multipart.MultipartFile;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  펫모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter @Setter
public class PetVO {
	private int id; //펫아이디
	private String name; //펫이름
	private String type; //펫타입
	private MultipartFile pet_img;
	private String img; //펫이미지
	private int age; //펫나이
	private char gender; //성별
	private String user_id; //유저아이디
}
