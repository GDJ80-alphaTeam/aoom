package com.alpha.aoom.util.file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FolderCreation {
	
	// 이미지 폴더 생성 위치
	private final String BASE_FOLDER_PATH = "C:/image/";
	
	// 폴더 생성
	public String createImageFolder(String folderName) {
	    
	    // 이미지 폴더 생성 위치와 매개변수로 받은 폴더명을 더해 경로 지정
	    Path path = Paths.get(BASE_FOLDER_PATH + folderName);
		
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
		log.info("반환값={}", path.toString());
		// 경로 값 반환
		return path.toString();
    }
	
}
