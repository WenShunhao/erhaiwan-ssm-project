package com.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginControl {
    @RequestMapping("/")
    public String indexlogin(){
        return "adminLogin";
    }
}
