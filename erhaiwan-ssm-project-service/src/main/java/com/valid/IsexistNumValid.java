package com.valid;

import com.dao.RechargeDao;
import com.service.OperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class IsexistNumValid implements ConstraintValidator<IsexistNum,String> {
    @Autowired
    private RechargeDao dao;

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        String vCard = dao.findvCard(value);
            if (vCard != null) {
                return true;//账号存在
            }else {
               return false;//账号不存在,返回异常信息
        }

    }

}



