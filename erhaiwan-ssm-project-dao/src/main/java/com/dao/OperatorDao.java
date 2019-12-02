package com.dao;

import com.entity.OperatorInfo;
import org.apache.ibatis.annotations.Param;

public interface OperatorDao {
//    管理员登录验证
    OperatorInfo adminlogin(@Param("oAccount")String oAccount,@Param("oPassword") String oPassword);
}
