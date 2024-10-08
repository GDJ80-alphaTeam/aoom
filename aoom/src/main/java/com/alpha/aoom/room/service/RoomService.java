package com.alpha.aoom.room.service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.util.file.ImageUpload;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RoomService {
	
	@Autowired
	RoomMapper roomMapper;
	
	@Autowired
	ImageUpload imageUpload;
	
	private final int rowPerPage = 6;
	
	// 숙소 상세보기 조회
	// param: room_id
	public Map<String, Object> selectOne(Map<String,Object> param) {
		return roomMapper.selectOne(param);
	}
	
	// 숙소 전체 목록 조회
	public List<Map<String, Object>> select(){
		return roomMapper.select();
	}
	
	// user가 호스팅하고있는 숙소 목록 조회
	public List<Map<String, Object>> selectByUserId(Map<String, Object> param){
		
		if(param.get("currentPage") != null) {
			// startRow ~ endRow 사이의 값 조회  
			int beginRow = ((int)param.get("currentPage") - 1) * rowPerPage;
			// beginRow + rowPerPage 로우퍼페이지의 개수만큼 검색
			
			int endRow = beginRow + rowPerPage;		
			log.info("beginRow={}", beginRow);
			log.info("endRow={}", endRow);
			
			param.put("beginRow", beginRow);
			param.put("endRow", endRow);
		}
		
		return roomMapper.selectByUserId(param);
	}
	
	// 조회수 TOP4 숙소 조회
	public List<Map<String, Object>> selectByViews(){
		return roomMapper.selectByViews();
	}
	
	// 별점 TOP4 숙소 조회
	public List<Map<String, Object>> selectByRating(){
		return roomMapper.selectByRating();
	}
	
	// 예약 TOP4 숙소 조회
	public List<Map<String, Object>> selectByBooking(){
		return roomMapper.selectByBooking();
	}
	
	// 위시리스트 TOP4 숙소 조회
	public List<Map<String, Object>> selectByWishList(){
		return roomMapper.selectByWishList();
	}
	
	// 숙소 검색, 필터, 카테고리 조건으로 조회
	public List<Map<String, Object>> selectBySearch(Map<String, Object> param){
		
		// 편의시설 값 : 콤마로 분리 -> 배열타입에 넣음 -> 맵에 저장
		String amenitiesStr = (String) param.get("amenities");
		if (amenitiesStr != null && !amenitiesStr.isEmpty()) {
			String[] amenitiesArray = amenitiesStr.split(",");
			
			
			int amenitiesLength = amenitiesArray.length;
			param.put("amenities", amenitiesArray);
			param.put("amenitiesLength", amenitiesLength);
		}
		
		
		// 편의시설 배열로 넣기
		log.info("param : "+ param);
		log.info("편의시설 배열: " + Arrays.toString((String[]) param.get("amenities")));
		log.info("편의시설 길이 : "+ param.get("amenitiesLength"));
		
		return roomMapper.selectBySearch(param);
	}
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	public Map<String, Object> setupRoom(String userId) {
		
		// selectKey를 이용해 roomId를 생성 후 가져오기 위해 map으로 선언
		Map<String, Object> setupRoomInfo = new HashMap<>();
		setupRoomInfo.put("userId", userId);
		
		// setupRoomInfo에 roomId 추가됨
		// 숙소 등록 결과 - 성공 : 1 / 실패 : 0
		roomMapper.insert(setupRoomInfo);
		
		// setupRoomInfo에 roomId가 들어갔는지 확인
		log.info("setupRoomInfo={}", setupRoomInfo);
		
		return setupRoomInfo;
	}
	
	// 숙소 등록 - 숙소 등록 1단계에서 입력한 정보 DB에 추가
	public int update(Map<String, Object> param) {
		return roomMapper.update(param);
	}
	
	// 숙소 등록 - 숙소 등록 2단계에서 입력한 정보 DB에 UPDATE 및 메인 이미지 저장
	public void update(Map<String, Object> param, MultipartFile mainImage) {
		
		log.info("roomId={}", param.get("roomId"));
		log.info("roomName={}", param.get("roomName"));
		log.info("roomContent={}", param.get("roomContent"));
		log.info("amenities={}", param.get("amenities"));
		log.info("mainImage={}", mainImage);
		
		// mainImage를 변경했다면 mainImage정보도 DB에 반영
		if(!mainImage.isEmpty()) {
			// 이미지 생성은 각자의 프로젝트 경로 + 이미지 폴더 경로 이므로 각자의 프로젝트 경로까지 포함하는 totalFolderPath 변수 생성
			String totalFolderPath = param.get("baseFolderPath").toString() + param.get("imageFolderPath").toString();
			
			// 숙소 메인 이미지 저장 및 uuid 파일명 반환
			String uuidMainImage = imageUpload.saveFile(totalFolderPath, mainImage);
			
			// 숙소 메인 이미지 원본 이름
			String originalMainImage = mainImage.getOriginalFilename();
			
			param.put("mainImage", param.get("imageFolderPath").toString() + "/" + uuidMainImage);
			param.put("originalName", originalMainImage);
		}
		
		// UPDATE(roomName, roomContent, mainImage, originalName)
		roomMapper.update(param);
	}
	
	// user가 호스팅하고있는 숙소의 개수, lastPage
	public Map<String, Object> selectByTotalCnt(Map<String, Object> param) {
		
		Map<String, Object> pagingInfo = new HashMap<>();
		int totalRow = roomMapper.selectByTotalCnt(param);
		
		int lastPage = totalRow / rowPerPage ;
		
		if(totalRow % rowPerPage != 0) {
			lastPage += 1; 
		}
		
		pagingInfo.put("totalRow", totalRow);
		pagingInfo.put("lastPage", lastPage);
		
		return pagingInfo;
	}
	
	// 숙소의 카테고리 이름 조회
	public Map<String, Object> selectByCategoryName(Map<String, Object> param){
		return roomMapper.selectByCategoryName(param);
	}
}
