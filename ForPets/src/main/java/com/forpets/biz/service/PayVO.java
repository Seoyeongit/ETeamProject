package com.forpets.biz.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/*
 *  결제모듈입니다.
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class PayVO {
	private int reserve_num;
	private String pet_name;
	private String pet_type;
	private String pet_image;
	private int pet_age;
	private String walk_ho;
	private String walk_ver;
	private String reserve_day;
	private String reserve_time;
	private String reserve_add;
	private int s_num;
	private String user_id;
	private String part_id;
	
	private String service_name;
	private int service_price;
}
