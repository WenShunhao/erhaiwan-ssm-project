package com.dao;

import com.entity.Rechargeinfo;
import org.apache.ibatis.annotations.Param;

public interface RechargeDao {
//    查找操作员编号
    int queryId(@Param("oAccount") String oAccount);
//    查找会员号是否存在
    String findvCard(@Param("vCard")String vCard);
//管理员充值
    void addRecharge(Rechargeinfo rechargeinfo);
    void updateMoney(@Param("vCard")String vCard,@Param("rRecharge") Double rRecharge);


}
