package com.service;

import com.dao.EmployeeDao;
import com.entity.EmployeeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeDao dao;
    @Transactional
    public List<EmployeeInfo> getEmpAllInfo(int pageNum,int pageSize){
        return dao.getEmpAllInfo(pageNum,pageSize);
    }
}
