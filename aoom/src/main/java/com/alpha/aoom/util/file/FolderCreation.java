package com.alpha.aoom.util.file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FolderCreation {
	
	// 이미지 폴더 생성 위치
	private final String BASE_FOLDER_PATH = "src/main/webapp/image/";
	
	// 폴더 생성
	public String createImageFolder(String folderName) {
	    
	    // 이미지 폴더 생성 위치와 매개변수로 받은 폴더명을 더해 경로 지정
	    Path path = Paths.get(BASE_FOLDER_PATH + folderName);
		
	    // 생성하려는 폴더가 존재하는지 확인
		if(!checkFolderExist(path)) { // 존재한다면
			return "";
		}
		
		// 존재 하지 않으면
		try {
			// 해당 경로에 폴더 생성
            Files.createDirectories(path);
            log.info("생성된 폴더의 경로={}", path.toAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		// 경로 값 반환
		return path.toString();
    }
	
	// 생성하려는 폴더가 존재하는지 확인
	public boolean checkFolderExist(Path path) {

        // 해당 경로에 생성하려는 폴더가 있는지 분기
        if (!Files.exists(path)) { // 폴더가 없다면
        	log.info("폴더 생성 가능");
        	return true;
        } else { // 폴더가 있다면
        	log.info("폴더 이미 존재");
            return false;
        }
	}
}
