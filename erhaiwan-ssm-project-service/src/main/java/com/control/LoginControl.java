package com.control;

import com.dao.OperatorDao;
import com.entity.OperatorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class LoginControl {
@Autowired
private OperatorDao dao;
    @RequestMapping("/")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminLogin");
        return mav;
    }

    @RequestMapping("/lndex")
    public ModelAndView login(@Valid OperatorInfo operatorInfo, BindingResult bindingResult, HttpServletRequest req, HttpSession session) throws Exception {
        req.setCharacterEncoding("UTF-8");
        ModelAndView mv = new ModelAndView();
        String oAccount = req.getParameter("oAccount");
        String oPassword = req.getParameter("oPassword");
         operatorInfo = dao.adminLogin(oAccount, oPassword);
        if (bindingResult.hasErrors()) {
            List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError error : errors) {
                mv.addObject(error.getField() + "Error", error.getDefaultMessage());
            }
        }
        if (operatorInfo == null)
        {
            mv.setViewName("adminLogin");
            mv.addObject("error","*账号或密码错误，请检查！");
        } else {
            mv.setViewName("adminIndex");
            session.setAttribute("username",oAccount);


        }
        return mv;

    }

    @RequestMapping("/updateinfo")
    public String test(HttpServletRequest request, Model model){
        String  username = String.valueOf(request.getSession().getAttribute("username"));
        System.out.println("本地账号名是实打实大所大所大="+username);
        model.addAttribute("username",username);
        return "accountinfo";
    }

}
