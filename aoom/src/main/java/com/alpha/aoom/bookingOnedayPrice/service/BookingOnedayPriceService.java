package com.alpha.aoom.bookingOnedayPrice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.aoom.onedayPrice.service.OnedayPriceMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookingOnedayPriceService {

	@Autowired
	BookingOnedayPriceMapper bookingOnedayPriceMapper;
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	
}
