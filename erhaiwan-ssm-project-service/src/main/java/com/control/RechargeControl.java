package com.control;

import com.dao.RechargeDao;
import com.entity.Rechargeinfo;
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


@Controller
public class RechargeControl {
    @Autowired
    private RechargeDao dao;

    @RequestMapping("/recharge")
    public ModelAndView recharge(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("recharge");
        return mv;
    }

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
        System.out.println("vCard = " + vCard);

        String findvCard = dao.findvCard(vCard);
        if (findvCard!=null){
            out.println("<font color='green'>√</font>");
        }else{
            out.println("<font color='red'>该账号不存在！！</font>");
        }
        out.flush();//刷新流
        out.close();//关闭流
        return "recharge";

    }

    @RequestMapping("/recharge2")
    @ResponseBody
    public ModelAndView recharge(Rechargeinfo rechargeinfo){
        ModelAndView mv = new ModelAndView();
        //获取用户输入的数据
        String card = dao.findvCard(rechargeinfo.getVCard());
        System.out.println("card = " + card);
        rechargeinfo.setRNum("dwqqd1231231");
        rechargeinfo.setOId(1);
        if (card!=null){
            dao.addRecharge(rechargeinfo);
            dao.updateMoney(rechargeinfo.getVCard(),rechargeinfo.getRRecharge());
            mv.addObject("success","充值成功！！！");
            mv.setViewName("recharge");
            return mv;
        }else{
            mv.addObject("info","无法查找到该账号信息！");
            mv.setViewName("recharge");
            return mv;
        }

    }
}
