package com.forpets.biz.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import com.forpets.biz.service.Service;
import com.forpets.biz.service.ServiceVO;

@org.springframework.stereotype.Service("serv")
public class ServiceImpl implements Service {
	
	@Autowired
	private ServiceDAO servDAO;

	@Override
	public ServiceVO getServ(ServiceVO vo, int s_num) {
		return servDAO.getServ(vo, s_num);
	}

}
