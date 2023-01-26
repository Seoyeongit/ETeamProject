package com.forpets.biz.serv.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.serv.ServVO;

@Repository("servDAO")
public class ServDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String SERV_GET = "select * from serv where s_num=?";
	
	public ServVO getServ(ServVO vo, int s_num) {
		System.out.println("---> JDBC로 getServ() 기능처리");
		ServVO serv = jdbcTemplate.queryForObject(SERV_GET, 
				(resultSet, rowNum) -> {
					ServVO newServ = new ServVO();
					newServ.setS_name(resultSet.getString("S_NAME"));
					newServ.setS_price(resultSet.getInt("S_PRICE"));
					return newServ;
				}
				, s_num);
		return serv;
	}
	
}