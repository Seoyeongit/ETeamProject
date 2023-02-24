package com.forpets.biz.review;

import java.util.List;

import com.forpets.biz.reserve.ReServeVO;

/*
 *  리뷰관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface ReviewService {
	
	//리뷰를 등록합니다.
	public void insertReview(ReviewVO vo);

	//특정회원의 리뷰갯수를 구합니다.
	public int countReview(ReServeVO vo);
	
	//특정회원의 리뷰리스트를 불러옵니다.
	public List<ReviewVO> getReviewList(ReviewVO vo, String user_id);
}
