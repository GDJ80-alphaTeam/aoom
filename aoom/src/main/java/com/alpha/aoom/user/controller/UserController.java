package com.alpha.aoom.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.service.UserService;
import com.alpha.aoom.util.BaseController;
import com.alpha.aoom.wishList.service.WishListService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/user")
@Controller
public class UserController extends BaseController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	WishListService wishListService;
	
	@RequestMapping("/myPage")
	public String userPage(@RequestParam Map<String, Object> param) {
		
		return "/user/myPage";
	}
	
	// 개인정보 수정전 고객 정보 확인 ajax
	@RequestMapping("/userInfo/ajaxCheckUserInfo")
	@ResponseBody
	public Map<String, Object> ajaxCheckUserInfo(@RequestParam Map<String, Object> param, HttpSession session) {
		log.info("개인정보 수정전 정보 확인 param={}", param.toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Map<String, Object> userInfo = (Map<String, Object>) userService.signinUser(param).get("userInfo");
		// 해당 id, pw가 맞으멵 개인정보 반환 및 model에 추가
		model.put("userInfo", userInfo);
		
		if(userInfo != null) {
			// session 설정하여 개인정보 수정페이지 url 직접 접근 막기
			session.setAttribute("userInfoAccess", true);
			return getSuccessResult(model);
		} else {
			return getFailResult(model, "비밀번호를 다시 입력해주세요!");
		}
	}
	
	// 고객 개인정보 출력 및 수정 페이지 호출
	@RequestMapping("/userInfo")
	public String userInfo(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		
		// 개인정보 수정 페이지 권한 세션
		Boolean editAuth = (Boolean) session.getAttribute("userInfoAccess");
		
		if(editAuth != null && editAuth) { // 권한 있을 때
			// session 제거 - 새로고침, 다른페이지에서 접근 막기
			session.removeAttribute("userInfoAccess");
			return "/user/userInfo";
		} else { // 권한 없을 때
			return "redirect:/user/myPage";
		}
	}
	
	// 고객 개인정보 수정 ajax
	@RequestMapping("/userInfo/ajaxEditUserInfo")
	@ResponseBody
	public Map<String, Object> ajaxEditUserInfo(@RequestParam Map<String, Object> param, HttpSession session) {
		log.info("개인정보 수정 param={}", param.toString());
		if(param.get("editUserPw") != null && !param.get("editUserPw").toString().equals("")) {
			param.put("userPw", param.get("editUserPw"));
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int row = userService.update(param);
		if(row != 0) {
			Map<String, Object> editedUserInfo = userService.selectByUserId(param);
			session.setAttribute("userInfo", editedUserInfo);
			return getSuccessResult(model, "고객님의 정보가 수정되었습니다!");
		} else {
			return getFailResult(model, "수정에 실패하였습니다. 다시 시도해주세요");
		}
	}
	
	// 고객 탈퇴 ajax
	@RequestMapping("/userInfo/ajaxSecessionUser")
	@ResponseBody
	public Map<String, Object> ajaxSecessionUser(@RequestParam Map<String, Object> param, HttpSession session) {
		
		// 상태를 탈퇴한 상태(ust02)로 변경하기 위해 추가
		param.put("userstatCode", "ust02");
		
		log.info("고객 탈퇴 param={}", param.toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		int row = userService.update(param);
		if(row != 0) {
			session.invalidate();
			return getSuccessResult(model, "탈퇴되었습니다. 안녕히 가세요");
		} else {
			return getFailResult(model, "탈퇴되지 않았습니다. 다시 시도해 주세요");
		}
	}
	
	// 고객의 위시리스트 페이지 호출
	@RequestMapping("/wishList")
	public String wishList(HttpSession session, ModelMap modelMap) {
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		
		List<Map<String, Object>> userWishList = wishListService.select(userInfo); 
		log.info("유저 위시 리스트 ={}", userWishList);
		
		modelMap.addAttribute("userWishList", userWishList);
		
		return "/user/wishList";
	}
}
