package com.alpha.aoom.cancelRefund.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CancelRefundMapper {

	int insert(Map<String, Object> param);
}
