package com.alpha.aoom.roomPayment.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomPaymentMapper {
	// 결제 내역 추가
	int insert(Map<String, Object> param);
}
