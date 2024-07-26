package com.alpha.aoom.wishList.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WishListService {

	@Autowired
	WishListMapper wishListMapper;
	
	// 해당 user의 위시리스트에 roomId를 INSERT
	public int insert(Map<String, Object> param) {
		return wishListMapper.insert(param);
	}
	
	// 해당 user의 위시리스트 조회
	public List<Map<String, Object>> select(Map<String, Object> param) {
		return wishListMapper.select(param);
	}
	
	// 위시리스트에 숙소 삭제
	public int delete(Map<String, Object> param) {
		return wishListMapper.delete(param);
	}
}
