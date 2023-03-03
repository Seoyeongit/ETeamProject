package com.forpets.biz.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.pet.PetVO;

@Repository("partnerDAO")
public class PartnerDAO {
	
	//230130 최지혁
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String PARTNER_LIST = "select * from PARTNERS order by part_id desc";
	private final String PARTNER_GET = "select * from PARTNERS where part_id = ?";
	private final String PARTNER_UPDATE = "UPDATE PARTNERS SET PART_PW=?, PART_NICK=?, PART_ADD=?, PART_PHNUMBER=?, SELF_INFOR=? ,PART_IMG=? "  + " WHERE PART_ID=?";
	private final String INSERT_PartImg = "UPDATE partners SET PART_IMG=? WHERE PART_ID = ? ";
	
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		System.out.println("---> JDBC로 getPartnerList() 기능 처리");
		return jdbcTemplate.query(PARTNER_LIST,new PartnerRowMapper());
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
	
	public PartnerVO partnerGet(PartnerVO vo) {
		Object[] obj = {vo.getPart_id()};
		return jdbcTemplate.queryForObject(PARTNER_GET,obj, new PartnerRowMapper());
		
	}
	
	public void updatePartner(PartnerVO vo) {
		System.out.println(vo.getImg());
		Object[] obj = {vo.getPart_pw(), vo.getPart_nick(), vo.getPart_add(), vo.getPart_phnumber(), vo.getSelf_infor(), vo.getImg(), vo.getPart_id()};
		jdbcTemplate.update(PARTNER_UPDATE, obj);
	}
	
	public void insertPartnerImg(PartnerVO vo) {
		System.out.println("--->insert partner start.....");
		try{
			jdbcTemplate.update(INSERT_PartImg, vo.getPart_img(), vo.getPart_id());
		}catch (Exception e) {
			System.out.println(e);
			System.out.println("오류임");
		}
	}
	
	public void updatePartnerImg(PartnerVO vo) {
		System.out.println("--->insert partner start.....");
		try{
			jdbcTemplate.update(INSERT_PartImg, vo.getPart_img(), vo.getPart_id());
		}catch (Exception e) {
			System.out.println(e);
			System.out.println("오류임");
		}
	}
}
