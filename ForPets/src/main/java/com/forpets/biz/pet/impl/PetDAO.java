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
	
	private final String INSERT_PET = "INSERT INTO user_pet "
										+ "VALUES((user_pet_seq.NEXTVAL),?,?,?,?,?,?,?,?,?,?,?,?)";
	
	private final String UPDATE_PET = "UPDATE USER_PET "
									+ "SET PET_NAME=?, PET_IMG=?, PET_AGE=?, PET_GENDER=chr(?), WEIGHT=?,PET_TYPE_DETAIL=?,LICENSE=?,IS_NEUTERED=chr(?),PET_SOCIAL=?,IS_VACCIN=chr(?) "
									+ "WHERE PET_ID=?";
	
	private final String COUNT_PET = "select count(*) from user_pet where user_id=?";
	
	//230130 최지혁
	private final String PET_GET = "select * from USER_PET where pet_ID = ?";
	
	public void insertPet(PetVO vo) {
		System.out.println("--->insert pet start.....");
		try{
			char gender = vo.getGender();
			int genderCode = gender;
			int neuteredCode = vo.getIsNeutered();
			int vaccinCode = vo.getIsVaccin();
			
			Object[] obj = {vo.getName(),vo.getType(),vo.getImg(),vo.getAge(),
							vo.getGender() == '\u0000' ? null : vo.getGender(),
							vo.getUser_id(),vo.getWeight(),
							vo.getType_detail(),vo.getLicense(),
							vo.getIsNeutered() == '\u0000' ? null : vo.getIsNeutered(),
							vo.getSocial(),
							vo.getIsVaccin() == '\u0000' ? null : vo.getIsVaccin()
							};
			
			jdbcTemplate.update(INSERT_PET,obj);
		
		}catch (Exception e) {
			System.out.println(e);
			System.out.println("오류임");
		}
	}
	
	public List<PetVO> getPetInfo(String user_id) {
		Object[] orgs = {user_id};
		return jdbcTemplate.query(GET_PETINFO,orgs, new PetRowMapper());
	}
	
	public PetVO getPetDetail(Integer pet_id) {
		Object[] orgs = {pet_id};
		return jdbcTemplate.queryForObject(PET_GET, orgs, new PetRowMapper());
	}
	
	public int countPet(PetVO vo) {
		int result = 0;
		Object[] orgs = {vo.getUser_id()};
		result = jdbcTemplate.queryForObject(COUNT_PET,orgs,Integer.class);
		return result;
	}
	
	public void updatePet(PetVO vo) {
		
		
		
		int genderCode = vo.getGender();
		int neuteredCode = vo.getIsNeutered();
		int vaccinCode = vo.getIsVaccin();
		
		Object[] orgs = {vo.getName(),vo.getImg(),vo.getAge(),genderCode,vo.getWeight(),vo.getType_detail()
						,vo.getLicense(),neuteredCode,vo.getSocial(),vaccinCode,vo.getId()};
		
		jdbcTemplate.update(UPDATE_PET,orgs);
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
		newPet.setImg(resultSet.getString("PET_IMG"));
		newPet.setAge(resultSet.getInt("PET_AGE"));
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
					newPet.setId(resultSet.getInt("PET_ID"));
					newPet.setName(resultSet.getString("PET_NAME"));
					newPet.setType(resultSet.getString("PET_TYPE"));
					newPet.setImg(resultSet.getString("PET_IMG"));
					newPet.setAge(resultSet.getInt("PET_AGE"));
					newPet.setGender(resultSet.getString("PET_GENDER").charAt(0));
					newPet.setUser_id(resultSet.getString("USER_ID"));
					return newPet;
				}
				, pet_id);
		return pet;
	}
}
