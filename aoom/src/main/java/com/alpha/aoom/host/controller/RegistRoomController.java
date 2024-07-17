package com.alpha.aoom.host.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.room.service.RoomService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host")
public class RegistRoomController {

	@Autowired
	RoomService roomService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	OnedayPriceService onedayPriceService;
	
	// 숙소 등록 - 숙소 초기화 및 숙소 등록 1단계 페이지로 이동
	@RequestMapping(value = "/roomManage/setupRoom", method = RequestMethod.POST)
	public String setupRoom(HttpSession session) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = (String)userInfo.get("userId");
		
		// 숙소 등록 - 숙소 초기화 
		// setupRoomInfo : roomId, userId
		Map<String, Object> setupRoomInfo = roomService.setupRoom(userId);
		if(setupRoomInfo.get("roomId") == null) {
			return "redirect:/host/roomManage";
		}
		
		return "redirect:/host/roomManage/registRoom/basicInfo?roomId=" + setupRoomInfo.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 1단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/basicInfo")
	public String basicInfoView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// 숙소 category 목록
		List<Map<String, Object>> roomcate = codeService.selectByGroupKey("roomcate");
		log.info("roomcate={}", roomcate);
		
		// roomtype 목록
		List<Map<String, Object>> roomtype = codeService.selectByGroupKey("roomtype");
		log.info("roomtype={}", roomtype);
		
		// modelMap에 숙소 category, roomtype 목록 추가
		modelMap.put("roomcate", roomcate);
		modelMap.put("roomtype", roomtype);
		
		return "/host/regist/basicInfo";
	}
	
	// 숙소 등록 - 숙소 등록 1단계 정보 DB 입력 및 숙소 등록 2단계 페이지 이동
	@RequestMapping("/roomManage/registRoom/registBasicInfo")
	public String registRoomBasicInfo(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("param={}", param);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// 1단계 정보 없데이트
		roomService.update(param);
		
		return "redirect:/host/roomManage/registRoom/detailInfo?roomId=" + param.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 2단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/detailInfo")
	public String detailInfoView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// amenities 목록
		List<Map<String, Object>> amenities = codeService.selectByGroupKey("amenities");
		log.info("amenities={}", amenities);
		
		// modelMap에 amenities 목록 추가
		modelMap.put("amenities", amenities);
		
		return "/host/regist/detailInfo";
	}
	
	// 편의시설 - checkbox 다중 값 선택시 배열로 넘어오기 때문에 @RequsetParam 따로 설정
	// 숙소 등록 - 숙소 등록 2단계 정보 DB 입력 및 숙소 등록 3단계 페이지 이동
	@RequestMapping("/roomManage/registRoom/registDetailInfo")
	public String registRoomDetailInfo(@RequestParam Map<String, Object> param, 
									   @RequestParam("mainImage") MultipartFile mainImage,
									   @RequestParam("images") MultipartFile[] images,
									   ModelMap modelMap) {
		log.info("param={}", param);
		
		// param에 담겨있는 amenities가 문자열이기 때문에 List로 파싱
        String amenitiesStr = (String) param.get("amenities");
        List<String> amenities = Arrays.asList(amenitiesStr.split(","));
		
		// param에 amenities값(리스트), mainImage, images 추가
		param.put("amenities", amenities);
		
		log.info("param={}", param);
		
		// 입력한 정보 DB에 INSERT, UPDATE 및 이미지 저장
		roomService.update(param, mainImage, images);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		return "redirect:/host/roomManage/registRoom/paymentInfo?roomId=" + param.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 3단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/paymentInfo")
	public String paymentInfoView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// refundme 목록
		List<Map<String, Object>> refundme = codeService.selectByGroupKey("refundme");
		log.info("refundme={}", refundme);
		
		// modelMap에 refundme 추가
		modelMap.put("refundme", refundme);
		
		// bank 목록
		List<Map<String, Object>> bank = codeService.selectByGroupKey("bank");
		log.info("bank={}", bank);
		
		// modelMap에 bank 추가
		modelMap.put("bank", bank);
		
		
		return "/host/regist/paymentInfo";
	}
	
	// 숙소 등록 - 숙소 등록 3단계 정보 DB 입력 및 숙소 등록 전 미리보기 페이지 이동
	@RequestMapping("/roomManage/registRoom/registPaymentInfo")
	public String registPaymentInfo(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("param={}", param);
		
		// 3단계 정보 없데이트
		roomService.update(param);
		
		// 하루 숙박 가격 등록을 위해 시작일, 종료일, 최대 수용 인원 가져와서 param에 추가
		param.put("startDate", roomService.selectOne(param).get("startDate"));
		param.put("endDate", roomService.selectOne(param).get("endDate"));
		param.put("maxPeople", roomService.selectOne(param).get("maxPeople"));
		
		// 하루숙박 가격 DB에 추가
		onedayPriceService.insert(param);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		return "redirect:/host/roomManage/registRoom/preview?roomId=" + param.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 미리보기 페이지
	@RequestMapping("/roomManage/registRoom/preview")
	public String previewView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("param={}", param);
		
		return "/host/regist/preview";
	}
}
