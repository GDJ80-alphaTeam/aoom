package com.alpha.aoom.onedayPrice.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OnedayPriceService {
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	// param: roomId , onestateCode
	// 예약 불가능한 숙소목록 출력
	public List<Map<String, Object>> selectByStatCode (Map<String, Object> param) {
			
		param.put("onestateCode", "one01");
		return onedayPriceMapper.selectByStatCode(param);
	}

	// 숙소 등록시 운영일만큼 숙박 가격 추가
	public void insert(Map<String, Object> param) {
		log.info("param={}", param);

		// startDate부터 endDate까지 DB에 INSERT
		// DB에서 가져온 날짜의 포맷 형식 지정
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");

		// 시작일과 종료일 가져오기
		LocalDate startDate = LocalDate.parse(param.get("startDate").toString(), dateTimeFormatter);
		LocalDate endDate = LocalDate.parse(param.get("endDate").toString(), dateTimeFormatter);

		// 시작일부터 종료일까지 반복
		for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
			
			log.info(date.toString());
			
			// INSERT에 사용될 map을 만들고 필요한 컬럼들 추가
			Map<String, Object> onedayParam = new HashMap<>();
			onedayParam.put("roomId", param.get("roomId"));
			onedayParam.put("oneday", date);
			onedayParam.put("onedayPrice", param.get("defaultPrice"));
			onedayParam.put("leftPeople", param.get("maxPeople"));
			
			log.info("onedayParam={}", onedayParam);
			
			// insert 메서드 호출
			onedayPriceMapper.insert(onedayParam);
		}
	}
	
	// 해당 숙소의 하루 숙박 가격 삭제
	public int delete(Map<String, Object> param) {
		return onedayPriceMapper.delete(param);
	}
	
	// 예약가능한 날짜(달력에서 날짜를 선택했을때)
	public List<Map<String, Object>> selectByOneday (Map<String, Object> param){
		log.info("왜값이 있는걸까?"+onedayPriceMapper.selectByOneday(param));
		
		// 선택한 날짜뒤로 예약날짜가 없으면 결과값이 없음. 그래서 그때 이후로 표시해줄 날짜값 호출을 해줘야하는데 oracle이랑 mybatis랑 쿼리결과가름
		if(onedayPriceMapper.selectByOneday(param).isEmpty()) {
			log.info("if = null일때");
			return onedayPriceMapper.selectByremain(param);
		} else {
			log.info("if = null아닐때");
			return onedayPriceMapper.selectByOneday(param);
		}
		
	}
}
