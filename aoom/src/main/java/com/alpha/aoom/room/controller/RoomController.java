package com.alpha.aoom.room.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/room")
@Controller
public class RoomController {

	@Autowired
	RoomService roomService;
	@Autowired
	ReviewService reviewService;
	
	// 숙소상세보기 뷰페이지 호출
	// parameter: userId(get)
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		// 숙소정보 조회
		List<Map<String, Object>> roomInfo = roomService.retriveRoomInfo(param);
		// 숙소 어메니티 조회
		List<Map<String, Object>> roomAmenities = roomService.retriveRoomAmenities(param);
		//log.info("숙소상세보기 호출값" + roomInfo);
		//log.info("숙소편의시설 호출값" + roomAmenities);
		modelMap.addAttribute("roomInfo",roomInfo);
		modelMap.addAttribute("roomAmenities",roomAmenities);
		
		// 리뷰조회 테스트용 임시데이터 model에넣음
		int beginRow = 0;
		int rowPerPage = 6;		
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		//숙소리뷰조회
		List<Map<String, Object>> reviewList = reviewService.reviewList(param);
		log.info("리뷰목록 호출값"+reviewList);		
		modelMap.addAttribute("reviewList",reviewList);
		return "/room/roomInfo";
	}

	
}
