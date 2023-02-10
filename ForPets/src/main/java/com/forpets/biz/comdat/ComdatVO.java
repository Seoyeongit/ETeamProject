package com.forpets.biz.comdat;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  소모임게시판의 댓글모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ComdatVO {
	private int d_num; //댓글시퀀스
	private String d_code; //소모임코드
	private String user_id; //유저아이디
	private String d_content; //댓글내용
	private Date d_date; //작성날짜
}
