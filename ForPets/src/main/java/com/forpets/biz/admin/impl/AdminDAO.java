package com.forpets.biz.admin.impl;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.admin.AdminVO;
import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.partner.impl.PartnerDAO;
import com.forpets.biz.user.UserVO;
import com.forpets.biz.user.impl.UserRowMapper;

@Repository("AdminDAO")
public class AdminDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String GET_ADMIN = "select * from ADMIN where adm_id=? and adm_pw=?";
	private final String USER_LIST = "select * from USERS order by user_id";
	private final String PARTNER_LIST = "select * from PARTNERS order by part_no";
	
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
	
	private final RowMapper<PartnerVO> partRowMapper = (resultSet, rowNum) -> {
		PartnerVO pvo = new PartnerVO();
		pvo.setPart_id(resultSet.getString("part_id"));
		pvo.setPart_name(resultSet.getString("part_name"));
		pvo.setPart_nick(resultSet.getString("part_nick"));
		pvo.setPart_no(resultSet.getInt("part_no"));
		pvo.setData_create(resultSet.getDate("data_create"));
		pvo.setPart_phnumber(resultSet.getString("part_phnumber"));
		return pvo;
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
	
	// 회원 목록
	public List<UserVO> getUserList(UserVO uvo) {
		return jdbcTemplate.query(USER_LIST, new UserRowMapper());
	}

	public List<PartnerVO> getPartList(PartnerVO pvo) {
		return jdbcTemplate.query(PARTNER_LIST, partRowMapper);
	}
	
	// 파트너 목록
	
	
}
