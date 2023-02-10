package com.forpets.biz.admin;

/*
 *  관리자관련 서비스는 여기서 추상메서드를 추가하세요.
 */

public interface AdminService {
	
	AdminVO getAdminInfo(AdminVO vo) throws Exception;
	
	public void updateAdmin(AdminVO vo);
	
}
