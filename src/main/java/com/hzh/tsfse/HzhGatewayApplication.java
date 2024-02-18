package com.hzh.tsfse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@Slf4j
@SpringBootApplication
public class HzhGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(HzhGatewayApplication.class, args);
        log.info("=================Hzh-Tsfse-Cloud 网关中心服务启动成功...=================");
    }

}
