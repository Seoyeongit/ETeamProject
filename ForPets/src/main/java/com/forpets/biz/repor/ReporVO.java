package com.forpets.biz.repor;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  신고게시판 모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ReporVO {
	private int rp_seq; //신고번호
	private int rp_id; //소모임글pk, 댓글pk
	private int rp_type; //신고타입 1이면 게시글 2이면 댓글
	private Date rp_date; //신고일시
	private String rp_userid; //신고자id
	private String rp_rpid; //작성자id
	private String rp_ctnt; //신고내용
	
}
