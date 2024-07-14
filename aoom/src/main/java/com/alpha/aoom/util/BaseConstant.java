package com.alpha.aoom.util;

/**
 * 날짜 : 2024.07.14
 * 작성자 : 이용훈
 * 설명 : ajax 호출 결과에 들어갈 상수들
 * =============== 개정이력 ===============
 *
 * 수정일       수정자       수정내용
 * ----------------------------------------
 * 2024.07.14   이용훈       최초작성
 * 2024.07.14   이용훈       fail_02 추가
 */
public interface BaseConstant {

	
	
	/** 성공 */
	// 코드 값
	final public static String CODE_RESULT_SUCCESS = "00";
	// 메세지 값
	final public static String MASSAGE_RESULT_SUCCESS = "SUCCESS";

	
	
	/**알 수 없는 에러 */
	// 코드 값
	final public static String CODE_RESULT_ERROR_UNKNOWN = "99";
	// 메세지 값
	final public static String MASSAGE_RESULT_ERROR_UNKNOWN = "ERROR_UNKNOWN";
	
	
	
	
	/** 실패 */
	// 코드 값
	final public static String CODE_RESULT_FAIL = "01";
	final public static String CODE_RESULT_FAIL_02 = "02";
	// 메세지 값
	final public static String MASSAGE_RESULT_FAIL = "FAIL";
	final public static String MASSAGE_RESULT_FAIL_02 = "데이터를 삽입하는데 실패하였습니다.";
	
}
