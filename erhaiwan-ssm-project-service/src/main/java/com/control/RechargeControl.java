package com.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RechargeControl {
    @RequestMapping("/recharge")
    public ModelAndView recharge(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("recharge");
        return mv;
    }
}
