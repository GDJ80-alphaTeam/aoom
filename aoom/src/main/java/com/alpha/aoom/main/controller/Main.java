package com.alpha.aoom.main.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Main {
	@RequestMapping("/main")
	public String main(HttpSession session) {
		
		return "main";
	}
}
