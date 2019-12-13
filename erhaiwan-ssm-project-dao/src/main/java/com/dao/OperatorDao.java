package com.dao;

import com.entity.OperatorInfo;
import org.apache.ibatis.annotations.Param;


import java.util.List;


public interface OperatorDao {
//    管理员登录验证
    OperatorInfo adminLogin(@Param("oAccount")String oAccount,@Param("oPassword") String oPassword);
    List<OperatorInfo> getAllInfo(@Param("pageNum")int pageNum, @Param("pageSize")int pageSize);
    String  selectByloginname(@Param("oAccount") String oAccount);

//充值验证号码


}
