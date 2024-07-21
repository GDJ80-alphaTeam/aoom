package com.alpha.aoom.review.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	
	// 해당숙소의 리뷰리스트 조회  
	List<Map<String, Object>> selectList (Map<String, Object> param);
	
	// 리뷰 평균평점 및 리뷰개수 
	Map<String, Object> selectByAvgCnt (Map<String, Object> param);
	
	// 유저 한명의 받은리뷰수의 총합
	Map<String, Object> selectByHostTotalCnt (Map<String, Object> param);
	
	// 숙소의 평점과 후기의 갯수 조회
	Map<String, Object> selectByRatingAvgReviewCnt(Map<String, Object> param);
}
