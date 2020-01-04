package com.control;

import com.service.TotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
public class TotalControl {

    @Autowired
    private TotalService service;

//统计页面
    @RequestMapping("/totalui")
    public ModelAndView test(@RequestParam(value ="toyear",required = false,defaultValue = "2019")String toyear){
        ModelAndView mv = new ModelAndView();
//        get all data
//        System.out.println("传过来的年份：===="+toyear);
        Map<String, Double> rechargeTotal = service.getRechargeTotal(toyear);
        Map<String,Double> pachargeTotal = service.getParkingTotal(toyear);
//        test
//        System.out.println("测试所有数据： "+rechargeTotal.values()+"  ");
//        System.out.println("测试所有数据 : "+ pachargeTotal.values()+" ");

//        统计
        Map<String,Double> datatotal = new LinkedHashMap<>();
        for(String key:rechargeTotal.keySet()){
        if(pachargeTotal.containsKey(key)){
        datatotal.put(key, rechargeTotal.get(key)+pachargeTotal.get(key));
        }
       }
//        System.out.println("合并后的数据！！！"+datatotal.values());

//        set atrr
        mv.addObject("redata",rechargeTotal.values());
        mv.addObject("padata",pachargeTotal.values());
        mv.addObject("totaldata",datatotal.values());
        mv.setViewName("Income");
        return mv;

    }


}
