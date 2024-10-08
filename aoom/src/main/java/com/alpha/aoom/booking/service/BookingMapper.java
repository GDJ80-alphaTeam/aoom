package com.alpha.aoom.booking.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingMapper {
	
	// 유저의 예약정보 + 숙소정보 리스트 
	List<Map<String, Object>> selectListByGuestId(Map<String, Object> param);
	
	// 유저의 총예약수
	int selectByTotalCnt(Map<String, Object> param);
	
	// 예약 추가
	int insert(Map<String, Object> param);

	// 예약상태변경
	int updateBookingStat(Map<String, Object> param);
	
	// 비정상적인 접근을 했을때를 위한, 확인쿼리
	int selectByInvalidAccess(Map<String, Object> param);
	
	// 로그인 유저의 호스팅한 숙소의 예약 목록
	List<Map<String, Object>> selectListByUserId(Map<String, Object> param);

	// 로그인 유저의 호스팅한 숙소의 예약 목록의 행의 갯수
	int selectListByUserIdCnt(Map<String, Object> param);
	
	// 호스트 예약 상세보기
	Map<String, Object> selectByBookingId(Map<String, Object> param);
	
	// 오늘 기준 예약 정보 조회
	List<Map<String, Object>> selectListBySysdate(Map<String, Object> param);
	
	// 오늘 기준 예약 정보의 행갯수
	int selectListBySysdateCnt(Map<String, Object> param);
	
	// 체크아웃 처리
	int updateBookstat(Map<String, Object> param);
	
	// 호스트의 월별 예약수
	List<Map<String, Object>> selectListByMonthCnt(Map<String, Object> param);
	
	// 호스트의 숙소별 예약수
	List<Map<String, Object>> selectListByRoomCnt(Map<String, Object> param);
	
	// 호스트의 숙소별 평점
	List<Map<String, Object>> selectListByAvgRating(Map<String, Object> param);
	
	// 호스트의 숙소의 위시리스트된 갯수
	List<Map<String, Object>> selectListByWishlistCnt(Map<String, Object> param);
	
	
}