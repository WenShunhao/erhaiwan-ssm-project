package com.control;

import com.dao.EmployeeDao;
import com.entity.EmployeeInfo;
import com.github.pagehelper.PageInfo;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class EmployeeControl {
    @Autowired
    private EmployeeDao dao;
    @Autowired
    private EmployeeService service;

    @InitBinder
    public void xxxx( WebDataBinder dataBinder) {

        DateFormatter dateFormatter = new DateFormatter();
        dateFormatter.setPattern("yyyy-MM-dd");
        dataBinder.addCustomFormatter(dateFormatter);
    }


    @RequestMapping("/emplist")
    public ModelAndView lst(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<EmployeeInfo> all = dao.getEmpAllInfo(pageNum, pageSize);
        PageInfo<EmployeeInfo> pageInfo = new PageInfo<>(all,7);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("emp/emplst");
        return mv;

    }

    @RequestMapping("/delemp")
    public ModelAndView del(Integer eId){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值"+eId);
        service.empBackup(eId);
        mv.setViewName("forward:emplist");
        return mv;

    }

    @RequestMapping("/addemp")
    @ResponseBody
    public ModelAndView add(EmployeeInfo employeeInfo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值"+employeeInfo);
        dao.addEmpInfo(employeeInfo);
        mv.setViewName("emp/empadd");
        return mv;

    }


    @RequestMapping("/addui")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("emp/empadd");
        return mav;
    }
    @RequestMapping("/backui")
    public ModelAndView index2(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("emp/empbackup");
        return mav;
    }

}
