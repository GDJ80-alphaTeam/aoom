package com.alpha.aoom.room.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomMapper {
	
	// 숙소 전체 목록 조회
	List<Map<String, Object>> select();
	
	//숙소 상세 조회
	Map<String, Object> selectOne(Map<String,Object> param);
	
	// 어메니티 목록 조회
	List<Map<String, Object>> selectByAmenities(Map<String,Object> param);
	
	// user가 호스팅하고있는 숙소 목록 조회
	List<Map<String, Object>> selectByUserId(String userId);
	
	// 조회수 TOP4 숙소 조회
	List<Map<String, Object>> selectByViews();
	
	// 별점 TOP4 숙소 조회
	List<Map<String, Object>> selectByRating();
	
	// 예약 TOP4 숙소 조회
	List<Map<String, Object>> selectByBooking();
	
	// 위시리스트 TOP4 숙소 조회
	List<Map<String, Object>> selectByWishList();
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	int insert(Map<String, Object> param);

	// 숙소 등록 - 숙소 등록 1단계에서 입력한 정보 DB에 수정
	int updateFisrtInfo(Map<String, Object> param);
	
	// 숙소 등록 - 숙소 등록 2단계에서 입력한 정보 DB에 수정
	int updateSecondInfo(Map<String, Object> param);
}
