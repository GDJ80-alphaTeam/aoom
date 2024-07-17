package com.alpha.aoom.onedayPrice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OnedayPriceService {
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	public List<Map<String, Object>> selectByDisabled (Map<String, Object> param) {
		
		return onedayPriceMapper.selectByDisabled(param);
	}
	
}
