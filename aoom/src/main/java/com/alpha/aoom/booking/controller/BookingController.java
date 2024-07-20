package com.alpha.aoom.booking.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/booking")
@Controller
public class BookingController {

	@RequestMapping("")
	public String booking(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		return "/book/booking";
	}
}
