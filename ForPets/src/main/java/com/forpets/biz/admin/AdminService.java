package com.forpets.biz.admin;

import java.util.List;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.tip.TipVO;
import com.forpets.biz.user.UserVO;

/*
 *  관리자관련 서비스는 여기서 추상메서드를 추가하세요.
 */

public interface AdminService {
	
	// 관리자 정보
	AdminVO getAdmin(AdminVO vo) throws Exception;
	
	// 관리자 정보수정
	public void updateAdmin(AdminVO vo);

	// 회원 목록
	public List<UserVO> getUserList(UserVO uvo);

	// 파트너 목록
	public List<PartnerVO> getPartList(PartnerVO pvo);

	// 팁게목록
	public List<TipVO> getTipPrev(TipVO tvo);
	
}
