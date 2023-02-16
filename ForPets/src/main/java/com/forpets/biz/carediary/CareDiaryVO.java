package com.forpets.biz.carediary;

import com.forpets.biz.pet.PetVO;
import com.forpets.biz.reserve.ReServeVO;
import com.forpets.biz.user.UserVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 *  돌봄일지모듈입니다.
 */


@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter @Setter
public class CareDiaryVO {
	private int diary_id; //돌봄일지id
	/*공통적인부분*/
	private String pet_condition; //반려동물 상태
	private String care_review; //돌봄후기
	/*픽업서비스부분*/
	private String medi_result; //진료후기
	private String beauty_list; //미용케어리스트
	/*산책서비스부분*/
	private String walk_time; //산책이행시간
	/*추가서비스부분*/
	private String shower_serv; //샤워서비스
	private String training_serv; //훈련서비스
	/*기본(돌봄)서비스*/
	private String meal; //식사
	private String snak; //간식
	private String pet_play; //놀이
	
	/*외래키(비식별)*/
	private String reserve_num; //예약번호
	private String complete_day; //돌봄케어가 완료된 날짜입니다.
	private String complete_time; //돌봄케어가 완료된 시간입니다.
	
	private ReServeVO voR; 
}