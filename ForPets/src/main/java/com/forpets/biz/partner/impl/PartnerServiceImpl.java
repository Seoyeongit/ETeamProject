package com.forpets.biz.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.forpets.biz.partner.PartnerService;
import com.forpets.biz.partner.PartnerVO;

@Service("partnerService")
public class PartnerServiceImpl implements PartnerService {
	
	//230130 최지혁
	@Autowired
	private PartnerDAO partnerDAO;
	
	public void setPartnerDAO(PartnerDAO partnerDAO) {
		this.partnerDAO = partnerDAO;
	}
	
	@Override
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		return partnerDAO.getPartnerList(vo);
	}
	
	@Override
	public PartnerVO getPartner(PartnerVO vo, String part_id) {
		return partnerDAO.getPartner(vo, part_id);
	}
	
	@Override
	public PartnerVO partnerGet(PartnerVO vo) {
		return partnerDAO.partnerGet(vo);
	}

	@Override
	public void updatePartner(PartnerVO vo) {
		partnerDAO.updatePartner(vo);
	}
	
	
}
