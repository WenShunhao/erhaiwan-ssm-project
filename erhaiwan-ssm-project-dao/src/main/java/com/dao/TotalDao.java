package com.dao;

import java.util.Map;

public interface TotalDao {
//会员充值收益统计
    Map<String,Double> getRechargeTotal(String toyear);
//停车收益统计
    Map<String,Double> getParkingTotal(String toyear);
}
