package com.forpets.biz.admin;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class AdminVO {
	private String adm_id;
	private String adm_pw;
	private String adm_name;
	private String adm_phone;
	private String adm_email;
	private Date adm_date;
	
}
