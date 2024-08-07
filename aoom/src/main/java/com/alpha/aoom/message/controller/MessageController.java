package com.alpha.aoom.message.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.message.service.MessageService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/message")
@Slf4j
public class MessageController extends BaseController {
	
	
	  @Autowired 
	  MessageService messageService;
	 
	
		        // 메시지 호출
				@RequestMapping("/messageList")
				public String messageList(HttpSession session, ModelMap modelMap) {
					Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
					String userId = userInfo.get("userId").toString();
					System.out.println("userId " + userId);
					List<Map<String, Object>> selectList = messageService.selectList(userInfo);
					modelMap.addAttribute("selectList",selectList);
					modelMap.addAttribute("userInfo",userInfo);
					
					
					return "/user/message";
				}
				
				 // 특정유저 메시지 전체리스트 호출 ajax
				@RequestMapping("/ajaxMessageUserList")
				@ResponseBody
				public Map<String, Object> ajaxMessageUserList(@RequestParam Map<String, Object> param, HttpSession session) {
					ModelMap model = new ModelMap();
					List<Map<String, Object>> selectUserList = messageService.selectUserList(param);
					model.addAttribute("selectUserList", selectUserList);
					
					if(selectUserList != null) {
						return getSuccessResult(model, "리스트를 정상적으로 불러왔습니다.");
					}else {
						return getFailResult(model, "리스트를 가져오는데 실패하였습니다. 다시 시도해 주세요");
					}
	
				}
				
				 // 메시지 입력
				@RequestMapping("/ajaxMessageInsert")
				@ResponseBody
				public Map<String, Object> ajaxMessageInsert(@RequestParam Map<String, Object> param, HttpSession session) {
					System.out.println("메시지 param=" + param.toString());
					ModelMap model = new ModelMap();
					int row = messageService.insert(param);
					
					if(row == 1) {
						return getSuccessResult(model, "메시지를 전송했습니다");
					}else {
						return getFailResult(model, "메시지 전송에 실패했습니다. 다시 시도해주세요");
					}
				}	
}
