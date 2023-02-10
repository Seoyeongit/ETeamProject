package com.forpets.biz.admin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.admin.AdminService;
import com.forpets.biz.admin.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	
	@Override
	public AdminVO getAdmin(AdminVO vo) throws Exception {
		return adminDAO.getAdmin(vo);
	}

	@Override
	public void updateAdmin(AdminVO vo) {

	}

}
