package com.forpets.biz.review;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  리뷰게시판모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter @ToString
public class ReviewVO {
	private int r_id; //리뷰시퀀스
	private int star_rating; //별점
	private String r_content; //후기내용
	private String r_title; //후기한줄평
	private Date r_date; //작성날짜
	private String reserve_num; //예약번호
}
