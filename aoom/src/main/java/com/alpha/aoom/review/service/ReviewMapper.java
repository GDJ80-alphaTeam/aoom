package com.alpha.aoom.review.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	
	// 리뷰리스트 조회  
	List<Map<String,Object>> list (String beginRow , String rowPerPage);
}
