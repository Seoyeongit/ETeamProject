package com.forpets.biz.admin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.admin.AdminVO;

@Repository("AdminDAO")
public class AdminDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String GET_ADMIN = "select * from ADMIN where adm_id=? and adm_pw=?";
	
	
	
	private final RowMapper<AdminVO> adminRowMapper = (resultSet, rowNum) -> {
		AdminVO newvo = new AdminVO();
		newvo.setAdm_id(resultSet.getString("adm_id"));
		newvo.setAdm_pw(resultSet.getString("adm_pw"));
		newvo.setAdm_name(resultSet.getString("adm_name"));
		newvo.setAdm_phone(resultSet.getString("adm_phone"));
		newvo.setAdm_email(resultSet.getString("adm_email"));
		newvo.setAdm_no(resultSet.getInt("adm_no"));
		newvo.setAdm_date(resultSet.getDate("adm_date"));
		
		return newvo;
	};
	
	//관리자 정보
	public AdminVO getAdmin(AdminVO vo) {
		Object[] adm = {vo.getAdm_id(), vo.getAdm_pw()};
		try {
			AdminVO admvo = jdbcTemplate.queryForObject(GET_ADMIN, adm, adminRowMapper);
			return admvo;
		} catch (IncorrectResultSizeDataAccessException error) {
			return null;
		}
//		AdminVO admvo = jdbcTemplate.queryForObject(GET_ADMIN, adm, adminRowMapper);
//		return admvo;
	}
	
	
	
}
