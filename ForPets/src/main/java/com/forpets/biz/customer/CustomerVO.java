package com.forpets.biz.customer;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class CustomerVO {

	private int cust_no;
	private String user_id;
	private String part_id;
	private String cust_title;
	private String cust_content;
	private Date cust_date;
	private MultipartFile uploadFile;
}
