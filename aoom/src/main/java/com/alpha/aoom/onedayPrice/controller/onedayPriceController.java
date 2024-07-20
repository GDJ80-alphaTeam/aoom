package com.alpha.aoom.onedayPrice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.util.BaseController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/onedayPrice")
@Controller
public class onedayPriceController extends BaseController {
	
	@Autowired
	OnedayPriceService onedayPriceService;
	
	
	  // param : roomId	
	  // 예약가능한 날짜(달력이 열렸을때)	
	  @RequestMapping("/ajaxValidDate") 
	  @ResponseBody
	  public Map<String, Object> validDate(@RequestParam Map<String, Object> param) {
	  
		  Map<String, Object> model = new HashMap<String, Object>();
		  model.put("data", onedayPriceService.selectByStatCode(param)); 
		  
		  if( onedayPriceService.selectByStatCode(param) != null) {
			  return getSuccessResult(model);
		  } else {
			  return getFailResult(model);
		  }		  			  
	  }
	 
	  // param : selectDate
	  // 예약가능한 날짜(달력에서 날짜를 선택했을때)
	  @RequestMapping("/ajaxSelectDay")
	  @ResponseBody
	  public Map<String, Object> selectDay(@RequestParam Map<String, Object> param){
		  		 	  
		  Map<String, Object> model = new HashMap<String, Object>();
		  
		  model.put("data", onedayPriceService.selectByOneday(param));
		  
		  if( onedayPriceService.selectByOneday(param) != null) {
			  return getSuccessResult(model);
		  } else {
			  return getFailResult(model);
		  }		  			  
		  
	  } 
	
}
