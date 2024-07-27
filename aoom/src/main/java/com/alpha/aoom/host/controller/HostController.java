package com.alpha.aoom.host.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.booking.service.BookingService;
import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host")
public class HostController extends BaseController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	OnedayPriceService onedayPriceService;
	
	@Autowired
	BookingService bookingService;

	@Autowired
	CodeService codeService;
	// 호스트 모드 메인화면 호출
	@RequestMapping("/main")
	public String main(HttpSession session, ModelMap modelMap) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		log.info("userInfo={}", userInfo);
		
		modelMap.addAttribute("userInfo", userInfo);
		
		return "/host/main";
	}
	
	// 호스트 모드 숙소 관리 화면 호출
	@RequestMapping("/roomManage")
	public String roomManage(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		param.put("userId", userId);
		
		// currentPage가 param에 가지고있으면 param값 , 없으면 1
		int currentPage = (String)param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ; 
		param.put("currentPage", currentPage);
		
		// userId로 호스팅중인 숙소 목록 가져오기
		List<Map<String, Object>> roomListByUser = (List<Map<String, Object>>) roomService.selectByUserId(param);
		
		// ModelMap에 담아 view로 넘겨주기
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("pagingInfo", roomService.selectByTotalCnt(param));
		modelMap.addAttribute("roomListByUser", roomListByUser);		
		
		return "/host/roomManage";
	}
	
	// 숙소 삭제 - 숙소 상태(roomstat_code)를 삭제(rst05)로 변경
	@ResponseBody
	@RequestMapping("/roomManage/ajaxDeleteRoom")
	public Map<String, Object> ajaxDeleteRoom(@RequestParam Map<String, Object> param) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		log.info("param={}", param);
		
		// 숙소의 상태 변경(rst05 - 삭제)
		int row = roomService.update(param);
		
		// 숙소 상태 변경(rst05 - 삭제) 성공 시 
		if(row == 1) {
			log.info(getSuccessResult(model).toString());
			return getSuccessResult(model);
		} else { // 숙소 상태 변경(rst05 - 삭제) 실패 시
			return getFailResult(model);
		}
	}
	
	// 달력 - 하루 숙박 가격 설정 페이지
	@RequestMapping("/calendar")
	public String calendar(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		log.info("selectedRoomId={}", param.toString());
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		log.info("userInfo={}", userInfo);
		
		// onedayPrice의 상태 변경을 위해 onestatCode 불러와서 model에 추가하기
		List<Map<String, Object>> onestatCodeList = codeService.selectByGroupKey("onestat");
		log.info("onestatCodeList={}", onestatCodeList);
		modelMap.addAttribute("onestatCodeList", onestatCodeList);
		
		// 활성화 중인 숙소만 가져오도록 설정
		modelMap.addAttribute("roomList", roomService.selectByUserId(userInfo));
		modelMap.addAttribute("selectedRoomId", param.get("roomId"));
	
		return "/host/calendar";
	}
	
	// 달력 - 해당하는 숙소의 onedayPrice, 운영기간 가져오기
	@RequestMapping("/calendar/ajaxSelectOnedayPrice")
	@ResponseBody
	public Map<String, Object> ajaxSelectOnedayPrice(@RequestParam Map<String, Object> param) { 
		
		log.info("param={}", param);
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("onedayData", onedayPriceService.select(param));
		model.put("roomData", roomService.selectOne(param));
		log.info(model.toString());
		
		if(!model.isEmpty()) {
			log.info(getSuccessResult(model).toString());
			return getSuccessResult(model);
		} else {
			return getFailResult(model);
		}
	}
	
	// 달력 - 숙소 기본요금 수정
	@RequestMapping("/calendar/updateDefaultPrice")
	public String updateDefaultPrice(@RequestParam Map<String, Object> param) {
		log.info("기본요금 수정 param={}", param.toString());
		
		if(param.get("startDate") == null && param.get("endDate") == null) {
			// room 테이블의 defaultPrice 수정
			roomService.update(param);
		}
		
		// oneday_price 테이블의 onedayPrice 수정
		onedayPriceService.updateOnedayPrice(param);
		log.info("하루숙박 가격 수정 완료");
		
		return "redirect:/host/calendar?roomId=" + param.get("roomId").toString();
	}

	@RequestMapping("/bookList")
	public String bookList(@RequestParam Map<String, Object> param,  HttpSession session, ModelMap modelMap){
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		// 세션에서 가져온 userId를 바로 param에 넣기. 이름을 hostId로 넣기.(쿼리문에 들어갈 userId 혼용방지)
		param.put("hostId", ((Map<String, String>) session.getAttribute("userInfo")).get("userId"));
		
		// 페이징 처리
		int currentPage = param.get("currentPage") == null ? 1 : Integer.parseInt((String) param.get("currentPage")); // 현재페이지 정보 없으면 1 있으면 있는 그 값 가져오기
		int rowPerPage = 5; // 한 페이지에 넣을 행의 수
		int beginRow = (currentPage - 1) * rowPerPage; // 현재 페이지에서 시작할 행의 rowNum 번호(행번호)
		param.put("rowPerPage", rowPerPage);
		param.put("beginRow", beginRow);
		
		System.out.println("현재페이지(currentPage) : " + currentPage);
		System.out.println("시작행(beginRow) : " + beginRow);
		System.out.println("페이지당 행갯수(rowPerPage) : " + rowPerPage);
		
		// 로그인 유저의 호스팅한 숙소의 예약 목록
		List<Map<String, Object>> bookingList = bookingService.selectListByUserId(param);
		
		System.out.println("목록(bookingList) : " + bookingList);
		
		// 로그인 유저의 호스팅한 숙소의 예약 목록의 행갯수
		int totalRows = bookingService.selectListByUserIdCnt(param);
		// 마지막페이지 구하기
		int lastPage = (int) Math.ceil((double) totalRows / rowPerPage);
		
		// modelMap에 넣기
		modelMap.addAttribute("roomList", roomService.selectByUserId(userInfo)); // 활성화 중인 숙소만 가져오도록 설정(셀렉트 태그 반복문 용도)
		modelMap.addAttribute("selectRoom", param.get("selectRoom")); // 선택된 숙소가 셀렉트창에 보이게 설정
		modelMap.addAttribute("bookingList", bookingList); // 내 숙소 예약한 게스트들 목록
		modelMap.addAttribute("startDate", param.get("startDate")); // 내 숙소 예약한 게스트들 목록
		modelMap.addAttribute("endDate", param.get("endDate")); // 내 숙소 예약한 게스트들 목록
		modelMap.addAttribute("bookStat", param.get("bookStat")); // 내 숙소 예약한 게스트들 목록
		modelMap.addAttribute("currentPage", currentPage); // 현재페이지
		modelMap.addAttribute("lastPage", lastPage); // 마지막페이지
		
		return "/host/bookList";
	}
	
	// 달력 - 숙소의 oneday의 상태 변경
	@RequestMapping("/calendar/ajaxUpdateOnestatCode")
	@ResponseBody
	public Map<String, Object> ajaxUpdateOnestatCode(@RequestParam Map<String, Object> param) {
		log.info("onedayPrice 상태 변경 param={}", param);
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("data", param);
		
		int row = onedayPriceService.updateOnestatCode(param);
		
		if(row != 0) {
			log.info(getSuccessResult(model).toString());
			return getSuccessResult(model, "상태가 변경되었습니다.");
		} else {
			return getFailResult(model);
		}
	}
	
	// 호스트 예약 상세보기
	@RequestMapping("/bookList/bookInfo")
	public String bookInfo(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		modelMap.addAttribute("bookInfo", bookingService.selectByBookingId(param));
		return "/host/bookList/bookInfo";
	}
}
