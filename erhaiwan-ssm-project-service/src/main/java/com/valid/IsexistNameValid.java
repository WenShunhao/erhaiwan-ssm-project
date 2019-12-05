package com.valid;

import com.service.OperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class IsexistNameValid implements ConstraintValidator<IsexistName,String> {
    @Autowired
    private OperatorService dao;

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        String username = dao.selectByloginname(value);
            if (username != null) {
                return true;//账号存在
            }else {
               return false;//账号不存在
        }

    }

}



