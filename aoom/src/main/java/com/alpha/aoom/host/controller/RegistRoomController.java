package com.alpha.aoom.host.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.amenities.service.AmenitiesService;
import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.roomImage.service.RoomImageService;
import com.alpha.aoom.util.BaseController;
import com.alpha.aoom.util.file.FolderCreation;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host")
public class RegistRoomController extends BaseController{

	@Autowired
	RoomService roomService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	OnedayPriceService onedayPriceService;
	
	@Autowired
	RoomImageService roomImageService;
	
	@Autowired
	AmenitiesService amenitiesService;
	
	@Autowired
	FolderCreation folderCreation;
	
	// 숙소 등록 - 숙소 초기화 및 숙소 등록 1단계 페이지로 이동
	@RequestMapping("/roomManage/setupRoom")
	public String setupRoom(HttpSession session) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		
		// 숙소 등록 - 숙소 초기화 
		// setupRoomInfo : roomId, userId
		Map<String, Object> setupRoomInfo = roomService.setupRoom(userId);
		if(setupRoomInfo.get("roomId") == null) {
			return "redirect:/host/roomManage";
		}
		
		return "redirect:/host/roomManage/registRoom/basicInfo?roomId=" + setupRoomInfo.get("roomId").toString();
	}
	
	// 숙소 등록 - 숙소 등록 1단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/basicInfo")
	public String basicInfoView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// 숙소 등록 시 이전에 저장됐던 값을 출력하기 위해 해당 숙소 데이터 가져오기
		Map<String, Object> roomInfo = roomService.selectOne(param);
		log.info("roomInfo={}", roomInfo);
		modelMap.put("roomInfo", roomInfo);
		
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
		
		return "redirect:/host/roomManage/registRoom/detailInfo?roomId=" + param.get("roomId").toString();
	}
	
	// 숙소 등록 - 숙소 등록 2단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/detailInfo")
	public String detailInfoView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// 숙소 등록 시 이전에 저장됐던 값을 출력하기 위해 해당 숙소, 편의시설, 사진 데이터 가져오기
		Map<String, Object> roomInfo = new HashMap<>(roomService.selectOne(param));
		List<Map<String, Object>> roomAmenities = amenitiesService.selectByDetail(param);
		List<Map<String, Object>> roomImages = roomImageService.selectByRoomId(param);
		
		roomInfo.put("roomAmenities", roomAmenities);
		roomInfo.put("roomImages", roomImages);
		
		log.info("roomInfo={}", roomInfo);
		modelMap.put("roomInfo", roomInfo);
		
		// amenities 목록
		List<Map<String, Object>> amenities = codeService.selectByGroupKey("amenities");
		log.info("amenities={}", amenities);
		
		// modelMap에 amenities 목록 추가
		modelMap.put("amenities", amenities);
		
		return "/host/regist/detailInfo";
	}
	
	// 숙소 등록 - 숙소 등록 2단계 정보 DB 입력 및 숙소 등록 3단계 페이지 이동
	@RequestMapping("/roomManage/registRoom/registDetailInfo")
	public String registRoomDetailInfo(@RequestParam Map<String, Object> param, 
									   @RequestParam Map<String, MultipartFile> images,
									   ModelMap modelMap) {
		log.info("param={}", param);
		log.info("메인 사진 입력 여부={}", !images.get("mainImage").isEmpty());
		log.info(images.toString());
	
		// param에 담겨있는 amenities가 문자열이기 때문에 List로 파싱
        String amenitiesStr = param.get("amenities").toString();
        List<String> amenities = Arrays.asList(amenitiesStr.split(","));
		
		// param에 amenities값(리스트), images 추가
		param.put("amenities", amenities);
		param.put("images", images);
		
		// 숙소 이미지 폴더 생성 체크 후 이미지 파일 저장
		// 폴더 이름 형식 지정(room + 오늘날짜)
		String folderName = "room" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		// 생성된 폴더의 경로(상대경로 - /image/roomYYYYMMDD/ 형식)
		String imageFolderPath = folderCreation.createImageFolder(folderName);
		
		// 이미지 저장시 사용할 폴더 경로 param에 추가
		param.put("imageFolderPath", imageFolderPath);
		
		// 각자의 프로젝트 이미지 경로 param에 추가
		param.put("baseFolderPath", folderCreation.BASE_FOLDER_PATH);
		
		log.info("param={}", param);
		
		// 입력한 정보 DB에 UPDATE 및 이미지 저장
		roomService.update(param, images.get("mainImage"));
		
		// 숙소 이미지, 편의시설의 경우 row수가 달라질 수 있으므로 DELETE 후 INSERT 진행 
		roomImageService.delete(param);
		roomImageService.insert(param);
		
		amenitiesService.delete(param);
		amenitiesService.insert(param);
	
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		return "redirect:/host/roomManage/registRoom/paymentInfo?roomId=" + param.get("roomId").toString();
	}
	
	// 숙소 등록 - 숙소 등록 3단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/paymentInfo")
	public String paymentInfoView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		// 숙소 등록 시 이전에 저장됐던 값을 출력하기 위해 해당 숙소 데이터 가져오기
		Map<String, Object> roomInfo = roomService.selectOne(param);
		log.info("roomInfo={}", roomInfo);
		modelMap.put("roomInfo", roomInfo);
		
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
		
		// 하루숙박 가격 DB에 추가(숙소 등록 3단계를 진행했던 상태에서는 하루숙박 가격이 존재하므로 삭제 후 DB에 추가)
		onedayPriceService.delete(param);
		onedayPriceService.insert(param);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		return "redirect:/host/roomManage/registRoom/preview?roomId=" + param.get("roomId").toString();
	}
	
	// 숙소 등록 - 숙소 등록 미리보기 페이지
	@RequestMapping("/roomManage/registRoom/preview")
	public String previewView(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("param={}", param);
		
		// 최종등록 전 숙소 정보 보여주기 위해 숙소 정보 가져오기
		Map<String, Object> roomInfo = roomService.selectOne(param);
		
		modelMap.put("roomInfo", roomInfo);
		
		return "/host/regist/preview";
	}
	
	// 숙소 최종 등록 - 숙소 상태 변경(등록중 -> 승인 대기)
	@ResponseBody
	@RequestMapping("/roomManage/registRoom/ajaxFinalRegist")
	public Map<String, Object> ajaxFinalRegist(@RequestParam Map<String, Object> param) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		log.info(param.toString());
		
		// 숙소의 상태를 등록중에서 승인 대기로 변경
		int row = roomService.update(param);
		
		// 숙소 상태 update 성공 시 
		if(row == 1) {
			log.info(getSuccessResult(model).toString());
			return getSuccessResult(model);
		} else {
			return getFailResult(model);
		}
	}
}
