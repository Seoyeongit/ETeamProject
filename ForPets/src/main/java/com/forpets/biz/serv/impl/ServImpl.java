package com.forpets.biz.serv.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forpets.biz.serv.Serv;
import com.forpets.biz.serv.ServVO;

@Service("servService")
public class ServImpl implements Serv {
	
	@Autowired
	private ServDAO servDAO;
	
	@Override
	public ServVO getServ(ServVO vo, int s_num) {
		return servDAO.getServ(vo, s_num);
	}

}
