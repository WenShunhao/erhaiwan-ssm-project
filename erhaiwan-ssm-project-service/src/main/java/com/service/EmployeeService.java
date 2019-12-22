package com.service;

import com.dao.EmployeeDao;
import com.entity.EmployeeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.sql.Date;
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
    public List<EmployeeInfo> exportVipAllInfo(){
        return dao.exportEmpAllInfo();
    }
//备份操作
    @Transactional
    public void empBackup(int eId){
        EmployeeInfo info = dao.queryOne(eId);
        dao.delInfo(eId);
        dao.addBackupInfo(info);
    }
//    添加
    @Transactional
    public void empadd(EmployeeInfo employeeInfo){
        dao.addEmpInfo(employeeInfo);
    }
//    修改
    @Transactional
    public void empuedit(EmployeeInfo employeeInfo){
        dao.updateInfo(employeeInfo);
    }
//    多条件查询
    @Transactional
    public List<EmployeeInfo> getEmpSomeInfo(String eName, Date date1, Date date2, String eDept, int pageNum, int pageSize){
        return dao.getEmpSomeInfo(eName, date1, date2, eDept, pageNum, pageSize);
    }
}
