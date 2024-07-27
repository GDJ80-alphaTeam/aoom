package com.alpha.aoom.profile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
		
		List<Map<String, Object>> profileList = new ArrayList<>(profileService.select(param));
		Map<String, Object> profileContent = profileList.stream()
	            .filter(map -> "pfi09".equals(map.get("codeKey")))
	            .findFirst()  // 첫 번째 요소를 찾음
	            .orElse(null);  // 요소가 없으면 null 반환
		
		// Iterator를 사용하여 요소 삭제
        Iterator<Map<String, Object>> iterator = profileList.iterator();
        while (iterator.hasNext()) {
            Map<String, Object> map = iterator.next();
            if ("pfi09".equals(map.get("codeKey"))) {
                iterator.remove();  // 조건에 맞는 요소 삭제
            }
        }
		
		// 내용이 있을때만, 모델맵에 담기
		if (profileContent != null) {
            modelMap.put("profileContent", profileContent);
        }
		
		System.out.println("프로필리뷰리스트"+reviewService.selectListByProfile(param));
		
		log.info("profile"+reviewService.selectByHostTotalCnt(param));
		modelMap.put("reviewList", reviewService.selectListByProfile(param));
		modelMap.put("subPeriod", userService.selectBySubPeriod(param));
		modelMap.put("hostReviewInfo", reviewService.selectByHostTotalCnt(param));
		modelMap.put("profile", profileList);
		modelMap.put("userInfo", userService.selectByUserId(param));
		modelMap.put("profileContent", profileContent);
		modelMap.put("reviewPagingInfo", reviewService.selectByProfileCnt(param));
		
		
		return "/user/profile";
	}
	
}
