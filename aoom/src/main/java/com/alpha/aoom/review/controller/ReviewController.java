package com.alpha.aoom.review.controller;

import java.util.List;
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
	public List<Map<String, Object>> roomReviewPaging(@RequestParam Map<String, Object> param) {
				
		//log.info("parameter"+param);
		return reviewService.selectList(param);
	}
}
