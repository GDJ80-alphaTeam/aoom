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
	final public static String CODE_RESULT_SUCCESS = "01";
	final public static String CODE_RESULT_SUCCESS_02 = "02";
	final public static String CODE_RESULT_SUCCESS_03 = "02";
	final public static String CODE_RESULT_SUCCESS_04 = "02";
	final public static String CODE_RESULT_SUCCESS_05 = "02";
	// 메세지 값
	final public static String MASSAGE_RESULT_SUCCESS = "완료 되었습니다.";
	final public static String MASSAGE_RESULT_SUCCESS_02 = "데이터를 삽입하는데 성공하였습니다.";
	final public static String MASSAGE_RESULT_SUCCESS_03 = "데이터를 수정하는데 성공하였습니다.";
	final public static String MASSAGE_RESULT_SUCCESS_04 = "데이터를 삭제하는데 성공하였습니다.";
	final public static String MASSAGE_RESULT_SUCCESS_05 = "데이터를 출력하는데 성공하였습니다.";
	
	/** 실패 */
	// 코드 값
	final public static String CODE_RESULT_FAIL = "01";
	final public static String CODE_RESULT_FAIL_02 = "02";
	final public static String CODE_RESULT_FAIL_03 = "03";
	final public static String CODE_RESULT_FAIL_04 = "04";
	final public static String CODE_RESULT_FAIL_05 = "05";
	// 메세지 값
	final public static String MASSAGE_RESULT_FAIL = "실패하였습니다.";
	final public static String MASSAGE_RESULT_FAIL_02 = "데이터를 삽입하는데 실패하였습니다.";
	final public static String MASSAGE_RESULT_FAIL_03 = "데이터를 수정하는데 실패하였습니다.";
	final public static String MASSAGE_RESULT_FAIL_04 = "데이터를 삭제하는데 실패하였습니다.";
	final public static String MASSAGE_RESULT_FAIL_05 = "데이터를 출력하는데 실패하였습니다.";
	
	/**알 수 없는 에러 */
	// 코드 값
	final public static String CODE_RESULT_ERROR_UNKNOWN = "99";
	// 메세지 값
	final public static String MASSAGE_RESULT_ERROR_UNKNOWN = "ERROR_UNKNOWN";
	
}
