package com.alpha.aoom.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.roomImage.service.RoomImageService;
import com.alpha.aoom.util.file.FolderCreation;
import com.alpha.aoom.util.file.ImageRemove;
import com.alpha.aoom.util.file.ImageUpload;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	FolderCreation folderCreation;

	// 로그인
	public Map<String, Object> signinUser(Map<String, Object> param) {
		
		// 유효한 userID인지 확인 후 유효하면 정보 담기
		Map<String, Object> userInfo = userMapper.select(param);
		
		// 로그인 정보 담기
		Map<String, Object> signinInfo = new HashMap<>();
		// 회원정보담기
		signinInfo.put("userInfo", userInfo);
		
		// 로그인 결과 분기문
		if(userInfo != null) { // 성공시 signinInfo에 결과값 담기
			signinInfo.put("result", "success");
		} else { // 실패시 signinInfo에 결과값 담기
			signinInfo.put("result", "fail");
		}
		
		// 로그인 정보 반환
		return signinInfo;
	}
	
	// 회원가입
	public int signupUser(Map<String , Object> param) {
		
		// 회원가입 결과 받기(성공 : 1 , 실패 : 0)
		int row = userMapper.insert(param);
		
		// 회원가입 결과 반환
		return row;
	}
	
	// 아이디 중복 체크
	public String userDuplicateCheck(Map<String , Object> param) {
		
		// 아이디 중복 체크 결과 담기
		Map<String, Object> idCheck = userMapper.selectByUserId(param);
		
		// 중복 체크 결과 분기문
		if(idCheck == null) { // 중복되지 않았을 때
			return "success";
		}
		
		return "fail";
	}
	
	// 가입기간 확인
	public Map<String, Object> selectBySubPeriod(Map<String, Object> param) {
		
		return userMapper.selectBySubPeriod(param);
	}
	
	// 고객정보 수정
	public int update(Map<String, Object> param) {
		
		return userMapper.update(param);
	}
	
	// 고객 정보 가져오기
	public Map<String, Object> selectByUserId(Map<String, Object> param) {
		return userMapper.selectByUserId(param);
	} 
	
	public String updateProfileImg(Map<String, Object> param){
		
		ImageUpload imageUpload = new ImageUpload();
		
		ImageRemove imageRemove = new ImageRemove();
		
		// 저장경로지정 /image/"param"
		String imageFolderPath = folderCreation.createImageFolder("profile");
		
		// 이미지 저장시 사용할 폴더 경로 param에 추가
		param.put("imageFolderPath", imageFolderPath);
		
		// 각자의 프로젝트 이미지 경로 param에 추가
		param.put("baseFolderPath", folderCreation.BASE_FOLDER_PATH);
		
		// 이미지 생성은 각자의 프로젝트 경로 + 이미지 폴더 경로 이므로 각자의 프로젝트 경로까지 포함하는 totalFolderPath 변수 생성
		String totalFolderPath = param.get("baseFolderPath").toString() + param.get("imageFolderPath").toString();
		
		MultipartFile profileImage = (MultipartFile) param.get("profileImage");
		
		String uuidMainImage = imageUpload.saveFile(totalFolderPath, profileImage);
		
		param.put("profileImage", imageFolderPath + "/" + uuidMainImage);
		
		//변경전사진
		String beforeImg = (String)param.get("deleteImage");
		
		String afterImg = (String)param.get("profileImage");
		
		// 사진 업데이트전 기존에있던 사진 삭제 단 default 사진일경우 삭제하면안됨
		if(beforeImg.equals("/image/etc/userDefault.png") || beforeImg == "/image/etc/userDefault.png") {
		
		} else {
			log.info(imageFolderPath + beforeImg + "이미지삭제");
			imageRemove.remove(folderCreation.BASE_FOLDER_PATH, beforeImg);
		}
			// 유저 프로필 업데이트
			userMapper.updateByProfileImg(param);
		return afterImg;
		
	}
	
	
}
