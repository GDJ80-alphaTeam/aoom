package com.alpha.aoom.util.file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FolderCreation {
	
	@Autowired
    ServletContext servletContext;
	
	// 폴더 생성 위치
	public String BASE_FOLDER_PATH;

	@PostConstruct
	public void init() {
		BASE_FOLDER_PATH = servletContext.getRealPath("/");
		System.out.println(BASE_FOLDER_PATH);
	}
	
	/**
	 * 날짜 : 2024.07.15
	 * 작성자 : 오승엽
	 * 설명 : 폴더 생성 메서드
	 * 매개변수 : String
	 * 매개변수설명 : 생성하고자 하는 폴더 이름
	 * 리턴값 : String
	 * 리턴값설명 : 생성된 폴더의 경로
	 * =============== 개정이력 ===============
	 *
	 * 수정일       수정자       수정내용
	 * ----------------------------------------
	 * 2024.07.15   오승엽      최초 작성
	 * 2024.07.18   오승엽      폴더 생성 경로 및 return값 변경
	 */
	public String createImageFolder(String folderName) {
	    
		String folderPath = "/image/" + folderName;
		
	    // 이미지 폴더 생성 위치와 매개변수로 받은 폴더명을 더해 경로 지정
	    Path path = Paths.get(BASE_FOLDER_PATH + folderPath);
		
	    // 생성하려는 폴더가 존재하는지 확인
		if(!Files.exists(path)) { // 존재 하지 않으면 폴더 생성
			try {
				// 해당 경로에 폴더 생성
	            Files.createDirectories(path);
	            log.info("생성된 폴더의 경로={}", path.toAbsolutePath());
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		}
		log.info(folderPath);
		// 경로 값 반환
		return folderPath;
    }

}
