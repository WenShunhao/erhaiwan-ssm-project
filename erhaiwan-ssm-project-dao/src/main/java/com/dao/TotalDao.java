package com.dao;

import java.util.Map;

public interface TotalDao {

    Map<String,Double> getRechargeTotal(String toyear);

    Map<String,Double> getParkingTotal(String toyear);
}
