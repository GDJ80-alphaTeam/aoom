package com.alpha.aoom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class OracleSessionConfigurator {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void configureSession() {
        // 세션의 NLS_DATE_FORMAT 설정
        jdbcTemplate.execute("ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'");
    }
}