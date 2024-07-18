package com.alpha.aoom.room.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.amenities.service.AmenitiesMapper;
import com.alpha.aoom.roomImage.service.RoomImageMapper;
import com.alpha.aoom.util.file.FolderCreation;
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
	public List<Map<String, Object>> selectByUserId(String userId){
		return roomMapper.selectByUserId(userId);
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
			
		// 숙소 메인 이미지 저장 및 uuid 파일명 반환
		String uuidMainImage = imageUpload.saveFile((String) param.get("folderPath"), mainImage);
		
		// 숙소 메인 이미지 원본 이름
		String originalMainImage = mainImage.getOriginalFilename();
		
		param.put("mainImage", uuidMainImage);
		param.put("originalName", originalMainImage);
		
		// UPDATE(roomName, roomContent, mainImage, originalName)
		roomMapper.update(param);
	}
	
	
}
