package com.control;
import com.entity.Rechargeinfo;
import com.entity.SetBilling;
import com.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
public class RechargeControl {
    @Autowired
    private RechargeService dao;

//显示停车费用数据
    @RequestMapping("/recharge")
    public ModelAndView recharge(){
        ModelAndView mv = new ModelAndView();
        Double info1 = dao.getfeeinfo1();
        Double info2 = dao.getfeeinfo2();
        mv.addObject("info1",info1);
        mv.addObject("info2",info2);
        mv.setViewName("recharge");
        return mv;
    }
//    修改停车费用
@RequestMapping("/updatefee")
public ModelAndView updateemp(SetBilling setBilling){
    ModelAndView mv = new ModelAndView();
    System.out.println("传过来的值employeeInfo = " + setBilling);
    dao.updatefee(setBilling);
    mv.setViewName("redirect:/recharge");
    return mv;
}
//异步请求 判断账号情况
    @PostMapping("/panduan")
    @ResponseBody
    public String panduan(HttpServletResponse response , HttpServletRequest request)throws Exception{
        //获取用户输入的数据
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("utf-8");
        String vCard = request.getParameter("vCard");
//        测试
//        System.out.println("vCardyyy = " + vCard);
        String findvCard = dao.fingCard(vCard);
//        System.out.println("xxx"+findvCard);
        if (findvCard!=null){
            out.println("<font color='green'>√</font>");
        }else {
            out.println("<font color='red'>该会员账号不存在！！</font>");
        }
        out.flush();//刷新流
        out.close();//关闭流
        return "recharge";

    }
//充值
    @RequestMapping("/surerecharge")
    @ResponseBody
    public ModelAndView recharge2(Rechargeinfo rechargeinfo,String username){
        ModelAndView mv = new ModelAndView();
//        查询操作员工
//        System.out.println(username);
        int oId = dao.finoper(username);
        rechargeinfo.setOId(oId);
        rechargeinfo.setRNum("020"+random());
        System.out.println("值"+rechargeinfo);
        dao.recharge(rechargeinfo);
        mv.setViewName("recharge");

        return mv;
    }
//随机充值订单编号
    public static int random(){
        SimpleDateFormat formatter2 = new SimpleDateFormat ("yyyyMMddHHmmss");
        Date curDate = new Date(System.currentTimeMillis());//获取当前时间
        String str = formatter2.format(curDate);
        String cur = str.substring(0,2);
        String cur2 = str.substring(2,4);
        String temp = (Integer.parseInt(cur)+Integer.parseInt(cur2))+""+str.substring(4);
        int cur_id = Integer.parseInt(temp.substring(0,4))+Integer.parseInt(temp.substring(4));
        return cur_id;
    }




}
