package com.alpha.aoom.cancelRefund.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alpha.aoom.booking.service.BookingMapper;
import com.alpha.aoom.bookingOnedayPrice.service.BookingOnedayPriceMapper;
import com.alpha.aoom.onedayPrice.service.OnedayPriceMapper;
import com.alpha.aoom.roomPayment.service.RoomPaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CancelRefundService {

	@Autowired
	CancelRefundMapper cancelRefundMapper;
	
	@Autowired
	RoomPaymentMapper roomPaymentMapper;
	
	@Autowired
	BookingMapper bookingMapper;
	
	@Autowired
	BookingOnedayPriceMapper bookingOnedayPriceMapper;
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	
	
	// 예약취소	
	// param : bookingId , refundPrice , cancelreaCode , cancelContent , paymentId , stayPeople , checkIn , checkOut , bankCode   
	@Transactional(rollbackFor=Exception.class)
	public int insert(Map<String, Object> param) {
		
		// 예약 취소시 예약취소 인서트
		cancelRefundMapper.insert(param);
		param.put("bookstatCode","bst05");
		// 예약상태 업데이트
		bookingMapper.updateBookingStat(param);
		// 매퍼 삭제
		bookingOnedayPriceMapper.delete(param);
		// 예약한 숙소의 상태 예약가능으로 변경 
		onedayPriceMapper.updateByCancel(param);
		// 계좌번호가 변경되었다면 계좌번호 변경 
		if(param.get("refundAccount") != null) {
			roomPaymentMapper.updateAccount(param);
			}
		
		return 1;
		
	}
}
