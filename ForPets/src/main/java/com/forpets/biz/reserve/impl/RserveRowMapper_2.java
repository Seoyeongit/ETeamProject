package com.forpets.biz.reserve.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.forpets.biz.partner.PartnerVO;
import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;

public class RserveRowMapper_2 implements RowMapper<ReServeVO> {

	@Override
	public ReServeVO mapRow(ResultSet rs, int rowNum){
		ReServeVO vo = new ReServeVO();
		PartnerVO voP = new PartnerVO();
		PetVO voPet = new PetVO();
		
		try {
			vo.setReserve_num(rs.getString("RESERVE_NUM"));
			vo.setReserve_day(rs.getString("RESERVE_DAY"));
			vo.setReserve_time(rs.getString("RESERVE_TIME"));
			vo.setReserve_add(rs.getString("RESERVE_ADD"));
			vo.setPick_add(rs.getString("PICK_ADD"));
			vo.setReserve_request(rs.getString("RESERVE_REQUEST"));
			vo.setS_num(rs.getInt("S_NUM"));
			vo.setPart_id(rs.getString("PART_ID"));
			vo.setUser_id(rs.getString("USER_ID"));
			vo.setPet_id(rs.getInt("PET_ID"));
			vo.setStatus(rs.getInt("STATUS"));
			
			voPet.setName(rs.getString("pet_name"));
			vo.setVoPet(voPet);
			
			voP.setPart_name(rs.getString("PART_NAME"));			
			voP.setImg(rs.getString("PART_IMG"));
			
			vo.setVoP(voP);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Reserve rowmapper Error");
		}

		
		return vo;

	}
}
