package com.alpha.aoom.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.amenities.service.AmenitiesService;
import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.roomImage.service.RoomImageService;
import com.alpha.aoom.util.BaseController;

import lombok.extern.slf4j.Slf4j;


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
	@Autowired
	RoomImageService roomImageService;
	@Autowired
	CodeService codeService;
	
	// 숙소상세보기 뷰페이지 호출
	// param: userId(get)
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		// 숙소정보 조회 + 숙소 주인정보 
		Map<String, Object> roomInfo = roomService.selectOne(param);
		
		// 숙소 어메니티 조회
		List<Map<String, Object>> roomAmenities = amenitiesService.selectByDetail(param);
					
		// 숙소리뷰조회
		List<Map<String, Object>> reviewList = reviewService.selectList(param);
		
		// 숙소 평점 및 리뷰수 조회 
		Map<String,Object> reviewCntAvg = reviewService.selectByAvgCnt(param);
		
		// 숙소 이미지url 검색
		List<Map<String, Object>> roomImages = roomImageService.selectByRoomId(param);
		
		// 숙소 호스트가 받은 총합 후기수
		Map<String,Object> hostReviewTotal = reviewService.selectByHostTotalCnt(param);
	
		int currentPage = reviewService.currentPage(param);

		//log.info("숙소상세보기 호출값" + roomInfo);
		//log.info("숙소편의시설 호출값" + roomAmenities);
		//log.info("리뷰목록 호출값"+reviewList);
		//log.info("해당숙소의 리뷰 평점 및 리뷰값"+reviewCntAvg);
		//log.info("해당숙소의 이미지 url 조회"+roomImages);
		modelMap.addAttribute("roomInfo",roomInfo);
		modelMap.addAttribute("roomAmenities",roomAmenities);
		modelMap.addAttribute("reviewList",reviewList);
		modelMap.addAttribute("reviewCntAvg",reviewCntAvg);
		modelMap.addAttribute("currentPage",currentPage);
		modelMap.addAttribute("roomImages",roomImages);
		modelMap.addAttribute("hostReview",hostReviewTotal);
		
		return "/room/roomInfo";
	}
	
	// 숙소 목록 출력(검색, 필터, 카테고리 조건)
	@RequestMapping("/roomList")
	public String roomList(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("main에서 넘어온 param : "+ param);
		
		// 숙소 카테고리 조회
		List<Map<String, Object>> roomCategory = codeService.selectByGroupKey("roomcate");
		
		// modelMap에 데이터 추가
		modelMap.addAttribute("roomCategory", roomCategory);
		
		return "/room/roomList";
	}
	
	// 숙소 검색, 필터, 카테고리 조건 호출
	@RequestMapping("/ajaxResultRoom")
	@ResponseBody
	public Map<String, Object> ajaxResultRoom(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		Map<String, Object> model = new HashMap<>();
		
		log.info("받은 값 : "+ param);
		
		// 숙소 검색, 필터, 카테고리 결과 조회
		List<Map<String, Object>> searchRoom = roomService.selectBySearch(param);
		
		log.info("보낼 값 : "+searchRoom);
		
		// model에 숙소결과조회 값 넣기
		model.put("data", searchRoom);
		
		if (searchRoom != null) {
			return getSuccessResult(model);
		} else {
			return getFailResult(model,"조건에 부합하는 숙소가 없습니다.");
		}
		
	}
}
