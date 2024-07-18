package com.alpha.aoom.review.service;

import java.math.BigDecimal;
import java.util.HashMap;
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

	private final int rowPerPage = 2;
	
	// param : String room_id , int currentPage , int beginRow , int endRow
	// 숙소리뷰 리스트
	public Map<String, Object> selectList(Map<String, Object> param){
		
		// currentPage가 param에 가지고있으면 param값 , 없으면 1
		int currentPage = (String)param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ;  
									
		// startRow ~ endRow 사이의 값 조회  
		int beginRow = (currentPage - 1) * rowPerPage;
		// beginRow + rowPerPage 로우퍼페이지의 개수만큼 검색
		int endRow = beginRow + rowPerPage;		
		
		param.put("beginRow", beginRow);
		param.put("endRow", endRow);
		
		// reviewList 와 currentPage 같이보내기위한 Map
		Map<String, Object> selectList = new HashMap<String, Object>(); 
		
		selectList.put("review", reviewMapper.selectList(param));
		selectList.put("currentPage", currentPage);
		return selectList; 		
	}
	
	// param : room_id
	// 숙소리뷰 개수 및 평균 + pagingInfo
	public Map<String, Object> selectByAvgCnt(Map<String,Object> param){
		
		// reviewMapper에서 데이터 가져오기 + 카멜케이스맵으로 생성되어서 그대로 map에 put을하면 대문자가 소문자로 바뀌어버림
        Map<String, Object> originalPagingInfo = reviewMapper.selectByAvgCnt(param);

        // totalRow 검색후 페이징에 필요한값 생성 , 위의 이유때문에 hashMap으로 타입변경 
        Map<String, Object> getPagingInfo = new HashMap<>(originalPagingInfo);
					
		int totalRow = ((BigDecimal)(getPagingInfo).get("cnt")).intValue();	
		
		int lastPage = totalRow / rowPerPage ;
		
		if(totalRow % rowPerPage != 0) {
			lastPage += 1; 
		}
			
		getPagingInfo.put("lastPage", lastPage);
		//log.info(getPagingInfo.getClass().getCanonicalName());
		return getPagingInfo;
	}
	
	// param: roomId
	// 해당 숙소를 운영하는 유저의 총 후기수 
	public Map<String,Object> selectByHostTotalCnt(Map<String, Object> param){
		
		Map<String, Object> originalHostCount = reviewMapper.selectByHostTotalCnt(param);
		
		Map<String, Object> hostCount = new HashMap<>(originalHostCount);
		
		double roundedValue = 0; 
		if(hostCount.get(hostCount) != null) {
			roundedValue = Math.round((((BigDecimal)(hostCount).get("avg")).doubleValue()) * 10) / 10.0;
		}
		//log.info(roundedValue);
		hostCount.put("avg", roundedValue);
		return hostCount;
					
	}

}
