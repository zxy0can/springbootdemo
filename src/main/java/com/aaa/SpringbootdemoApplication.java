package com.aaa;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan("com.aaa.dao")
@EnableTransactionManagement
public class SpringbootdemoApplication {

	public static void main(String[] args) {
       //项目启动类
		SpringApplication.run(SpringbootdemoApplication.class, args);
	}
}
