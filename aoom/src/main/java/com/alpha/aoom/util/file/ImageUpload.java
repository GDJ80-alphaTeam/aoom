package com.alpha.aoom.util.file;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ImageUpload {
	
	// 숙소 이미지 폴더 생성 위치
	private static final String BASE_FOLDER_PATH = "src/main/webapp/image/";
	
	// 폴더 생성
	public void createImageFolder() {
        // 오늘 날짜를 "roomYYYYMMDD" 형식으로 포맷
        String folderName = "room" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        Path path = Paths.get(BASE_FOLDER_PATH + folderName);
        if (!Files.exists(path)) {
            try {
                Files.createDirectories(path);
                System.out.println("폴더 생성된 경로 : " + path.toAbsolutePath());
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("다음 폴더가 이미 존재합니다 : " + path.toAbsolutePath());
        }
    }
	
	// 이미지 파일 생성
	public void addRoomImage() {
		
	}
}
