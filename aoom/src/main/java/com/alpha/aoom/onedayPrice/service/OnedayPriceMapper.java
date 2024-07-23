package com.alpha.aoom.onedayPrice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OnedayPriceMapper {
	
	// onedayPrice의 statCode상태에 따른 검색
	List<Map<String, Object>> selectByStatCode(Map<String,Object> param); 
	
	// 숙소 등록시 운영일만큼 숙박 가격 추가
	int insert(Map<String, Object> param);
	
	// 해당 숙소의 하루 숙박 가격 삭제
	int delete(Map<String, Object> param);
	
	// onedayPrice에 사용자가 입력한 날짜 조건으로 검색
	List<Map<String, Object>> selectByOneday(Map<String, Object> param);
	
	// 숙소에 예약불가능한 날짜가 없을경우 사용자가 선택한값이후로 출력할 날짜들 
	List<Map<String, Object>> selectByremain(Map<String, Object> param);
	
	// 숙박일정에 따른 숙박가격 조회
	Map<String, Object> selectByBookingDate(Map<String, Object> param);
	
	// 숙박일정에 따른 숙박가격 세부조회(일자별 가격)
	List<Map<String, Object>> selectByBookingDateDetail(Map<String, Object> param);
	
	// oneday_price 상태 예약불가로 업데이트, 남은 인원 감소
	int updateByStatUsePeople(Map<String, Object> param);
}
