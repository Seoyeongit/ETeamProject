package com.forpets.biz.partnerReview.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partnerReview.PartnerReviewService;
import com.forpets.biz.partnerReview.PartnerReviewVO;


@Service("partnerReviewService")
public class PartnerReviewServiceImpl implements PartnerReviewService {
	
	@Autowired
	private PartnerReviewDAO prDAO;

	@Override
	public List<PartnerVO> getPartnerList() throws Exception {
		return prDAO.getPartnerList();
	}
	
	@Override
	public String partName(String part_name) {
		return prDAO.partName(part_name);
	}
	
	@Override
	public List<PartnerReviewVO> getprReviewList(String part_id) throws Exception {
		return prDAO.getprReviewList(part_id);
	}
	
	@Override
		public int avg(String part_id) {
			return prDAO.avg(part_id);
	}
	
	@Override
	public PartnerReviewVO PRBoard(int pr_num) {
		return prDAO.PRBoard(pr_num);
	}
	
	@Override
	public void insertPRBoard(PartnerReviewVO vo) {
		prDAO.insertPRBoard(vo);
	}
	
	@Override
	public void deletePR(int pr_num) {
		prDAO.deletePR(pr_num);
		
	}
	
	@Override
	public void updatePRBoard(PartnerReviewVO vo) {
		prDAO.updatePRBoard(vo);
		
	}
	
}
