package com.alpha.aoom.wishList.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishListMapper {

	// 해당 user의 위시리스트에 roomId를 INSERT
	int insert(Map<String, Object> param);
	
	// 위시리스트 조회
	List<Map<String, Object>> select(Map<String, Object> param);
	
	// 위시리스트에 숙소 삭제
	int delete(Map<String, Object> param);
}
