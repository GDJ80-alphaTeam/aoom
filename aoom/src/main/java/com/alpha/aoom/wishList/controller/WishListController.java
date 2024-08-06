package com.alpha.aoom.wishList.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.util.BaseController;
import com.alpha.aoom.wishList.service.WishListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WishListController extends BaseController {

	@Autowired
	WishListService wishListService;
	
	// 위시리스트 추가 및 삭제
	@RequestMapping("/ajaxWishList")
	@ResponseBody
	public Map<String, Object> ajaxWishList(@RequestParam Map<String, Object> param) {
		log.info("위시리스트 추가삭제 param={}", param.toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		log.info(wishListService.select(param).toString());
		// 위시리스트에 해당 숙소가 존재하는지 분기
		if(!wishListService.select(param).isEmpty()) { // 존재하면 삭제
			
			int row = wishListService.delete(param);
			
			if(row != 0) {
				return getSuccessResult(model, "위시리스트에서 삭제되었습니다!");
			} else {
				return getFailResult(model);
			}
		} else { // 존재하지않으면 위시리스트에 추가
			
			int row = wishListService.insert(param);
			
			if(row != 0) {
				return getSuccessResult(model, "위시리스트에 추가되었습니다!");
			} else {
				return getFailResult(model);
			}
		}
	}
}
