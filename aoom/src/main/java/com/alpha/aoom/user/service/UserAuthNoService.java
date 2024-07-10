package com.alpha.aoom.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.aoom.member.service.MemberMapper;
import com.alpha.aoom.member.service.MemberService;
import com.alpha.aoom.util.email.SendEmail;

@Service
public class UserAuthNoService {
	
	@Autowired
	private SendEmail sendEmail;
	@Autowired
	private UserAuthNoMapper userAuthNoMapper;
	@Autowired
	MemberService memberService;
	
	// 인증번호 DB에 저장
	public void insertAuthNo(Map<String, Object> param) {
		int result = userAuthNoMapper.insertAuthNo(param);
	}
	
	// 인증번호 일치여부 확인
	public int checkAuthNo(Map<String, Object> param) {
		return userAuthNoMapper.selectAuthNo(param);
	}
	
	// 아이디 인증이력조회 
	public int authRecord(Map<String,Object> param) {		
		return userAuthNoMapper.authRecord(param);
	}
	
	// 인증번호 업데이트
	public int updateAuthNo(Map<String,Object> param) {
		return userAuthNoMapper.updateAuthNo(param);
	}
	
    // 인증번호 생성
    public int createNumber() {
        return (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }
    
    // 인증번호 보내기
    public String sendAuthNo(Map<String,Object> param) {
    	
		// 아이디 중복 체크 결과 담기
		String idCheck = memberService.userDuplicateCheck(param);
		int createNumber = createNumber();
		param.put("authNo", createNumber);
		
		String to = (String) param.get("userId");
		String title = "AOOM 회원가입 인증번호입니다.";
		String body = "AOOM 회원가입 인증번호입니다.<br><h1>인증번호 : "+createNumber+"</h1><br>이용해주셔서 감사합니다.";
		
		// 이메일 중복체크 분기문
		if(idCheck.equals("success")) { // 중복되지 않을 때
			sendEmail.sendEmail(to, title, body); // 이메일 전송
			// 인증내역 여부 분기문
			if(authRecord(param) == 1) { // 인증이력 있음
				updateAuthNo(param); // 기존에 있던 인증번호 update
			} else { // 인증이력 없음
				insertAuthNo(param); // 인증번호 insert
			}
			return "success";
		} else {
			return "fail";
		}
		
    }
}

















