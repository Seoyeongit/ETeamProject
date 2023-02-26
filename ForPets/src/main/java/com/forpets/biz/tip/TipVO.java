package com.forpets.biz.tip;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  팁게시판모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class TipVO {
	private int tip_seq; //게시판시퀀스
	private String tip_title; //제목
	private String tip_content; //내용
	private String tip_img_url; //이미지url
	private String tip_video; //비디오url
	private Date tip_create_date; //발행일
	private int tip_hit; //조회수
	private Date tip_update_date; //수정일
}
