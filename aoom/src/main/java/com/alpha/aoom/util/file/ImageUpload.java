package com.alpha.aoom.util.file;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ImageUpload {

	// 이미지 이름으로 사용할 UUID 생성
	public String createUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	// 업로드한 파일에서 확장자 가져오기
	public String getSuffix(MultipartFile multipartFile) {
		
		// 업로드한 파일의 마지막.의 위치 구하기
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		
		// 마지막 .의 위치부터 끝까지 문자열 자르기(확장자만 남음)
		String suffix = multipartFile.getOriginalFilename().substring(p);
		log.info("suffix={}", suffix);
		
		return suffix;
	}
	
	// 파일 저장
	// 반환 값 : 파일 이름
	public String saveFile(String folderPath, MultipartFile multipartFile) {
		String prefix = createUUID();
		String suffix = getSuffix(multipartFile);
		
		// 파일 저장
		// multipartFile파일(스트림)을 빈 emptyFile로 복사
		File emptyFile = new File(folderPath + "/" + prefix + suffix);
		try {
			multipartFile.transferTo(emptyFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return emptyFile.getPath();
	}
}
