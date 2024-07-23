package com.alpha.aoom.review.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.booking.service.BookingService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMethod;


@Slf4j
@RequestMapping("/review")
@Controller
public class ReviewController extends BaseController{
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	BookingService bookingService;
	
	// 숙소리뷰 페이징 ajax
	// param : roomId , currentPage
	@ResponseBody
	@RequestMapping("/ajaxReviewPaging")
	public Map<String, Object> roomReviewPaging(@RequestParam Map<String, Object> param) {
				
		Map<String, Object> model = new HashMap<String, Object>();
		
		Map<String, Object> reviewList = reviewService.selectList(param);
		
		model.put("data", reviewList);
		// currentPage는 항상들어가기때문에 reviewList로 체크 
		if(reviewList.get("review") != null) {
			System.out.println(getSuccessResult(model));
			return getSuccessResult(model);
		} else {
			return getFailResult(model);
		}
				
	}

	// param : rating , bookingId, roomId , reviewContent
	@RequestMapping("/insert")
	public String insertReview(@RequestParam Map<String, Object> param
			 				  ,@RequestParam Map<String, MultipartFile> image , HttpSession session) {
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		param.put("userId", userInfo.get("userId").toString());
		param.put("reviewImage", image.get("reviewImage"));
		log.info("param"+param);
		if(image.isEmpty()) {
			reviewService.insert(param);
		} else {
			reviewService.insertContent(param);
		}
		param.put("bookstatCode", "bst04");
		bookingService.updateBookingStat(param);
		return "redirect:/room/roomInfo?roomId="+param.get("roomId").toString();
	}
	
}
