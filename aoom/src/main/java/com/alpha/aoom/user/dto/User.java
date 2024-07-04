package com.alpha.aoom.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private String userId;
	private String userPw;
	private String userBirth;
	private String userName;
	private String userPhone;
	private String userstatCode;
	private String createDate;
	private String updateDate;
	private String userauthCode;
	private String userImage;
}
