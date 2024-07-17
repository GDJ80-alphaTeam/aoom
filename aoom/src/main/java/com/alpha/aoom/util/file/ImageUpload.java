package com.alpha.aoom.util.file;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ImageUpload {

	/**
	 * 날짜 : 2024.07.16
	 * 작성자 : 오승엽
	 * 설명 : UUID 생성
	 * 리턴값 : String
	 * 리턴값설명 : 생성된 UUID
	 * =============== 개정이력 ===============
	 *
	 * 수정일       수정자       수정내용
	 * ----------------------------------------
	 * 2024.07.16   오승엽       최초작성
	 */
	public String createUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 날짜 : 2024.07.16
	 * 작성자 : 오승엽
	 * 설명 : 업로드한 파일의 확장자를 구하는 메서드
	 * 매개변수 : MultipartFile
	 * 매개변수설명 : form에서 업로드한 파일
	 * 리턴값 : String
	 * 리턴값설명 : 업로드한 파일의 확장자
	 * =============== 개정이력 ===============
	 *
	 * 수정일       수정자       수정내용
	 * ----------------------------------------
	 * 2024.07.16   오승엽       최초작성
	 */
	public String getSuffix(MultipartFile multipartFile) {
		
		// 업로드한 파일의 마지막.의 위치 구하기
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		
		// 마지막 .의 위치부터 끝까지 문자열 자르기(확장자만 남음)
		String suffix = multipartFile.getOriginalFilename().substring(p);
		log.info("suffix={}", suffix);
		
		return suffix;
	}
	
	/**
	 * 날짜 : 2024.07.16
	 * 작성자 : 오승엽
	 * 설명 : 업로드한 파일을 저장하는 기능
	 * 매개변수 : String, MultipartFile
	 * 매개변수설명 : 파일을 저장할 경로, 업로드한 파일
	 * 리턴값 : String
	 * 리턴값설명 : 업로드한 파일의 전체 경로(폴더 경로 포함)
	 * =============== 개정이력 ===============
	 *
	 * 수정일       수정자       수정내용
	 * ----------------------------------------
	 * 2024.07.16   오승엽       최초작성
	 */
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
