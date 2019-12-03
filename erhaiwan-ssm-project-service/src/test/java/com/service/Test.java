package com.service;

import com.config.ProjectConfig;
import com.entity.OperatorInfo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

public class Test {
    @org.junit.Test
    public void testLogin(){
        ApplicationContext context = new AnnotationConfigApplicationContext(ProjectConfig.class);
        OperatorService service = context.getBean(OperatorService.class);
        String loginname= "admin";
        OperatorInfo oper = service.Login(loginname,"1233456");
        if (oper!=null){
            System.out.println("欢迎您！超级管理员"+loginname+"！！！");
        }else {
            System.out.println("账号/密码错误，请检查！");
        }

    }
}
