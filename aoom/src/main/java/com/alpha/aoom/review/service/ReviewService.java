package com.alpha.aoom.review.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.aoom.util.file.FolderCreation;
import com.alpha.aoom.util.file.ImageUpload;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service 
@Transactional
public class ReviewService {

	@Autowired
	ReviewMapper reviewMapper;
	
	@Autowired
	FolderCreation folderCreation;
	private final int rowPerPage = 6;
	
	// param : String room_id , int currentPage , int beginRow , int endRow
	// 숙소리뷰 리스트
	public Map<String, Object> selectList(Map<String, Object> param){
		
		// currentPage가 param에 가지고있으면 param값 , 없으면 1
		int currentPage = (String)param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ;  
									
		// startRow ~ endRow 사이의 값 조회  
		int beginRow = (currentPage - 1) * rowPerPage;
		// beginRow + rowPerPage 로우퍼페이지의 개수만큼 검색
		int endRow = beginRow + rowPerPage;		
		
		param.put("beginRow", beginRow);
		param.put("endRow", endRow);
		
		// reviewList 와 currentPage 같이보내기위한 Map
		Map<String, Object> selectList = new HashMap<String, Object>(); 
		
		selectList.put("review", reviewMapper.selectList(param));
		selectList.put("currentPage", currentPage);
		return selectList; 		
	}
	
	// param : room_id
	// 숙소리뷰 개수 및 평균 + pagingInfo
	public Map<String, Object> selectByAvgCnt(Map<String,Object> param){
		
		// reviewMapper에서 데이터 가져오기 + 카멜케이스맵으로 생성되어서 그대로 map에 put을하면 대문자가 소문자로 바뀌어버림
        Map<String, Object> originalPagingInfo = reviewMapper.selectByAvgCnt(param);

        // totalRow 검색후 페이징에 필요한값 생성 , 위의 이유때문에 hashMap으로 타입변경 
        Map<String, Object> getPagingInfo = new HashMap<>(originalPagingInfo);
					
		int totalRow = ((BigDecimal)(getPagingInfo).get("cnt")).intValue();	
		
		int lastPage = totalRow / rowPerPage ;
		
		if(totalRow % rowPerPage != 0) {
			lastPage += 1; 
		}
			
		getPagingInfo.put("lastPage", lastPage);
		//log.info(getPagingInfo.getClass().getCanonicalName());
		return getPagingInfo;
	}
	
	// param: roomId
	// 해당 숙소를 운영하는 유저의 총 후기수 
	public Map<String,Object> selectByHostTotalCnt(Map<String, Object> param){
		
		Map<String, Object> originalHostCount = reviewMapper.selectByHostTotalCnt(param);
		
		Map<String, Object> hostCount = new HashMap<>(originalHostCount);
		
		return hostCount;
					
	}
	
	// 숙소의 평점과 후기의 갯수 조회
	public Map<String, Object> selectByRatingAvgReviewCnt(Map<String, Object> param){
		return reviewMapper.selectByRatingAvgReviewCnt(param);
	}

	// param : booking_id , room_id , user_id , review_content , review_image , original_name
	// 리뷰 등록 
	public int insert(Map<String, Object> param){
		
		ImageUpload imageUpload = new ImageUpload();
		
		// 폴더 이름 형식 지정(room + 오늘날짜)
		String folderName = "room" + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		// 생성된 폴더의 경로(상대경로 - /image/roomYYYYMMDD/ 형식)
		String imageFolderPath = folderCreation.createImageFolder(folderName);
		
		String baseFolderPath = folderCreation.BASE_FOLDER_PATH ;

		MultipartFile reviewImage = (MultipartFile) param.get("reviewImage");
		
		// 이미지 생성은 각자의 프로젝트 경로 + 이미지 폴더 경로 이므로 각자의 프로젝트 경로까지 포함하는 totalFolderPath 변수 생성
		String totalFolderPath = baseFolderPath + imageFolderPath;
		log.info("baseFolderPath"+baseFolderPath);
		log.info("imageFolderPath"+imageFolderPath);
		// 리뷰 이미지 저장 및 uuid 파일명 반환
		String uuidMainImage = imageUpload.saveFile(totalFolderPath, reviewImage);
		
		// 리뷰 이미지 이름
		String originalMainImage = reviewImage.getOriginalFilename();
		
		param.put("reviewImage", imageFolderPath + "/" + uuidMainImage);
		param.put("originalName", originalMainImage);
		return reviewMapper.insert(param);
	}
	public int insertContent(Map<String, Object> param) {
		
		return reviewMapper.insertContent(param);
	}
	
	// 프로필 소유자가 받은 모든 리뷰검색
	public Map<String, Object> selectListByProfile(Map<String, Object> param){
		
		  
		
		// currentPage가 param에 가지고있으면 param값 , 없으면 1
		int currentPage = (String)param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ;  
									
		// startRow ~ endRow 사이의 값 조회  
		int beginRow = (currentPage - 1) * rowPerPage;
		// beginRow + rowPerPage 로우퍼페이지의 개수만큼 검색
		int endRow = beginRow + rowPerPage;		
		
		param.put("beginRow", beginRow);
		param.put("endRow", endRow);
		
		// reviewList 와 currentPage 같이보내기위한 Map
			Map<String, Object> selectList = new HashMap<String, Object>(); 
			
			selectList.put("review", reviewMapper.selectListByProfile(param));
			selectList.put("currentPage", currentPage);
				
		
		return selectList; 
	}
	
	// param : room_id
		// 숙소리뷰 개수 및 평균 + pagingInfo
		public Map<String, Object> selectByProfileCnt(Map<String,Object> param){
			
			// reviewMapper에서 데이터 가져오기 + 카멜케이스맵으로 생성되어서 그대로 map에 put을하면 대문자가 소문자로 바뀌어버림
	        Map<String, Object> originalPagingInfo = reviewMapper.selectByHostTotalCnt(param);

	        // totalRow 검색후 페이징에 필요한값 생성 , 위의 이유때문에 hashMap으로 타입변경 
	        Map<String, Object> getPagingInfo = new HashMap<>(originalPagingInfo);
						
			int totalRow = ((BigDecimal)(getPagingInfo).get("cnt")).intValue();	
			
			int lastPage = totalRow / rowPerPage ;
			
			if(totalRow % rowPerPage != 0) {
				lastPage += 1; 
			}
				
			getPagingInfo.put("lastPage", lastPage);
			//log.info(getPagingInfo.getClass().getCanonicalName());
			return getPagingInfo;
		}
}
