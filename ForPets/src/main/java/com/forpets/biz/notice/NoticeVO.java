package com.forpets.biz.notice;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



/*
 *  공지사항게시판모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class NoticeVO {
	private int ntc_seq; //번호
	private String ntc_title; //제목
	private String ntc_ctnt; //내용
	private Date ntc_cdate; //발행일
	private int ntc_hit; //조회수
	private Date ntc_udate; //수정일
}
