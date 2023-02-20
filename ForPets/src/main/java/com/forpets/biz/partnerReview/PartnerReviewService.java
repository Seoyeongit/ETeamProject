package com.forpets.biz.partnerReview;
/*
 *  댓글관련 서비스는 여기서 추상메서드를 추가하세요.
 */

import java.util.List;

import org.springframework.stereotype.Service;

import com.forpets.biz.partner.PartnerVO;

@Service
public interface PartnerReviewService {

	// 파트너 리스트 불러오기
	public List<PartnerVO> getPartnerList() throws Exception;
	
	// 리뷰 리스트 불러오기 
	public String partName(String part_name);
	public List<PartnerReviewVO> getprReviewList(String part_id) throws Exception;
	public Double avg(String part_id);
	
	// 리뷰 글 불러오기
	public PartnerReviewVO PRBoard(int pr_num);
	
	// 리뷰 글 작성하기
	public void insertPRBoard(PartnerReviewVO vo);
	
	// 리뷰 삭제하기
	void deletePR(int pr_num);
	
	// 리뷰 수정하기
	void updatePRBoard(PartnerReviewVO vo);
}

