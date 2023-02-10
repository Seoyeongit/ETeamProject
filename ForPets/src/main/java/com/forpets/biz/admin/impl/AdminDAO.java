package com.forpets.biz.admin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("AdminDAO")
public class AdminDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
}
