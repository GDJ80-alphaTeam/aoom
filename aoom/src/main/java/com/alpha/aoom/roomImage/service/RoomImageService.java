package com.alpha.aoom.roomImage.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.util.file.ImageRemove;
import com.alpha.aoom.util.file.ImageUpload;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RoomImageService {

	@Autowired
	RoomImageMapper roomImageMapper;
	
	@Autowired
	ImageUpload imageUpload;
	
	@Autowired
	ImageRemove imageRemove;
	
	// 해당 숙소의 사진 검색
	public List<Map<String, Object>> selectByRoomId(Map<String,Object> param) {
		
		return roomImageMapper.selectByRoomId(param);
	}
	
	// 슥소 메인 이미지를 제외한 나머지 이미지들 저장 및 roomImage테이블에 INSERT
	public void insert(Map<String, Object> param) {
		
		log.info(param.toString());
		// 이미지 생성은 각자의 프로젝트 경로 + 이미지 폴더 경로 이므로 각자의 프로젝트 경로까지 포함하는 totalFolderPath 변수 생성
		String totalFolderPath = param.get("baseFolderPath").toString() + param.get("imageFolderPath").toString();
		
		// 나머지 숙소 이미지들 저장 및 INSERT(roomImage)
		// 숙소 이미지들의 imageNo시퀀스를 위해 for문 사용
		Map<String, MultipartFile> imageMap = (HashMap<String, MultipartFile>) param.get("images");
		log.info(String.valueOf(imageMap.size()));
		
		for (Entry<String, MultipartFile> entry : imageMap.entrySet()) {
			
			String key = entry.getKey();
			MultipartFile imageFile = entry.getValue();
			log.info(key, imageFile.toString());
			if(key.startsWith("images_") && !imageFile.isEmpty()) {
				// 이미지 저장 및 uuid 이름 반환
				String uuidImage = imageUpload.saveFile(totalFolderPath, imageFile);
				// 원본이미지 이름
				String originalImage = imageFile.getOriginalFilename();
				
				Map<String, Object> imageParam = new HashMap<>();
				imageParam.put("imageNo", key.substring(key.indexOf('_') + 1));
				imageParam.put("roomId", param.get("roomId"));
				imageParam.put("image", param.get("imageFolderPath").toString() + "/" + uuidImage);
				imageParam.put("originalName", originalImage);
				
				roomImageMapper.insert(imageParam);
			}
		}
	}
	
	// 해당 숙소의 이미지들 삭제
	public void delete(Map<String, Object> param) {
		
		Map<String, MultipartFile> imageMap = (HashMap<String, MultipartFile>) param.get("images");
		log.info(String.valueOf(imageMap.size()));
		
		for (Entry<String, MultipartFile> entry : imageMap.entrySet()) {
			
			String key = entry.getKey();
			MultipartFile imageFile = entry.getValue();
			log.info(key + imageFile.toString());
			if(key.startsWith("images_") && !imageFile.isEmpty()) {
				log.info(key + imageFile.isEmpty());
				
				Map<String, Object> imageParam = new HashMap<>();
				imageParam.put("imageNo", key.substring(key.indexOf('_') + 1));
				imageParam.put("roomId", param.get("roomId"));
				
				String baseFolderPath = param.get("baseFolderPath").toString();
				log.info(baseFolderPath);
				log.info(imageParam.toString());
				
				log.info(roomImageMapper.selectByRoomId(imageParam).toString());
				
				if(!roomImageMapper.selectByRoomId(imageParam).isEmpty()) {
					String imagePath = roomImageMapper.selectByRoomId(imageParam).get(0).get("image").toString();
					
					imageRemove.remove(baseFolderPath, imagePath);
				}
				
				roomImageMapper.delete(imageParam);
				
			}
		}
	}
}
