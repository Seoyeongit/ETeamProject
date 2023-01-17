package com.forpets.biz.review;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  리뷰게시판모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ReviewVO {
	private int r_num; //리뷰시퀀스
	private String part_id; //파트너아이디
	private String user_id; //유저아이디
	private int r_star; //별점
	private String r_title; //후기제목
	private String r_content; //후기내용
	private Date r_date; //작성날짜
}
