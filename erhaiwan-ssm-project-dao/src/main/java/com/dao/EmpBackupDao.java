package com.dao;

import com.entity.EmpBackupInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpBackupDao {
    //    获取所有数据(分页)
    List<EmpBackupInfo> getEmpbackupAllInfo(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);
//    删除数据
    void delbkInfo(@Param("eId")int eId);
}
