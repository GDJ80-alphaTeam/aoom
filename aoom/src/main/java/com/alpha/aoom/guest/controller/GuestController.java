package com.alpha.aoom.guest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.booking.service.BookingService;
import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.profile.service.ProfileService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.roomPayment.service.RoomPaymentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/guest")
@Controller
public class GuestController {
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	RoomPaymentService roomPaymentService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ProfileService profileService;
	
	// param: currentPage
	// 사용자가 예약한 목록 출력
	@RequestMapping("/bookList")
	public String guestBookList (@RequestParam Map<String, Object> param , HttpSession session , ModelMap modelMap ) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		param.put("userId", userId);
		
		int currentPage = (String)param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ; 
		param.put("currentPage", currentPage);
		log.info("북리스트 출력값"+bookingService.selectListByGuestId(param));
		modelMap.addAttribute("bookingList", bookingService.selectListByGuestId(param));
		modelMap.addAttribute("pagingInfo",bookingService.selectByTotalCnt(param));
		modelMap.addAttribute("currentPage", currentPage);
		
		return "/guest/bookList2";
	}
	
	// param : roomId 
	// 게스트 예약상세보기
	@RequestMapping("/bookInfo")
	public String guestBookInfo(@RequestParam Map<String, Object> param , HttpSession session , ModelMap modelMap) {
		
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		param.put("userId", userInfo.get("userId").toString());
		// 세션에 있는 아이디값과 예약넘버를 비교해서 일치하지않으면 메인으로 내보냄
		if(bookingService.selectByInvalidAccess(param) == 0) {
			return "redirect:/main";
		}
		int currentPage = 1;
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		param.put("userId", userId);
		param.put("currentPage" , currentPage);
		
		Map<String, Object> hostParam = new HashMap<>();
		hostParam.put("roomId", (String) bookingService.selectListByGuestId(param).get(0).get("roomId"));
		
		// 숙소정보 조회 + 숙소 주인정보 
		Map<String, Object> roomInfo = roomService.selectOne(hostParam);
		// 숙소 호스트가 받은 총합 후기수
		Map<String, Object> hostReviewTotal = reviewService.selectByHostTotalCnt(hostParam);
		// 호스트 유저 프로필검색
		List<Map<String, Object>> hostProfile = profileService.selectListByuserId(hostParam);
		
		modelMap.put("roomInfo", roomInfo);
		modelMap.put("hostReview", hostReviewTotal);
		modelMap.put("hostProfile", hostProfile);
		// 예약정보
		modelMap.put("bookingInfo", bookingService.selectListByGuestId(param).get(0));
		// 결제정보 
		modelMap.put("paymentInfo", roomPaymentService.selectByBookingId(param));	
		
		return "/guest/bookInfo";
	}
	
}
