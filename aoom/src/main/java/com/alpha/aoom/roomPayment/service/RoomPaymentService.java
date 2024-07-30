package com.alpha.aoom.roomPayment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoomPaymentService {
	
	@Autowired 
	RoomPaymentMapper roomPaymentMapper;
	
	// 해당예약의 결제정보 검색
	public Map<String, Object> selectByBookingId(Map<String, Object> param){
			
		return roomPaymentMapper.selectByBookingId(param);
	}
	
	// 예약취소시 계좌값에 변동이 있으면 업데이트 없으면 유지
	public int updateAccount(Map<String, Object> param) {
		
		return roomPaymentMapper.updateAccount(param);
	}
	
	// 호스트의 수입 조회(전체 or 숙소별)
	public List<Map<String, Object>> selectByHostRevenue(Map<String, Object> param) {
		return roomPaymentMapper.selectByHostRevenue(param);
	}
	
	// 호스트 - 월별 수입에서 해당 월의 수입 상세정보 보기
	public List<Map<String, Object>> selectByPaymentMonth(Map<String, Object> param) {
		return roomPaymentMapper.selectByPaymentMonth(param);
	}
	
}
