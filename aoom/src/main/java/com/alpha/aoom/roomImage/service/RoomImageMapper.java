package com.alpha.aoom.roomImage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomImageMapper {
	
	// 해당하는 숙소의 사진url 조회
	List<Map<String, Object>> selectByRoomId(Map<String, Object> param);
	
	// 숙소 등록 2단계 - 메인 이미지 제외 나머지 이미지 INSERT
	int insert(Map<String, Object> param);
}
