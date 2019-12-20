package com.control;

import com.dao.EmpBackupDao;
import com.entity.EmpBackupInfo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class EmpBackupControl {
    @Autowired
    private EmpBackupDao dao;

//员工列表
    @RequestMapping("/empbackuplist")
    public ModelAndView list(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize){
        ModelAndView mv = new ModelAndView();
        List<EmpBackupInfo> all = dao.getEmpbackupAllInfo(pageNum, pageSize);
        PageInfo<EmpBackupInfo> pageInfo = new PageInfo<>(all,5);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("emp/empbackup");
        return mv;

    }
    //删除员工信息
    @RequestMapping("/delbkemp")
    public ModelAndView del(Integer eId){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值"+eId);
        dao.delbkInfo(eId);
        mv.setViewName("forward:empbackuplist");
        return mv;

    }



}
