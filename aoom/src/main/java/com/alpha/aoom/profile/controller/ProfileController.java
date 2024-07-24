package com.alpha.aoom.profile.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.profile.service.ProfileService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.user.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProfileController {

	@Autowired
	ProfileService profileService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	UserService userService;
	
	// 유저 프로필
	@RequestMapping("/user/profile")
	public String Userprofile(@RequestParam Map<String, Object> param , HttpSession session , ModelMap modelMap) {

		// 세션에서 user정보 가져오기  
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		log.info("profile"+profileService.select(param));
		log.info("subPeriod"+userService.selectBySubPeriod(param));
		
		modelMap.put("subPeriod", userService.selectBySubPeriod(param));
		modelMap.put("hostReviewInfo", reviewService.selectByHostTotalCnt(param));
		modelMap.put("profile", profileService.select(param));
		
		
		
		return "/user/profile";
	}
	
}
