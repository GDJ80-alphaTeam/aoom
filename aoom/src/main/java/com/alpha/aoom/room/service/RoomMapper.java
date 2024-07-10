package com.alpha.aoom.room.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomMapper {
	// 숙소 전체 목록 조회
	List<Map<String, Object>> retrieveList();
}
