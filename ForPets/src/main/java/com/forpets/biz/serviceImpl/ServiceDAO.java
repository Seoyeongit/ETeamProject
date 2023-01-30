package com.forpets.biz.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.service.ServiceVO;

@Repository("serviceDAO")
public class ServiceDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String SERV_GET = "select * from serv where s_num=?";
	
	public ServiceVO getServ(ServiceVO vo, int s_num) {
		System.out.println("---> JDBC로 getServ() 기능처리");
		ServiceVO serv = jdbcTemplate.queryForObject(SERV_GET, 
				(resultSet, rowNum) -> {
					ServiceVO newServ = new ServiceVO();
					newServ.setS_name(resultSet.getString("S_NAME"));
					newServ.setS_price(resultSet.getInt("S_PRICE"));
					return newServ;
				}
				, s_num);
		return serv;
	}
	
}
