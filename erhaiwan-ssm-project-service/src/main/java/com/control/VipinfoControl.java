package com.control;


import com.entity.Carinfo;
import com.entity.Vipinfo;
import com.github.pagehelper.PageInfo;
import com.service.VipinfoService;
import com.tool.ExcleExportImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class VipinfoControl {
    @Autowired
    private VipinfoService service;
//        转换时间格式
    @InitBinder
    public void xxxx(WebDataBinder dataBinder) {
        DateFormatter dateFormatter = new DateFormatter();
        dateFormatter.setPattern("yyyy-MM-dd");
        dataBinder.addCustomFormatter(dateFormatter);
    }

//会员信息列表
    @RequestMapping("/viplist")
    public ModelAndView viplst(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                              @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize){
        ModelAndView mv = new ModelAndView();
        List<Vipinfo> all = service.getVipAllInfo(pageNum, pageSize);
        PageInfo<Vipinfo> pageInfo = new PageInfo<>(all,5);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("xx",123);
        mv.setViewName("vip/viplst");
        return mv;

    }

//打印会员信息
    @RequestMapping("/exportvip")
    public void exportVip(HttpServletResponse response){
        try{
        List<Vipinfo> all = service.exportVipAllInfo();
        ExcleExportImp.exportExcel(all,Vipinfo.class,"会员信息列表","详情信息表",response);
         } catch (Exception e) {
        e.printStackTrace();
         }
    }
//    查询车况(未完善)
    @RequestMapping("/carcondition")
    public String carinfo(String cCarplate, HttpSession session){
        Carinfo carinfo = service.getCarinfo(cCarplate);
        System.out.println("xxxx"+carinfo);
        System.out.println("xxxx"+carinfo.getCBrand());
        session.setAttribute("carinfo",carinfo);
        return "";

    }

//删除会员信息
    @RequestMapping("/delvip")
    public ModelAndView delvip(String vCard){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的vCard值"+vCard);
        service.vipDel(vCard);
        mv.setViewName("forward:viplist");
        return mv;

    }
//添加会员页面
    @RequestMapping("/addvipui")
    public ModelAndView addvipui(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("vip/vipadd");
        return mav;
    }
//添加员工
    @RequestMapping("/addvip")
    @ResponseBody
    public ModelAndView addvip(Vipinfo vipinfo){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值"+vipinfo);
        service.vipadd(vipinfo);
        mv.setViewName("vip/vipadd");
        return mv;
    }


    //修改界面
    @RequestMapping("/updatevipui")
    public ModelAndView updatevipui(String vCard){
        ModelAndView mav = new ModelAndView();
        System.out.println("传过来的vCard值 = " + vCard);
        Vipinfo vipinfo = service.getOne(vCard);
        mav.addObject("vip",vipinfo);
        mav.setViewName("vip/vipupdate");
        return mav;
    }
//修改操作
    @RequestMapping("/updatevip")
    public ModelAndView updatevip(Vipinfo vipinfo){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值vipinfo = " + vipinfo);
        service.vipedit(vipinfo);
        mv.setViewName("redirect:/viplist");
        return mv;
    }

    //多条件查询
    @RequestMapping("/selectvip")
    public ModelAndView selectvip(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                               @RequestParam(value = "pageSize",required = false,defaultValue = "8")Integer pageSize, Vipinfo vipinfo){

        ModelAndView mv = new ModelAndView();
        List<Vipinfo> someinfo = service.getVipSomeinfo(vipinfo,pageNum, pageSize);
        PageInfo<Vipinfo> pageInfo = new PageInfo<>(someinfo,5);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("vip/viplst");
        return mv;
    }


}
