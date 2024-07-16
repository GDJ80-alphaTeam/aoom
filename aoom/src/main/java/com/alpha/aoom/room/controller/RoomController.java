package com.alpha.aoom.room.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.amenities.service.AmenitiesService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.util.BaseController;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMethod;


@Slf4j
@RequestMapping("/room")
@Controller
public class RoomController extends BaseController {

	@Autowired
	RoomService roomService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	AmenitiesService amenitiesService;
	
	
	// 숙소상세보기 뷰페이지 호출
	// param: userId(get)
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		// 숙소정보 조회
		Map<String, Object> roomInfo = roomService.retriveRoomInfo(param);
		
		// 숙소 어메니티 조회
		List<Map<String, Object>> roomAmenities = amenitiesService.retriveRoomAmenities(param);
					
		//숙소리뷰조회
		List<Map<String, Object>> reviewList = reviewService.selectByList(param);
		
		//숙소 평점 및 리뷰수 조회 
		Map<String,Object> reviewCntAvg = reviewService.selectByAvgCnt(param);
		
		int currentPage = reviewService.currentPage(param);
		//log.info("숙소상세보기 호출값" + roomInfo);
		//log.info("숙소편의시설 호출값" + roomAmenities);
		//log.info("리뷰목록 호출값"+reviewList);
		//log.info("해당숙소의 리뷰 평점 및 리뷰값"+reviewCntAvg);
		modelMap.addAttribute("roomInfo",roomInfo);
		modelMap.addAttribute("roomAmenities",roomAmenities);
		modelMap.addAttribute("reviewList",reviewList);
		modelMap.addAttribute("reviewCntAvg",reviewCntAvg);
		modelMap.addAttribute("currentPage",currentPage);
		
		return "/room/roomInfo";
	}
	
	@RequestMapping("/roomList")
	@ResponseBody
	public String roomList(@RequestParam Map<String, Object> param) {
		
		log.info("main에서 넘어온 param : "+ param);
		
		return "";
	}
}
