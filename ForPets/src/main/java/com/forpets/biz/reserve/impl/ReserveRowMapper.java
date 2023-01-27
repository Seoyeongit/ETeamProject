package com.forpets.biz.reserve.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;

public class ReserveRowMapper implements RowMapper<ReServeVO> {

	@Override
	public ReServeVO mapRow(ResultSet rs, int rowNum){
		ReServeVO vo = new ReServeVO();
		PartnerVO voP = new PartnerVO();
		PetVO voPet = new PetVO();
		
		try {
			vo.setReserve_num(rs.getInt("RESERVE_NUM"));
			vo.setReserve_day(rs.getString("RESERVE_DAY"));
			vo.setS_num(rs.getInt("S_NUM"));
			vo.setPart_id(rs.getString("PART_ID"));
			vo.setPet_id(rs.getInt("PET_ID"));
			vo.setStatus(rs.getInt("STATUS"));
			
			
			voP.setPart_name(rs.getString("PART_NAME"));
			vo.setVoPet(voPet);
			
			
			voPet.setName(rs.getString("pet_name"));
			vo.setVoP(voP);
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Reserve rowmapper Error");
		}

		
		return vo;

	}
}
