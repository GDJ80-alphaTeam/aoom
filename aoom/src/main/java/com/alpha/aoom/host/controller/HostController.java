package com.alpha.aoom.host.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
	public String main(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		
		// 세션에서 user정보 가져오기 -> param에 userId넣기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		String userId = (String) userInfo.get("userId");
		param.put("userId", userId);
		System.out.println("유저아이디 : "+userId);
		System.out.println("유저 param =" + param.toString());
		// 대시보드 출력물 호출
		List<Map<String, Object>> todayContent = bookingService.selectListBySysdate(param);
		int todayContentCnt = bookingService.selectListBySysdateCnt(param);
		System.out.println(todayContent.toString());
		// 메인 today에 선택메뉴를 선택하지 않으면 오늘 체크아웃을 선택한 것처럼
		String actionType = param.get("actionType") == null ? "checkOut" : (String) param.get("actionType");
		
		
		// modelMap으로 보낼 것
		modelMap.addAttribute("userInfo", userInfo);
		modelMap.addAttribute("todayContent", todayContent);
		modelMap.addAttribute("actionType", actionType);
		modelMap.addAttribute("todayContentCnt", todayContentCnt);
		modelMap.addAttribute("monthCnt", bookingService.selectListByMonthCnt(param)); // 호스트의 월별 예약수
		modelMap.addAttribute("roomCnt", bookingService.selectListByRoomCnt(param)); // 호스트의 숙소별 예약수
		modelMap.addAttribute("roomRating", bookingService.selectListByAvgRating(param)); // 호스트의 숙소별 예약수
		modelMap.addAttribute("wishlistCnt", bookingService.selectListByWishlistCnt(param)); // 호스트의 숙소별 예약수
		
		return "/host/main2";
	}
	
	// 호스트 모드 숙소 관리 화면 호출
	@RequestMapping("/roomManage")
	public String roomManage(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		log.info("숙소관리 param={}", param.toString());
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		param.put("userId", userId);
		
		// currentPage가 param에 가지고있으면 param값 , 없으면 1
		// viewStyle 가져오기(list or thumbnail)
		int currentPage = param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ; 
		String viewType = param.get("viewType") != null ? (String)param.get("viewType") : "list";
		param.put("currentPage", currentPage);
		
		// userId로 호스팅중인 숙소 목록 가져오기
		List<Map<String, Object>> roomListByUser = (List<Map<String, Object>>) roomService.selectByUserId(param);
		
		// ModelMap에 담아 view로 넘겨주기
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("viewType", viewType);
		modelMap.addAttribute("pagingInfo", roomService.selectByTotalCnt(param));
		modelMap.addAttribute("roomListByUser", roomListByUser);
		modelMap.addAttribute("roomstatCodeList", codeService.selectByGroupKey("roomstat"));
		modelMap.addAttribute("rstCode", param.get("rstCode"));
		
		return "/host/roomManage";
	}
	
	// 숙소 삭제 - 숙소 상태(roomstat_code)를 삭제(rst05)로 변경
	@ResponseBody
	@RequestMapping("/roomManage/ajaxDeleteRoom")
	public Map<String, Object> ajaxDeleteRoom(@RequestParam Map<String, Object> param) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		param.put("selectRoom", param.get("roomId"));
		param.put("hostId", param.get("userId"));
		log.info("param={}", param);
		
		// 숙소의 상태 변경(rst05 - 삭제)
		int bookingTotalCntByHostRoom = bookingService.selectListByUserIdCnt(param);
		
		if(bookingTotalCntByHostRoom != 0) { // 숙소에 대한 예약이 있는지
			return getFailResult(model, "호스팅 중인 숙소 중 예약이 있습니다. 예약을 없앤 후 시도해주세요!");
		} else {
			int row = roomService.update(param);
			
			// 숙소 상태 변경(rst05 - 삭제) 성공 시 
			if(row == 1) {
				log.info(getSuccessResult(model).toString());
				return getSuccessResult(model, "숙소가 삭제되었습니다.");
			} else { // 숙소 상태 변경(rst05 - 삭제) 실패 시
				return getFailResult(model, "숙소가 삭제되지않았습니다. 다시 시도해주세요.");
			}
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
	@RequestMapping("/calendar/ajaxUpdateDefaultPrice")
	@ResponseBody
	public Map<String , Object> ajaxUpdateDefaultPrice(@RequestParam Map<String, Object> param) {
		log.info("기본요금 수정 param={}", param.toString());
		Map<String , Object> model = new HashMap<String, Object>();
		
		// 주말 요금 변경 
		String weekendDatesStr = (String) param.get("weekendDates");
	    List<String> weekendDates = new ArrayList<>();
	    
		if (weekendDatesStr != null && !weekendDatesStr.equals("")) {
			weekendDates = Arrays.asList(weekendDatesStr.split(","));
			param.put("weekendDates", weekendDates);
	    }

		if(param.get("startDate") == null && param.get("endDate") == null && weekendDatesStr == null) {
			// room 테이블의 defaultPrice 수정
			roomService.update(param);
		}
		
		// oneday_price 테이블의 onedayPrice 수정
		int row = onedayPriceService.updateOnedayPrice(param);
		if(row != 0) {
			log.info("하루숙박 가격 수정 완료");
			return getSuccessResult(model, "가격이 수정되었습니다.");
		} else {
			return getFailResult(model, "가격 수정에 실패했습니다. 다시시도해주세요!");
		}
//		return "redirect:/host/calendar?roomId=" + param.get("roomId").toString();
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
		
		return "/host/bookList2";
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
			return getFailResult(model, "상태 변경이 불가능합니다! 예약이 존재하는지 확인해주세요");
		}
	}
	
	// 호스트 예약 상세보기
	@RequestMapping("/bookList/bookInfo")
	public String bookInfo(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		modelMap.addAttribute("bookInfo", bookingService.selectByBookingId(param));
		return "/host/bookList/bookInfo2";
	}
	
	// 체크아웃 하기
	@RequestMapping("/ajaxCheckOut")
	@ResponseBody
	public Map<String, Object> checkOut(@RequestParam Map<String, Object> param) {
		Map<String, Object> model = new HashMap<String, Object>();
		// 체크아웃 서비스 호출
		int checkOutAction = bookingService.updateBookstat(param);
		
		if(checkOutAction == 1) {
			return getSuccessResult(model, "체크아웃 되었습니다.");
		}else {
			return getFailResult(model, "잘못된 접근입니다.");
		}
	}
}
