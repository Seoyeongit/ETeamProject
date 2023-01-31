package com.forpets.biz.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.forpets.biz.partner.PartnerVO;

@Repository("partnerDAO")
public class PartnerDAO {
	
	//230130 최지혁
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String PARTNER_LIST = "select * from PARTNERS order by part_id desc";
	private final String PARTNER_GET = "select * from PARTNERS where part_id = ?";
	
	private final RowMapper<PartnerVO> PetRowMapper = (resultSet, rowNum) -> {		
		PartnerVO newPartner = new PartnerVO();
		newPartner.setPart_id(resultSet.getString("PART_ID"));
		newPartner.setPart_pw(resultSet.getString("PART_PW"));
		newPartner.setPart_name(resultSet.getString("PART_NAME"));
		newPartner.setPart_nick(resultSet.getString("PART_NICK"));
		newPartner.setPart_add(resultSet.getString("PART_ADD"));
		newPartner.setGender(resultSet.getString("GENDER").charAt(0));
		newPartner.setPart_phnumber(resultSet.getString("PART_PHNUMBER"));
		newPartner.setBirth(resultSet.getDate("BIRTH"));
		newPartner.setWar(resultSet.getInt("WAR"));
		newPartner.setPart_no(resultSet.getInt("PART_NO"));
		newPartner.setData_create(resultSet.getDate("DATA_CREATE"));
		newPartner.setSelf_infor(resultSet.getString("SELF_INFOR"));
		return newPartner;
	};
	
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		System.out.println("---> JDBC로 getPartnerList() 기능 처리");
		return jdbcTemplate.query(PARTNER_LIST,PetRowMapper);
	}
	
	public PartnerVO getPartner(PartnerVO vo, String part_id) {
		System.out.println("---> JDBC로 getPartner() 기능 처리");
		PartnerVO partner = jdbcTemplate.queryForObject(PARTNER_GET,
				(resultSet, rowNum) -> {
					PartnerVO newPartner = new PartnerVO();
					newPartner.setPart_id(resultSet.getString("PART_ID"));
					newPartner.setPart_name(resultSet.getString("PART_NAME"));
					newPartner.setPart_nick(resultSet.getString("PART_NICK"));
					newPartner.setPart_add(resultSet.getString("PART_ADD"));
					newPartner.setGender(resultSet.getString("GENDER").charAt(0));
					newPartner.setPart_phnumber(resultSet.getString("PART_PHNUMBER"));
					newPartner.setBirth(resultSet.getDate("BIRTH"));
					newPartner.setWar(resultSet.getInt("WAR"));
					newPartner.setPart_no(resultSet.getInt("PART_NO"));
					newPartner.setData_create(resultSet.getDate("DATA_CREATE"));
					newPartner.setSelf_infor(resultSet.getString("SELF_INFOR"));
					return newPartner;
				}
				, part_id);
		return partner;
	}
	
}
