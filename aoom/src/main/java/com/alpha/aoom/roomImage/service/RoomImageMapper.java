package com.alpha.aoom.roomImage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomImageMapper {
	
	// 해당하는 숙소의 사진url 조회
	List<Map<String, Object>> selectByList(Map<String, Object> param);
}
