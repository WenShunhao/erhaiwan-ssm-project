package com.service;

import com.dao.OperatorDao;
import com.entity.OperatorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OperatorService {
    @Autowired
    private OperatorDao dao;

    @Transactional
    OperatorInfo operatorInfo (String oAccount,String oPassword){
       return dao.adminLogin(oAccount,oPassword);
    }
}
