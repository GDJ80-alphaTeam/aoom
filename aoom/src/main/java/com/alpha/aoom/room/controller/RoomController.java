package com.alpha.aoom.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.amenities.service.AmenitiesService;
import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.profile.service.ProfileService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.roomImage.service.RoomImageService;
import com.alpha.aoom.util.BaseController;
import com.alpha.aoom.wishList.service.WishListService;

import jakarta.servlet.http.HttpSession;
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
	@Autowired
	OnedayPriceService onedayPriceService;
	@Autowired
	WishListService wishListService;
	@Autowired
	ProfileService profileService;
	
	// 숙소상세보기 뷰페이지 호출
	// param: userId(get)
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		
		// 숙소정보 조회 + 숙소 주인정보 
		Map<String, Object> roomInfo = roomService.selectOne(param);
		
		// 숙소 어메니티 조회
		List<Map<String, Object>> roomAmenities = amenitiesService.selectByDetail(param);
					
		// 숙소리뷰조회
		Map<String, Object> reviewList = reviewService.selectList(param);
		
		// 숙소 평점 및 리뷰수 조회 
		Map<String, Object> reviewCntAvg = reviewService.selectByAvgCnt(param);
		
		// 숙소 이미지url 검색
		List<Map<String, Object>> roomImages = roomImageService.selectByRoomId(param);
		
		// 숙소 호스트가 받은 총합 후기수
		Map<String, Object> hostReviewTotal = reviewService.selectByHostTotalCnt(param);
		
		// 호스트 유저 프로필검색
		List<Map<String, Object>> hostProfile = profileService.selectListByuserId(param);
		
		// user의 세션이 있다면 해당 숙소가 위시리스트에 존재하는지 확인, 존재하면 modelMap으로 view에 보내기
		if(session.getAttribute("userInfo") != null) {
			Map<String, Object> wishListParam = new HashMap<String, Object>();
			wishListParam.put("roomId", param.get("roomId"));
			wishListParam.put("userId", ((Map<String, Object>) session.getAttribute("userInfo")).get("userId"));
			//log.info(wishListService.select(wishListParam).toString());
			modelMap.addAttribute("userWishRoom", wishListService.select(wishListParam));
		}
		
		//log.info("숙소상세보기 호출값" + roomInfo);
		//log.info("숙소편의시설 호출값" + roomAmenities);
		log.info("리뷰목록 호출값"+reviewList);
		//log.info("해당숙소의 리뷰 평점 및 리뷰값"+reviewCntAvg);
		//log.info("해당숙소의 이미지 url 조회"+roomImages);
		
		modelMap.addAttribute("roomInfo",roomInfo);
		modelMap.addAttribute("roomAmenities",roomAmenities);
		modelMap.addAttribute("reviewList",reviewList);
		modelMap.addAttribute("reviewCntAvg",reviewCntAvg);		
		modelMap.addAttribute("roomImages",roomImages);
		modelMap.addAttribute("hostReview",hostReviewTotal);		
		modelMap.addAttribute("hostProfile",hostProfile);
		return "/room/roomInfo2";
	}
	
	// 숙소 목록 출력(검색, 필터, 카테고리 조건)
	@RequestMapping("/roomList")
	public String roomList(@RequestParam Map<String, Object> param, ModelMap modelMap, HttpSession session) {
		
		// 검색 조건에 쓰일 카테고리, 숙소유형, 편의시설
		List<Map<String, Object>> roomCategory = codeService.selectByGroupKey("roomcate");
		List<Map<String, Object>> roomType = codeService.selectByGroupKey("roomtype");
		List<Map<String, Object>> amenities = codeService.selectByGroupKey("amenities");
		
		// 숙소 검색, 필터, 카테고리 선택 후 결과
		List<Map<String, Object>> searchResult = roomService.selectBySearch(param);
		
		// modelMap에 데이터 추가
		modelMap.addAttribute("roomCategory", roomCategory);
		modelMap.addAttribute("roomType", roomType);
		modelMap.addAttribute("amenities", amenities);
		modelMap.addAttribute("searchResult", searchResult);
		
		
		// user의 세션이 있다면 위시리스트 목록을 modelMap으로 보내기
		if(session.getAttribute("userInfo") != null) {
			Map<String, Object> wishListParam = new HashMap<String, Object>();
			wishListParam.put("userId", ((Map<String, Object>) session.getAttribute("userInfo")).get("userId"));
			// log.info("user의 위시리스트={}", wishListService.select(wishListParam).toString());
			modelMap.addAttribute("userWishRoom", wishListService.select(wishListParam));
		}

		log.info("검색결과" + searchResult);
		return "/room/roomList";
	}
}
