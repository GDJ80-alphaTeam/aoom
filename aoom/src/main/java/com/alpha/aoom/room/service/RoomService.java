package com.alpha.aoom.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoomService {
	
	@Autowired
	RoomMapper roommapper ;
	
	// parameter: room_id
	//숙소 상세보기 조회
	public List<HashMap<String,Object>> retriveRoomInfo(Map<String,Object> param) {
		return roommapper.retrieveInfo(param);
	}
	
}
