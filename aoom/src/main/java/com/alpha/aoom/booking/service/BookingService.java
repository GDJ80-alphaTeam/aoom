package com.alpha.aoom.booking.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alpha.aoom.bookingOnedayPrice.service.BookingOnedayPriceMapper;
import com.alpha.aoom.onedayPrice.service.OnedayPriceMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookingService {

	@Autowired
	BookingMapper bookingMapper;
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	@Autowired
	BookingOnedayPriceMapper bookingOnedayPriceMapper;
	
	final private int rowPerPage = 5 ;
		
	// 사용자의 예약목록 출력
	public List<Map<String, Object>> selectByUserId(Map<String, Object> param){
		
		int beginRow = ((int)param.get("currentPage") - 1) * rowPerPage;
		int endRow = beginRow + rowPerPage;
		
		param.put("beginRow", beginRow);
		param.put("endRow", endRow);
		
		return bookingMapper.selectByUserId(param);
		
	}
	
	// 예약 페이징 정보 
	public Map<String, Object> selectByTotalCnt(Map<String, Object> param){
		
		Map<String, Object> pagingInfo = new HashMap<>();
		int totalRow = bookingMapper.selectByTotalCnt(param);
		
		int lastPage = totalRow / rowPerPage ;
		
		if(totalRow % rowPerPage != 0) {
			lastPage += 1; 
		}
		
		pagingInfo.put("totalRow", totalRow);
		pagingInfo.put("lastPage", lastPage);
		
		return pagingInfo;
	}
	
	// 예약 하기
	@Transactional
	public int booking(Map<String, Object> param) {
		// 예약추가	
		bookingMapper.insert(param);
		// oneday_price 상태 예약불가로 업데이트, 남은 인원 감소
		onedayPriceMapper.updateByStatUsePeople(param);
		// booking_oneday_price_map 추가
		
		
		List<Map<String, Object>> oneDayPriceList = onedayPriceMapper.selectListByDuringDate(param);
		
		for(Map<String,Object> map : oneDayPriceList) {
			map.put("bookingId", param.get("bookingId").toString());
			System.out.println(map);
			bookingOnedayPriceMapper.insert(map);
		}
		
		return 1;
	}
	
	// param : bookingId , bookstatCode
		// 예약 상태 변경 
	public int updateBookingStat(Map<String, Object> param) {
			
		return bookingMapper.updateBookingStat(param);
	}
	
}
