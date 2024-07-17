package com.alpha.aoom.roomImage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomImageService {

	@Autowired
	RoomImageMapper roomImageMapper;
	
	// 해당 숙소의 사진 검색
	public List<Map<String, Object>> selectByRoomId(Map<String,Object> param) {
		
		return roomImageMapper.selectByRoomId(param);
	}
}
