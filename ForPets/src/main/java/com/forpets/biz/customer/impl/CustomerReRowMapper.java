package com.forpets.biz.customer.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.customer.CustomerReVO;

public class CustomerReRowMapper implements RowMapper<CustomerReVO> {

	@Override
	public CustomerReVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CustomerReVO cvo = new CustomerReVO();
		cvo.setCust_no(rs.getInt("CUST_NO"));
		cvo.setCust_content(rs.getString("CUST_CONTENT"));
		return cvo;
	}

	

}
