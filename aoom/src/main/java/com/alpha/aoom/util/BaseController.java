package com.alpha.aoom.util;

import java.util.Map;

import org.springframework.ui.ModelMap;

/**
 * 날짜 : 2024.07.14
 * 작성자 : 이용훈
 * 설명 : ajax 호출 결과 값
 * =============== 개정이력 ===============
 *
 * 수정일       수정자       수정내용
 * ----------------------------------------
 * 2024.07.14   이용훈       최초작성
 * 2024.07.14   이용훈       삽입실패 추가
 */
public class BaseController implements BaseConstant{

	/** success시 **/
	//ajax 성공 결과 (맵반환)
	public Map<String, Object> getSuccessResult(Map<String, Object> model) {

		model.put("result", true);
		model.put("code", CODE_RESULT_SUCCESS);
		model.put("message", MASSAGE_RESULT_SUCCESS);
		return model;
	}

	public Map<String, Object> getSuccessResult(Map<String, Object> model, String message) {
		
		model.put("result", true);
		model.put("code", CODE_RESULT_SUCCESS);
		model.put("message", message);
		return model;
	}

	
	//ajax 성공 결과 (모델반환)
	public Map<String, Object> getSuccessResult(ModelMap model) {
		model.put("result", true);
		model.put("code", CODE_RESULT_SUCCESS);
		model.put("message", MASSAGE_RESULT_SUCCESS);
		return model;
	}

	public Map<String, Object> getSuccessResult(ModelMap model, String message) {
		model.put("result", true);
		model.put("code", CODE_RESULT_SUCCESS);
		model.put("message", message);
		return model;
	}

	
	/** FAIL 시 **/
	//ajax 실패 결과 (맵반환)
	public Map<String, Object> getFailResult(Map<String, Object> model) {
		model.put("result", false);
		model.put("code", CODE_RESULT_FAIL);
		model.put("message", MASSAGE_RESULT_FAIL);
		return model;
	}	
	
	//ajax 실패 결과 (모델반환)
	public Map<String, Object> getFailResult(ModelMap model) {
		model.put("result", false);
		model.put("code", CODE_RESULT_FAIL);
		model.put("message", MASSAGE_RESULT_FAIL);
		return model;
	}	
	
	// 메세지를 넣어서 보낼때 (맵반환)
	public Map<String, Object> getFailResult(Map<String, Object> model, String message) {
		model.put("result", false);
		model.put("code", CODE_RESULT_FAIL);
		model.put("message", message);
		return model;
	}
	
	
	// 메세지를 넣어서 보낼때 (모델반환)
	public Map<String, Object> getFailResult(ModelMap model, String message) {
		model.put("result", false);
		model.put("code", CODE_RESULT_FAIL);
		model.put("message", message);
		return model;
	}
	
	// 특정 fail 코드 + 메세지 를 넣을 때 (맵반환)
	public Map<String, Object> getFailResult(Map<String, Object> model, String code, String message) {
		model.put("result", false);
		model.put("code", code);
		model.put("message", message);
		return model;
	}
	
	// 특정 fail 코드 + 메세지 를 넣을 때 (모델반환)
	public Map<String, Object> getFailResult(ModelMap model, String code, String message) {
		model.put("result", false);
		model.put("code", code);
		model.put("message", message);
		return model;
	}
}