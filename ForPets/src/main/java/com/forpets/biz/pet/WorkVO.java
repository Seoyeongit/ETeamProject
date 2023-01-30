package com.forpets.biz.pet;
/*
 *  산책모듈입니다.
 */

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter @Setter
public class WorkVO {
	
	private String user_id; //유저의 아이디
	private float x; //산책로x
	private float y; //산책로y
	private float[] xArr; //산책로x배열 
	private float[] yArr; //산책로y배열

}
