package com.alpha.aoom.user.service;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.aoom.user.dto.User;

@Mapper
public interface UserMapper {
	// 회원가입
	int userInsert(User user);
}
