package com.service;

import com.config.ProjectConfig;
import com.dao.OperatorDao;
import com.entity.OperatorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OperatorService {
@Autowired
  public OperatorDao operatorDao;
    @Transactional
    public OperatorInfo Login (String oAccount, String oPassword){
       return operatorDao.adminLogin(oAccount,oPassword);
    }
    public List<OperatorInfo> operatorInfo2(int pageNum, int pageSize){
      return    operatorDao.getAllInfo(pageNum,pageSize);
    }


}
