package com.alpha.aoom.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomMapper {
	
	// 숙소 전체 목록 조회
	List<Map<String, Object>> retrieveList();
	
	//숙소 상세 조회
	List<HashMap<String,Object>> retrieveInfo(Map<String,Object> param); 
	
	// user가 호스팅하고있는 숙소 목록 조회
	List<Map<String, Object>> hostRetriveList(String userId);
	
	// 조회수 TOP4 숙소 조회
	List<Map<String, Object>> viewsDesc();
	
	// 별점 TOP4 숙소 조회
	List<Map<String, Object>> ratingDesc();
	
	// 예약 TOP4 숙소 조회
	List<Map<String, Object>> bookingDesc();
	
	// 위시리스트 TOP4 숙소 조회
	List<Map<String, Object>> wishDesc();
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	int insert(Map<String, Object> param);

}
