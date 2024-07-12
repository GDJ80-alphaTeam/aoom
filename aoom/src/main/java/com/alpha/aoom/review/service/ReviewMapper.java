package com.alpha.aoom.review.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	
	// 해당숙소의 리뷰리스트 조회  
	List<Map<String, Object>> selectByRoomList (Map<String,Object> param);
	
	// 리뷰 평균평점 및 리뷰개수 
	Map<String, Object> selectByAverageCount (Map<String,Object> param);
}
