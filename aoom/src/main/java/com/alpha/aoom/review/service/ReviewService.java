package com.alpha.aoom.review.service;

import java.math.*;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service 
@Transactional
public class ReviewService {

	@Autowired
	ReviewMapper reviewMapper;

	//param : room_id , 
	//숙소리뷰 리스트
	public List<Map<String, Object>> retriveReviewList(Map<String, Object> param){
		
		int currentPage = 1;
		// 6개씩 출력
		int rowPerPage = 4;
		// currentPage 값이 들어있으면 해당하는 currentPage값으로교체
		if(param.get("currentPage") != null) {			
			currentPage = (int) param.get("currentPage");
		} 				
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = beginRow + rowPerPage;		
		param.put("beginRow", beginRow);
		param.put("lastPage", lastPage);

		return reviewMapper.selectByRoomList(param);		
	}
	
	//param : room_id
	//숙소리뷰 개수 및 평균
	public Map<String, Object> retriveReviewAvgCnt(Map<String,Object> param){
		
		Map<String,Object> avgCnt = reviewMapper.selectByAverageCount(param);
		// 페이징용 totalRow용 
		int totalRow = ((BigDecimal)avgCnt.get("cnt")).intValue();
		
		System.out.println(avgCnt.get("cnt").getClass().getName()); 
		avgCnt.put("totalRow", totalRow);
		return avgCnt;
	}
}
