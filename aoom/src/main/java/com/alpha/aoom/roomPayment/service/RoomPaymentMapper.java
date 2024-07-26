package com.alpha.aoom.roomPayment.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomPaymentMapper {
	// 결제 내역 추가
	int insert(Map<String, Object> param);
	
	// 선택한 예약의 결제내역 검색
	Map<String, Object> selectByBookingId(Map<String, Object> param);
	
	// 예약 취소시 계좌 변경이 있으면 변경
	int updateAccount(Map<String, Object> param);
}
