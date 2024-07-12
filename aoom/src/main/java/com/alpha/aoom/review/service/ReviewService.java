package com.alpha.aoom.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service 
@Transactional
public class ReviewService {

	@Autowired
	ReviewMapper reviewMapper;

	//param : room_id
	//숙소리뷰 리스트
	public List<Map<String, Object>> reviewList(Map<String, Object> param){		
		return reviewMapper.list(param);
	}
}
