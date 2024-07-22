package com.alpha.aoom.booking.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class BookingService {

	@Autowired
	BookingMapper bookingMapper;
	
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
	
}
