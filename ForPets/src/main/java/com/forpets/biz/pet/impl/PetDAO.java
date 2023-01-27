package com.forpets.biz.pet.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.forpets.biz.pet.PetService;
import com.forpets.biz.pet.PetVO;

@Repository("PetDAO")
public class PetDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	private final String GET_PETINFO =  "SELECT * FROM USER_PET WHERE USER_ID = ?";
//	private final String INSERT_PET = "INSERT INTO user_pet VALUES((user_pet_seq.NEXTVAL),?,?,?,?,NULL,?,?)";
	private final String INSERT_PET = "INSERT INTO user_pet(pet_id,pet_name,pet_type,pet_age,user_id,pet_img) VALUES((user_pet_seq.NEXTVAL),?,?,?,?,?)";
	
	public void insertPet(PetVO vo) {
		System.out.println("--->insert pet start.....");
		try{
			Object[] obj = {vo.getName(),vo.getType(),vo.getAge(),vo.getUser_id(),vo.getImg()};
			jdbcTemplate.update(INSERT_PET,obj);
		}catch (Exception e) {
			System.out.println(e);
			System.out.println("오류임");
		}
	}
	
	public PetVO getPetInfo(PetVO vo) {
		vo.setUser_id("abc123");
		Object[] orgs = {vo.getUser_id()};
		return jdbcTemplate.queryForObject(GET_PETINFO,orgs, new PetRowMapper());
	}
	

	
	
}
