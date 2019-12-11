package com.service;

import com.dao.EmployeeDao;
import com.entity.EmpBackupInfo;
import com.entity.EmployeeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
//声明service层
@Service
public class EmployeeService {
//    自动装配
    @Autowired
    private EmployeeDao dao;
//    查询所有(分页)
    @Transactional
    public List<EmployeeInfo> getEmpAllInfo(int pageNum,int pageSize){
        return dao.getEmpAllInfo(pageNum,pageSize);
    }
//备份操作
    @Transactional
    public void empBackup(int eId){
        EmployeeInfo info = dao.queryOne(eId);
        dao.delInfo(eId);
        dao.addBackupInfo(info);
    }
    @Transactional
    public void empadd(EmployeeInfo employeeInfo){
        dao.addEmpInfo(employeeInfo);
    }
}
