package com.alpha.aoom.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.service.UserService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/user")
@Controller
public class UserController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/myPage")
	public String userPage(@RequestParam Map<String, Object> param) {
		
		return "/user/myPage";
	}
	
	@RequestMapping("/userInfo")
	public String userInfo(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		
		Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
		modelMap.addAttribute("userInfo", userInfo);
		
		return "/user/userInfo";
	}
	
	// 개인정보 수정시 현재 비밀번호 확인
	@RequestMapping("/userInfo/ajaxEditPwCheck")
	@ResponseBody
	public Map<String, Object> ajaxEditPwCheck(@RequestParam Map<String, Object> param) {
		log.info("개인정보 수정 비밀번호 확인 param={}", param.toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		Map<String, Object> userInfo = (Map<String, Object>) userService.signinUser(param).get("userInfo");
		// 해당 id, pw가 맞으멵 개인정보 반환 및 model에 추가
		model.put("userInfo", userInfo);
		
		if(userInfo != null) {
			return getSuccessResult(model);
		} else {
			return getFailResult(model, "현재 비밀번호를 다시 입력해주세요!");
		}
	}
	
	// 개인정보 수정하기
	@RequestMapping("/userInfo/edit")
	public String edit(@RequestParam Map<String, Object> param) {
		log.info("개인정보 수정 param={}", param.toString());
		return "redirect:/user/userInfo";
	}
}
