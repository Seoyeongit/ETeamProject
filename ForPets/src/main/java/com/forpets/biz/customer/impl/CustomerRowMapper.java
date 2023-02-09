package com.forpets.biz.customer.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.customer.CustomerVO;

public class CustomerRowMapper implements RowMapper<CustomerVO> {

	@Override
	public CustomerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CustomerVO cvo = new CustomerVO();
		cvo.setCust_no(rs.getInt("CUST_NO"));
		cvo.setUser_id(rs.getString("USER_ID"));
		cvo.setPart_id(rs.getString("PART_ID"));
		cvo.setCust_title(rs.getString("CUST_TITLE"));
		cvo.setCust_content(rs.getString("CUST_CONTENT"));
		cvo.setCust_date(rs.getDate("CUST_DATE"));
		return cvo;
	}


}
