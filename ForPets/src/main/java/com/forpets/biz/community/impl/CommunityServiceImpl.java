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
		return communityDAO.getCommunityList();
	}
	
	@Override
	public void insertCommunity(CommunityVO vo) {
		communityDAO.insertCommunity(vo);
	}
	
	@Override
	public CommunityVO getCommunityBoard(String c_code) {
		return communityDAO.getCommunityBoard(c_code);
	}
	
	@Override
	public String getlistcount() {
		return communityDAO.getlistcount();
	}
	
	@Override
	public void updateComunity(CommunityVO vo) {
		communityDAO.updateCommunity(vo);
	}
	
	@Override
	public void deleteCommunity(String c_code) {
		communityDAO.deleteCommunity(c_code);

	}
	
}
