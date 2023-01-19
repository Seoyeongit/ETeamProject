package com.forpets.biz.community.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.community.CommunityService;
import com.forpets.biz.community.CommunityVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	
	@Autowired
	private CommunityDAO communityDAO;


	@Override
	public List<CommunityVO> getCommunityList() throws Exception {
		// System.out.println("연결?");
//		return null;
		return communityDAO.getCommunityList();
	}
	
}
