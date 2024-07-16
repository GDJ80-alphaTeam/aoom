package com.alpha.aoom.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alpha.aoom.amenities.service.AmenitiesMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RoomService {
	
	@Autowired
	RoomMapper roomMapper ;
	
	@Autowired
	AmenitiesMapper amenitiesMapper;	
	// 숙소 상세보기 조회
	// param: room_id
	public Map<String, Object> retriveRoomInfo(Map<String,Object> param) {
		return roomMapper.selectOne(param);
	}
	
	
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	public Map<String, Object> setupRoom(String userId) {
		
		// selectKey를 이용해 roomId를 생성 후 가져오기 위해 map으로 선언
		Map<String, Object> setupRoomInfo = new HashMap<>();
		setupRoomInfo.put("userId", userId);
		
		// setupRoomInfo에 roomId 추가됨
		// 숙소 등록 결과 - 성공 : 1 / 실패 : 0
		roomMapper.insert(setupRoomInfo);
		
		// setupRoomInfo에 roomId가 들어갔는지 확인
		log.info("setupRoomInfo={}", setupRoomInfo);
		
		return setupRoomInfo;
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
	public List<Map<String, Object>> wishListDesc(){
		return roomMapper.selectByWishList();
	}
	
	// user가 호스팅하고있는 숙소 목록 조회
	public List<Map<String, Object>> retrieveListByUserId(String userId){
		return roomMapper.selectByUserId(userId);
	}
	
	// 숙소 등록 - 숙소 등록 1단계에서 입력한 정보 DB에 추가
	public int addFirstInfo(Map<String, Object> param) {
		return roomMapper.updateFisrtInfo(param);
	}
	
	// 숙소 등록 - 숙소 등록 2단계에서 입력한 정보 DB에 추가
	public int addSecondInfo(Map<String, Object> param) {
		return roomMapper.updateSecondInfo(param);
	}
}
