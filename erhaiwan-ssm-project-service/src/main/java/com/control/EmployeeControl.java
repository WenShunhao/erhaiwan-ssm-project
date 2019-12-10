package com.control;

import com.dao.EmployeeDao;
import com.entity.EmployeeInfo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
public class EmployeeControl {
    @Autowired
    private EmployeeDao dao;

    @InitBinder
    public void xxxx( WebDataBinder dataBinder) {

        DateFormatter dateFormatter = new DateFormatter();
        dateFormatter.setPattern("yyyy-MM-dd");
        dataBinder.addCustomFormatter(dateFormatter);
    }


    @RequestMapping("/emplist")
    public ModelAndView test2(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<EmployeeInfo> all = dao.getEmpAllInfo(pageNum, pageSize);
        PageInfo<EmployeeInfo> pageInfo = new PageInfo<>(all,7);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("emp/emplst");
        return mv;

    }

    @RequestMapping("/test")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("emp/empadd");
        return mav;
    }
    @RequestMapping("/test2")
    public ModelAndView index2(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("emp/empbackup");
        return mav;
    }

}
