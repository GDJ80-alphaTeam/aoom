package com.alpha.aoom.profile.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.profile.service.ProfileService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.user.service.UserService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProfileController extends BaseController{

	@Autowired
	ProfileService profileService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CodeService codeService;
	
	// 유저 프로필
	@RequestMapping("/user/profile")
	public String Userprofile(@RequestParam Map<String, Object> param , ModelMap modelMap ) {

		List<Map<String, Object>> profileList = profileService.selectListByuserId(param);
		String profileContent = null;
		
		// 역방향으로 인덱스를 사용하여 항목 삭제
		// 정방향으로 하면 삭제후 인덱스가 생략될수있음 
        for (int i = profileList.size() - 1; i >= 0; i--) {
            Map<String, Object> list = profileList.get(i);

            // 문자열 비교 시 equals() 사용
            if ("pfi09".equals(list.get("codeKey"))) {
                System.out.println("test");
                profileContent = (String) list.get("content");
                profileList.remove(i); 
            }
        }
        // 받은 총리뷰목록
		modelMap.put("reviewList", reviewService.selectListByProfile(param));
		// 가입기간
		modelMap.put("subPeriod", userService.selectBySubPeriod(param));
		// 리뷰를 받은 총 개수
		modelMap.put("hostReviewInfo", reviewService.selectByHostTotalCnt(param));
		// 해당 유저의 정보
		modelMap.put("userInfo", userService.selectByUserId(param));
		// 프로필 내용 콘텐츠
		modelMap.put("profileContent", profileContent);
		// 소개글을 제외한 해당유저의 프로필정보
		modelMap.put("profile", profileList);
		// 페이징 정보
		modelMap.put("reviewPagingInfo", reviewService.selectByProfileCnt(param));
		
		
		return "/user/profile2";
	}
	
	
	@RequestMapping("/user/profileUpdate")
	public String profileUpdate(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		// 모든 프로필목록 출력
		List<Map<String, Object>> profileList = codeService.selectByGroupKey("proitem");
		
		// content 
		Map<String, Object> introduceContent = null;
		
		// 프로필목록에서 소개글 제외
        for (int i = profileList.size() - 1; i >= 0; i--) {
            Map<String, Object> list = profileList.get(i);
            
            // 문자열 비교 시 equals() 사용
            if ("pfi09".equals(list.get("codeKey"))) {
            	introduceContent = profileList.get(i);
                profileList.remove(i); 
            }
        }
        System.out.println(introduceContent);
        // 
        System.out.println(profileService.selectListByuserId(param));
        // 해당유저가 보유한 프로필정보
        modelMap.put("profile", profileService.selectListByuserId(param));
        // 해당 유저의 정보
 		modelMap.put("userInfo", userService.selectByUserId(param));
        // 프로필 내용 콘텐츠
 		//modelMap.put("profileContent", codeService.selectByCodeKey(param));
 		modelMap.put("introduceContent", introduceContent);
 		// 소개글을 제외한 해당유저의 프로필정보
		modelMap.put("profileList", profileList);
 		
		return "/user/profileUpdate2";
	}
	
	// 프로필 수정시 보여줄 내용 호출
	@ResponseBody
	@RequestMapping("/user/ajaxProfileInfo")
	public Map<String, Object> profileContent(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		log.info("param"+param);
		
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> updateContent = new HashMap<String, Object>();
		
		// 사용자가 해당 프로필카테고리의 내용이 없을경우 null 
		if(profileService.selectListByuserId(param).isEmpty()) {
			// 제목 + 설명 반환 
			updateContent = null;
			model.put("data", codeService.selectByCodeKey(param));
			
		} else {
			// 본인이 작성한 내용 + 제목 + 설명
			updateContent = profileService.selectListByuserId(param).get(0);
			model.put("data",updateContent);
		}
		
		
		
		if(updateContent != null) {
			return getSuccessResult(model);
		} else {
			return getFailResult(model);
		}
		
	}
	
	// 프로필 업데이트 ajax 
	@RequestMapping("/user/ajaxProfileUpdate")
	@ResponseBody
	public Map<String, Object> profileUpdate(@RequestParam Map<String, Object> param){
		
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			System.out.println(param+"profileUpdate param");
			//System.out.println(((BigDecimal)profileService.selectByproitemCode(param).get("cnt")).compareTo(BigDecimal.ZERO) != 0);
			
			// 널이 아니면 프로필이 존재하므로 업데이트 , null이나오면 프로필이 없으므로 인서트 
			if(profileService.selectByproitemCode(param) != null) {
				profileService.updateByProitemCode(param);
			} else {
				System.out.println("결과가없을때");
				profileService.insertProfile(param);
			}
			
			// 업데이트한 정보 내보내기
			
			Map<String, Object> mergeMap = new HashMap<>();
			mergeMap.put("code", codeService.selectByCodeKey(param));
			mergeMap.put("profile", profileService.selectByproitemCode(param));
				
			model.put("data", mergeMap);
			return getSuccessResult(model);	
			
		} catch (Exception e) {
			return getFailResult(model);	
		}	
			
		
	}
}
