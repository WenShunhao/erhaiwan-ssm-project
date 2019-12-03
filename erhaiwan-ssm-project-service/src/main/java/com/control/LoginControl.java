package com.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginControl {

    @RequestMapping("/login")
    public ModelAndView indexlogin(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminLogin");
        return mav;
    }

}
