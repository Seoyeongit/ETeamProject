package com.forpets.biz.partnerReview;

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
public class PartnerReviewVO {
	private int pr_num; //댓글시퀀스
	private String part_id; //소모임코드
	private String user_id; //유저아이디
	private int pr_avg;  // 평균평점
	private String pr_title;	// 후기 제목
	private String pr_content;	// 후기내용
	private Date pr_date; //작성날짜
}
