package com.control;

import com.entity.Parkinginfo;
import com.entity.Vipinfo;
import com.github.pagehelper.PageInfo;
import com.service.ParkingService;
import com.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class ParkingControl {
    @Autowired
    private RechargeService dao;
    @Autowired
    private ParkingService service;


    //查询所有正在停车的数据
    @RequestMapping("/parkinglst")
    @ResponseBody
    public ModelAndView parkinglst(@RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                   @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        ModelAndView mv = new ModelAndView();
        List<Parkinginfo> parkinginfo = service.getAllParkinginfo(pageNum, pageSize);
        PageInfo<Parkinginfo> pageInfo = new PageInfo<>(parkinginfo, 5);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("parking/parkinglst");
        return mv;
    }

    //    条件查询
//多条件查询
    @RequestMapping("/selectparking")
    public ModelAndView select(@RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pageSize", required = false, defaultValue = "8") Integer pageSize, String vPhone, String date1, String date2, String pType) {

        ModelAndView mv = new ModelAndView();
        Date dates1= Date.valueOf(date1);
        Date dates2= Date.valueOf(date2);
        List<Parkinginfo> someinfo = service.getParkinginfo(vPhone, dates1, dates2, pType, pageNum, pageSize);
        PageInfo<Parkinginfo> pageInfo = new PageInfo<>(someinfo, 5);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("parking/parkinglst");
        return mv;
    }


    @RequestMapping("/addls")
    public ModelAndView addLsparking(Parkinginfo parkinginfo, MultipartFile picture) {
        ModelAndView mv = new ModelAndView();
//        System.out.println("传过来的照片xxx"+picture);
        String filename = picture.getOriginalFilename();
        String path = filename;
        File file = new File(path);

        try {
            picture.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String pPicture = String.valueOf(file);
        parkinginfo.setPPicture(pPicture);
        service.addLsparking(parkinginfo);
        mv.setViewName("redirect:/parkinglst");
        return mv;
    }

    //异步请求 判断账号情况
    @PostMapping("/panduan2")
    @ResponseBody
    public String panduan2(HttpServletResponse response, HttpServletRequest request) throws Exception {
        //获取用户输入的数据
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        String vCard = request.getParameter("vCard");
//        测试
        System.out.println("vCardyyy = " + vCard);
        String findvCard = dao.fingCard(vCard);
//        System.out.println("xxx"+findvCard);
        if (findvCard != null) {
            out.println("<font color='green'>√</font>");
        } else {
            out.println("<font color='red'>该会员账号不存在！！</font>");
        }
        out.flush();//刷新流
        out.close();//关闭流
        return "parking/parkinglst";

    }


    @RequestMapping("/addvipparkingui")
    @ResponseBody
    public String addvipparkingui(String vCard, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的xxx" + vCard);
        Vipinfo oneinfo = service.getOneinfo(vCard);
        session.setAttribute("info", oneinfo);
        return "0";
    }


    @RequestMapping("/addvipparking")
    public ModelAndView addvipparking(Parkinginfo parkinginfo, MultipartFile picture2) {
        ModelAndView mv = new ModelAndView();
//        System.out.println("传过来的照片xxx"+picture);
        String filename = picture2.getOriginalFilename();
        String path = filename;
        File file = new File(path);

        try {
            picture2.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String pPicture = String.valueOf(file);
//        图片与手机号
        parkinginfo.setPPicture(pPicture);
        parkinginfo.setVPhone(parkinginfo.getVCard());

        service.addVipparking(parkinginfo);
        mv.setViewName("redirect:/parkinglst");
        return mv;
    }
//    结算界面
    @RequestMapping("/overparkingui")
    public ModelAndView overui(Integer pNum){
        ModelAndView mv = new ModelAndView();
        System.out.println("传过来的值pNum"+pNum);
        java.util.Date datetime = new java.util.Date();
        DecimalFormat df   = new DecimalFormat("######0.00");
        SimpleDateFormat leave = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("获取当前时间："+leave.format(datetime));
//        时间戳  设置离开时间，和获取总共需要的时间
        Parkinginfo overinfo = service.getOverinfo(pNum);
        overinfo.setPLeavetime(leave.format(datetime));
        Double ptime = service.jsCost(overinfo.getPEntrytime(), overinfo.getPLeavetime());
//        判断客户类型  设置pCost费用
        if (overinfo.getPType().equals("会员客户")){
        Double vipfee = dao.getfeeinfo2() * ptime;
        System.out.println("费用哦"+Double.valueOf(df.format(vipfee)));
        overinfo.setPCost(Double.valueOf(df.format(vipfee)));
            mv.addObject("overinfo",overinfo);
            mv.setViewName("parking/parkingover");
        }else if (overinfo.getPType().equals("临时客户")){
            Double lsfee = dao.getfeeinfo1() * ptime;
            System.out.println("费用哦"+lsfee);
            overinfo.setPCost(Double.valueOf(df.format(lsfee)));
            mv.addObject("overinfo",overinfo);
            mv.setViewName("parking/parkinglsover");
        }


        return mv;
    }


    //    结算
    @RequestMapping("/overparking")
    public ModelAndView over(Parkinginfo parkinginfo) {
        ModelAndView mv = new ModelAndView();
        java.util.Date datetime = new java.util.Date();
        SimpleDateFormat leave = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        设置时间戳
        parkinginfo.setPLeavetime(leave.format(datetime));
//        设置当前停车情况
            parkinginfo.setPCondition("交易完成");
        System.out.println("传过来的结算值："+parkinginfo);
            service.overParking(parkinginfo);
            mv.setViewName("redirect:/parkinglst");
        return mv;
    }

    @RequestMapping("/testsj")
    public ModelAndView test(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Income");
        return mv;

    }
}
