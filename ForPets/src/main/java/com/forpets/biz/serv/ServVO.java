package com.forpets.biz.serv;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 *  케어서비스모듈입니다.
 *  
 */

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class ServVO {
	private int s_num; //서비스번호
	private String s_name; //서비스이름
	private int s_price; //서비스가격
}
