package com.alpha.aoom;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

//@EnableScheduling
@SpringBootApplication
@MapperScan("com.alpha.aoom")
public class AoomApplication {

	public static void main(String[] args) {
		SpringApplication.run(AoomApplication.class, args);
	}

}
