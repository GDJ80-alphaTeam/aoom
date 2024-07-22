package com.alpha.aoom.util.file;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class ImageRemove {

	/**
	 * 날짜 : 2024.07.22
	 * 작성자 :  오승엽
	 * 설명 : 로컬 또는 원격 저장소의 이미지를 제거하는 메서드
	 * 매개변수 : String, String
	 * 매개변수설명 : 프로젝트 경로, 해당 이미지의 경로(이미지 이름을 포함한)
	 * =============== 개정이력 ===============
	 *
	 * 수정일       수정자       수정내용
	 * ----------------------------------------
	 * 2024.07.22   오승엽       최초작성
	 */
	public void remove(String baseFolderPath, String imagePath) {
		File f = new File(baseFolderPath + imagePath);
		if(f.exists()) {
			f.delete();
		}
	}
}
