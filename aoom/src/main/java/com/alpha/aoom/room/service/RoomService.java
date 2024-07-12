package com.alpha.aoom.room.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RoomService {
	
	@Autowired
	RoomMapper roomMapper ;
		
	// 숙소 상세보기 조회
	// param: room_id
	public List<Map<String, Object>> retriveRoomInfo(Map<String,Object> param) {
		return roomMapper.selectOne(param);
	}
	
	// 숙소 편의시설 조회
	// param: room_id
	public List<Map<String, Object>> retriveRoomAmenities(Map<String,Object> param){
		return roomMapper.selectByAmenities(param);
	}
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	// param : userId
	public Map<String, Object> registRoom(Map<String, Object> param) {
		
		// param에 roomId 추가됨
		// 숙소 등록 결과 - 성공 : 1 / 실패 : 0
		int result = roomMapper.insert(param);
		
		// result 값에 따른 분기문
		if(result == 1) { // 숙소 등록 성공
			param.put("result", "success");
		} else { // 숙소 등록 실패
			param.put("result", "fail");
		}
		
		log.info(param.toString());
		
		return param;
	}
	
	// 숙소 전체 목록 조회
	public List<Map<String, Object>> retrieveList(){
		return roomMapper.select();
	}
	// 조회수 TOP4 숙소 조회
	public List<Map<String, Object>> viewsDesc(){
		return roomMapper.selectByViews();
	}
	
	// 별점 TOP4 숙소 조회
	public List<Map<String, Object>> ratingDesc(){
		return roomMapper.selectByRating();
	}
	
	// 예약 TOP4 숙소 조회
	public List<Map<String, Object>> bookingDesc(){
		return roomMapper.selectByBooking();
	}
	
	// 위시리스트 TOP4 숙소 조회
	// public List<Map<String, Object>> wishListDesc(){
	// 	  return roomMapper.selectByWishList();
	// }
	
}
