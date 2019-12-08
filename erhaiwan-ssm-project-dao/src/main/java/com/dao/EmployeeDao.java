package com.dao;

import com.entity.EmployeeInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
//    获取所有数据(分页)
    List<EmployeeInfo> getEmpAllInfo(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);
}
