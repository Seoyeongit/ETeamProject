package com.forpets.biz.comdat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.comdat.ComdatService;
import com.forpets.biz.comdat.ComdatVO;

@Service("comdatService")
public class ComdatServiceImpl implements ComdatService {

	@Autowired
	private ComdatDAO comdatDAO;
	
	@Override
	public List<ComdatVO> getComdat(String c_code) throws Exception {
		return comdatDAO.getdat(c_code);
	}
	
	@Override
	public void insertComdat(ComdatVO vo) {
		comdatDAO.insertComdat(vo);
		
		
	}
}
