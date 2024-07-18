package com.alpha.aoom.review.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.util.BaseController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/review")
@Controller
public class ReviewController extends BaseController{
	
	@Autowired
	ReviewService reviewService;
	
	
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
}
