package com.alpha.aoom.room.service;

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
public class RoomService {
	
	@Autowired
	RoomMapper roomMapper ;
	
	// parameter: room_id
	//숙소 상세보기 조회
	public List<HashMap<String,Object>> retriveRoomInfo(Map<String,Object> param) {
		return roomMapper.retrieveInfo(param);
	}
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	public int registRoom(Map<String, Object> param) {
		// 숙소 등록 결과 - 성공 : 1 / 실패 : 0
		int result = roomMapper.insert(param);
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return result;
	}
	
}
