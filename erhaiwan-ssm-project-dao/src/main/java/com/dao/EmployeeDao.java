package com.dao;

import com.entity.EmpBackupInfo;
import com.entity.EmployeeInfo;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

public interface EmployeeDao {
//    获取所有数据(分页)
    List<EmployeeInfo> getEmpAllInfo(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);

//    删除数据+备份数据
    EmployeeInfo queryOne(@Param("eId")int eId);
    void delInfo(@Param("eId")int eId);
    void addBackupInfo(EmployeeInfo employeeInfo);

//    添加数据
void addEmpInfo(EmployeeInfo employeeInfo);

//多条件查询数据
    List<EmployeeInfo> getEmpSomeInfo(@Param("eName") String eName, @Param("date1") Date date1,@Param("date2") Date date2,@Param("eDept") String eDept,@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);

//    修改数据
    void updateInfo(EmployeeInfo employeeInfo);
}
