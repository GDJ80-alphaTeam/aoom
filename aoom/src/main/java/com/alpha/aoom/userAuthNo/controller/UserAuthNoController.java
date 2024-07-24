package com.alpha.aoom.userAuthNo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.userAuthNo.service.UserAuthNoService;
import com.alpha.aoom.util.BaseController;

@Controller
@RequestMapping("/userAuthNo")
public class UserAuthNoController extends BaseController {
	
	@Autowired
	private UserAuthNoService userAuthNoService;
	
	// 이메일 인증번호 전송
	// paramMap : userId  
	@RequestMapping("/ajaxSend")
	@ResponseBody
	public Map<String, Object> send(@RequestParam Map<String, Object> param) {
		Map<String, Object> model = new HashMap<String, Object>(); // ajax 결과 담을 맵
	    
		// 인증번호 보내기
		String result = userAuthNoService.sendAuthNo(param);
		
		// 결과에 따른 ajax 결과 분기
	    if(result.equals("success")) {
	    	return getSuccessResult(model,"인증번호를 전송하였습니다.");
	    }else {
	    	return getFailResult(model,"중복된 이메일 입니다.");
	    }
	}
	
	// 인증번호 확인
	// paramMap : userId , authNo
	@ResponseBody
	@RequestMapping("/ajaxAuthCheck")
	public Map<String, Object> authCheck(@RequestParam Map<String, Object> param) {
		Map<String, Object> model = new HashMap<String, Object>(); // ajax 결과 담을 맵
		
		// 인증번호 일치여부 확인
		int result = userAuthNoService.select(param);
		
		// 인증번호 일치 분기문
		if(result == 1) { // 인증번호 일치
			return getSuccessResult(model,"인증번호가 일치합니다.");
		}else { // 인증번호 불일치
			return getFailResult(model,"인증번호가 일치하지 않습니다.");
		}
	}
}