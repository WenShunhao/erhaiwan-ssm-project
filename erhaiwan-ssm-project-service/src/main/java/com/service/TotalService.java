package com.service;

import com.dao.TotalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class TotalService {
    @Autowired
    private TotalDao dao;
//    充值统计
    public Map<String, Double> getRechargeTotal(String toyear){
        return dao.getRechargeTotal(toyear);
    }

//    停车统计
    public Map<String, Double> getParkingTotal(String toyear){
        return  dao.getParkingTotal(toyear);
    }
}
