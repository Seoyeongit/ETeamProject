package com.forpets.biz.community;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  소모임게시판모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class CommunityVO {
	private String c_code; //소모임코드
	private String c_title; //제목
	private String c_content; //내용
	private String user_id; //유저아이디
	private Date c_date; //소모임생성날짜
	private String c_pet; // 강아지, 고양이
}
