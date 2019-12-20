package com.service;

import com.dao.EmpBackupDao;
import com.entity.EmpBackupInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//声明service层
@Service
public class EmpBackupService {
//    自动装配
    @Autowired
    private EmpBackupDao dao;
//    查询所有(分页)
    @Transactional
    public List<EmpBackupInfo> getEmpAllInfo(int pageNum, int pageSize){
        return dao.getEmpbackupAllInfo(pageNum,pageSize);
    }

    //备份操作
    @Transactional
    public void delbkInfo(int eId){
        dao.delbkInfo(eId);
    }
}
