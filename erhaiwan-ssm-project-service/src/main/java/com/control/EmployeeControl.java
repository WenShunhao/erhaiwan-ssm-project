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

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.List;

@Controller
public class EmployeeControl {
    @Autowired
    private EmployeeDao dao;
    @Autowired
    private EmployeeService service;
//        转换时间格式
    @InitBinder
    public void xxxx( WebDataBinder dataBinder) {

        DateFormatter dateFormatter = new DateFormatter();
        dateFormatter.setPattern("yyyy-MM-dd");
        dataBinder.addCustomFormatter(dateFormatter);
    }

//员工列表
    @RequestMapping("/emplist")
    public ModelAndView lst(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<EmployeeInfo> all = dao.getEmpAllInfo(pageNum, pageSize);
        PageInfo<EmployeeInfo> pageInfo = new PageInfo<>(all,5);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("emp/emplst");
        return mv;

    }
//删除员工信息
    @RequestMapping("/delemp")
    public ModelAndView del(Integer eId){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值"+eId);
        service.empBackup(eId);
        mv.setViewName("forward:emplist");
        return mv;

    }
//添加员工页面
    @RequestMapping("/addui")
    public ModelAndView addui(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("emp/empadd");
        return mav;
    }
//添加员工
    @RequestMapping("/addemp")
    @ResponseBody
    public ModelAndView add(EmployeeInfo employeeInfo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值"+employeeInfo);
        dao.addEmpInfo(employeeInfo);
        mv.setViewName("emp/empadd");
        return mv;

    }
//备份界面
    @RequestMapping("/backui")
    public ModelAndView backup(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("emp/empbackup");
        return mav;
    }


    //修改界面
    @RequestMapping("/updateui")
    public ModelAndView updateui(Integer eId){
        ModelAndView mav = new ModelAndView();
        System.out.println("传过来的eId值 = " + eId);
        EmployeeInfo employeeInfo = dao.queryOne(eId);
        mav.addObject("emp",employeeInfo);
        mav.setViewName("emp/empupdate");
        return mav;
    }
//修改操作
    @RequestMapping("/updateemp")
    public ModelAndView updateemp(EmployeeInfo employeeInfo){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值employeeInfo = " + employeeInfo);
         dao.updateInfo(employeeInfo);
        mv.setViewName("redirect:/emplist");
        return mv;
    }

//多条件查询
    @RequestMapping("/selectemp")
    public ModelAndView select(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                               @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize, String eName, Date date1,Date date2,String eDept){

        ModelAndView mv = new ModelAndView();
        List<EmployeeInfo> someinfo = dao.getEmpSomeInfo(eName, date1, date2, eDept, pageNum, pageSize);
        PageInfo<EmployeeInfo> pageInfo = new PageInfo<>(someinfo,5);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("emp/emplst");
        return mv;
    }

}
