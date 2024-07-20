package com.alpha.aoom.roomImage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.util.file.ImageUpload;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RoomImageService {

	@Autowired
	RoomImageMapper roomImageMapper;
	
	@Autowired
	ImageUpload imageUpload;
	
	// 해당 숙소의 사진 검색
	public List<Map<String, Object>> selectByRoomId(Map<String,Object> param) {
		
		return roomImageMapper.selectByRoomId(param);
	}
	
	// 슥소 메인 이미지를 제외한 나머지 이미지들 저장 및 roomImage테이블에 INSERT
	public void insert(Map<String, Object> param, MultipartFile[] images) {
		
		// 이미지 생성은 각자의 프로젝트 경로 + 이미지 폴더 경로 이므로 각자의 프로젝트 경로까지 포함하는 totalFolderPath 변수 생성
		String totalFolderPath = param.get("baseFolderPath").toString() + param.get("imageFolderPath").toString();
		
		// 나머지 숙소 이미지들 저장 및 INSERT(roomImage)
		// 숙소 이미지들의 imageNo시퀀스를 위해 for문 사용
		for (int i = 0; i < images.length; i++) {
			
			// 이미지 저장 및 uuid 이름 반환
			String uuidImage = imageUpload.saveFile(totalFolderPath, images[i]);
			// 원본이미지 이름
			String originalImage = images[i].getOriginalFilename();
			
			// 각 이미지별로 DB에 INSERT 반복하기 위해 map 생성
			Map<String, Object> imageMap = new HashMap<>();
			
			// INSERT에 필요한 컬럼들 map에 추가
			imageMap.put("roomId", param.get("roomId"));
			imageMap.put("imageNo", i + 1);
			imageMap.put("image", param.get("imageFolderPath").toString() + "/" + uuidImage);
			imageMap.put("originalName", originalImage);
			
			roomImageMapper.insert(imageMap);
		}
	}
	
	// 해당 숙소의 이미지들 삭제
	public int delete(Map<String, Object> param) {
		log.info("param={}", param);
		return roomImageMapper.delete(param);
	}
}
