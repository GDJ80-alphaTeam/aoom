package com.alpha.aoom.booking.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.booking.service.BookingService;
import com.alpha.aoom.cancelRefund.service.CancelRefundService;
import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.roomPayment.service.RoomPaymentService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/booking")
@Controller
public class BookingController extends BaseController {

	@Autowired
	RoomService roomService;
	
	@Autowired
	OnedayPriceService onedayPriceService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	RoomPaymentService roomPaymentService;
	
	@Autowired
	CancelRefundService cancelRefundService;
	
	// 예약하기
	@RequestMapping("/book")
	public String booking(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		// 체크인, 체크아웃, 숙박인원 값
		String roomId = (String)param.get("roomId");
		String startDate = (String)param.get("startDate");
		String endDate = (String)param.get("endDate");
		String usePeople = (String)param.get("usePeople");
		String bookingDate = startDate+" ~ "+endDate;
		
		// 카테고리 이름 조회
		Map<String, Object> roomInfo = roomService.selectByCategoryName(param);
		// 숙소의 평점과 후기의 갯수 조회
		Map<String, Object> ratingReview = reviewService.selectByRatingAvgReviewCnt(param);
		// 숙박일정에 따른 숙박가격 조회
		Map<String, Object> bookingPrice = onedayPriceService.selectByBookingDate(param);
		// 숙박일정에 따른 숙박가격 세부조회(일자별 가격)
		List<Map<String, Object>> bookingPriceDetail = onedayPriceService.selectByBookingDateDetail(param);
		
		// modelMap에 데이터 추가
		modelMap.addAttribute("roomId", roomId);
		modelMap.addAttribute("startDate", startDate);
		modelMap.addAttribute("endDate", endDate);
		modelMap.addAttribute("usePeople", usePeople);
		modelMap.addAttribute("bookingDate", bookingDate);
		modelMap.addAttribute("roomInfo", roomInfo);
		modelMap.addAttribute("ratingReview", ratingReview);
		modelMap.addAttribute("bookingPrice", bookingPrice);
		modelMap.addAttribute("bookingPriceDetail", bookingPriceDetail);
		modelMap.addAttribute("maxPeople", roomInfo.get("maxPeople"));
		modelMap.addAttribute("bank", codeService.selectByGroupKey("bank"));
		modelMap.addAttribute("card", codeService.selectByGroupKey("card"));
		
		return "/booking/book";
	}
	
	// 예약하기 버튼 클릭 ajax
	// param : startDate, endDate, roomId, usePeople, cardNo, refundAccount, paymentPrice
	@RequestMapping("/ajaxBook")
	@ResponseBody
	public Map<String, Object> ajaxBook(@RequestParam Map<String, Object> param, HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>(); // ajax 결과 담을 맵
		
	    // 세션에서 userInfo를 가져옴 -> userInfo에서 userId를 추출
	    Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
	    String userId = (String) userInfo.get("userId");
	    
	    // param에 userId 넣기
	    param.put("userId", userId);
	    
	    // 예약하기
	    int booking = bookingService.booking(param);
	    
		model.put("data", param.get("bookingId"));
	    
	    if(booking == 1) {
	    	return getSuccessResult(model,"예약 성공");
	    }else {
	    	return getFailResult(model,"예약 실패");
	    }
	}
	 
	// 예약취소 페이지
	@RequestMapping("/bookingCancel")
	public String bookingCancel(@RequestParam Map<String, Object> param , HttpSession session , ModelMap modelMap) {
		
		// 세션값 호출
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		param.put("userId", userInfo.get("userId").toString());
		
		// 세션에 있는 아이디값과 예약넘버를 비교해서 일치하지않으면 메인으로 내보냄
		if(bookingService.selectByInvalidAccess(param) == 0) {
			return "redirect:/main";
		}
		
		codeService.selectByGroupKey("cancelrea");
		
		// 페이징을 하지않아도 같은 쿼리를 사용해서 넣어줘야함
		int currentPage = 1;
		param.put("currentPage", currentPage);
		
		// 결제 상세정보
		modelMap.addAttribute("paymentInfo", roomPaymentService.selectByBookingId(param));
		// 예약 상세정보
		modelMap.addAttribute("bookingInfo" , bookingService.selectListByGuestId(param).get(0));
		// 취소 카테고리
		modelMap.addAttribute("cancelInfo" , codeService.selectByGroupKey("cancelrea"));
		
		
		return "/booking/bookingCancel";
	}
	
	// 예약취소 이벤트	
	// param : bookingId , refundPrice , cancelreaCode , cancelContent 
	@RequestMapping("/bookingCancelEvent")
	public String dobookingCancel(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		log.info("마파람"+param);
		int result = cancelRefundService.insert(param);
		
		if(result != 1) {
			log.info("실패"+"");
			return "redirect:/booking/bookList";
		} 
		
		return "hi";
	
	}
}