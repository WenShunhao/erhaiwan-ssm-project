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
  private OperatorDao operatorDao;
    @Transactional
    public OperatorInfo operatorInfo (String oAccount, String oPassword){
       return operatorDao.adminLogin("admin","123456");
    }
    public List<OperatorInfo> operatorInfo2(int pageNum, int pageSize){
      return    operatorDao.getAllInfo(pageNum,pageSize);
    }

    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(ProjectConfig.class);
        OperatorService service = context.getBean(OperatorService.class);
//        OperatorInfo oper = service.operatorInfo("admin", "123456");
        List<OperatorInfo> oper2 =service.operatorInfo2(1,3);
        System.out.println(oper2);
//        System.out.println(oper);
    }
}
