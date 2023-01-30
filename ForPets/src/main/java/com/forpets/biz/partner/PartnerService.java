package com.forpets.biz.partner;

import java.util.List;

/*
 *  파트너관련 서비스는 여기서 추상메서드를 추가하세요.
 */
public interface PartnerService {
	
	//230130 최지혁
	public List<PartnerVO> getPartnerList(PartnerVO vo);
	
	//230130 최지혁
	PartnerVO getPartner(PartnerVO vo, String part_id);
	
}
