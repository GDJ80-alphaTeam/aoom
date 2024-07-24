package com.alpha.aoom.booking.service;

import java.text.NumberFormat;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alpha.aoom.bookingOnedayPrice.service.BookingOnedayPriceMapper;
import com.alpha.aoom.onedayPrice.service.OnedayPriceMapper;
import com.alpha.aoom.roomPayment.service.RoomPaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookingService {

	@Autowired
	BookingMapper bookingMapper;
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	@Autowired
	BookingOnedayPriceMapper bookingOnedayPriceMapper;
	
	@Autowired
	RoomPaymentMapper roomPaymentMapper;
	
	final private int rowPerPage = 5 ;
		
	// 사용자의 예약목록 출력
	public List<Map<String, Object>> selectByUserId(Map<String, Object> param){
		
		int beginRow = ((int)param.get("currentPage") - 1) * rowPerPage;
		int endRow = beginRow + rowPerPage;
		
		param.put("beginRow", beginRow);
		param.put("endRow", endRow);
		
		return bookingMapper.selectByUserId(param);
		
	}
	
	// 예약 페이징 정보 
	public Map<String, Object> selectByTotalCnt(Map<String, Object> param){
		
		Map<String, Object> pagingInfo = new HashMap<>();
		int totalRow = bookingMapper.selectByTotalCnt(param);
		
		int lastPage = totalRow / rowPerPage ;
		
		if(totalRow % rowPerPage != 0) {
			lastPage += 1; 
		}
		
		pagingInfo.put("totalRow", totalRow);
		pagingInfo.put("lastPage", lastPage);
		
		return pagingInfo;
	}
	
	// 예약 하기
	@Transactional
	public int booking(Map<String, Object> param) {
		
		// booking 테이블 insert(예약건 추가)
		bookingMapper.insert(param);
		
		// oneday_price 테이블 update(상태 예약불가로 업데이트, 남은 인원 감소)
		onedayPriceMapper.updateByStatUsePeople(param);
		
		// booking_oneday_price_map 테이블 insert (맵테이블 추가)
		List<Map<String, Object>> oneDayPriceList = 
				onedayPriceMapper.selectListByDuringDate(param); // 숙박일정에 따른 가격 조회
		for(Map<String,Object> map : oneDayPriceList) {
			map.put("bookingId", param.get("bookingId").toString()); // bookingInsert할때 selectKey태그에서 param에 roomId를 넣었었음.
			bookingOnedayPriceMapper.insert(map); // 매 반복문에 insrt코드 호출하여 한행, 한행 insert될 수 있게
		}
		
		// payment 테이블 insert (결제 정보 추가)
		String paymentPriceStr = (String) param.get("paymentPrice"); // paymentPrice값을 순수 숫자로 바꾸기
		try {
			NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
			Number paymentPriceNum = numberFormat.parse(paymentPriceStr.trim());
			param.put("paymentPrice", paymentPriceNum);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		roomPaymentMapper.insert(param);
		
		return 1;
	}
	
	// param : bookingId , bookstatCode
	// 예약 상태 변경 
	public int updateBookingStat(Map<String, Object> param) {
		return bookingMapper.updateBookingStat(param);
	}
	
	// 접근방식에 대한 유효성 검사
	public int selectByInvalidAccess(Map<String, Object> param) {
		return bookingMapper.selectByInvalidAccess(param);
	}
}
