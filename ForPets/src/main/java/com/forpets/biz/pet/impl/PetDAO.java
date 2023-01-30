package com.forpets.biz.pet.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
	
	//230130 최지혁
	private final String PET_GET = "select * from USER_PET where pet_ID = ?";
	
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
	

	//230130 최지혁
	public List<PetVO> getPetList(PetVO vo, String user_id) {
		System.out.println("---> JDBC로 getPetList() 기능 처리");
		return jdbcTemplate.query("select * from USER_PET where USER_ID = '" + user_id + "' order by pet_id desc", PetList);
	}

	//230130 최지혁
	private final RowMapper<PetVO> PetList = (resultSet, rowNum) -> {		
		PetVO newPet = new PetVO();
		newPet.setId(resultSet.getInt("PET_ID"));
		newPet.setName(resultSet.getString("PET_NAME"));
		newPet.setType(resultSet.getString("PET_TYPE"));
		newPet.setAge(resultSet.getInt("PET_AGE"));
		newPet.setWark(resultSet.getString("PET_WORK"));
		newPet.setGender(resultSet.getString("PET_GENDER").charAt(0));
		newPet.setUser_id(resultSet.getString("USER_ID"));
		return newPet;
	};
	
	//230130 최지혁
	public PetVO getPet(PetVO vo, String pet_id) {
		System.out.println("---> JDBC로 getPet() 기능 처리");
		PetVO pet = jdbcTemplate.queryForObject(PET_GET, 
				(resultSet, rowNum) -> {
					PetVO newPet = new PetVO();
					newPet.setName(resultSet.getString("PET_NAME"));
					newPet.setType(resultSet.getString("PET_TYPE"));
					newPet.setAge(resultSet.getInt("PET_AGE"));
					newPet.setWark(resultSet.getString("PET_WORK"));
					newPet.setGender(resultSet.getString("PET_GENDER").charAt(0));
					newPet.setUser_id(resultSet.getString("USER_ID"));
					return newPet;
				}
				, pet_id);
		return pet;
	}
}
