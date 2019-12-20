package com.service;

import com.dao.ParkingDao;
import com.entity.Parkinginfo;
import com.entity.Vipinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service
public class ParkingService {
    @Autowired
    private ParkingDao dao;




//    查询所有数据
    @Transactional
   public  List<Parkinginfo> getAllParkinginfo(int pageNum,int pageSize){
      return  dao.getAllParkinginfo(pageNum,pageSize);
    }
    //    多条件查询
    @Transactional
    public List<Parkinginfo> getParkinginfo(String vPhone, Date date1, Date date2, String pType, int pageNum, int pageSize){
        return dao.getParkinginfo(vPhone, date1, date2, pType, pageNum, pageSize);
    }
//登记临时客户
    public void addLsparking(Parkinginfo parkinginfo){
        dao.addLsparking(parkinginfo);
    }
//查询会员信息并登记
    public Vipinfo getOneinfo(String vCard){
        return dao.getOneinfo(vCard);

    }
    @Transactional
    public void addVipparking(Parkinginfo parkinginfo){
        dao.addVipparking(parkinginfo);
    }

//    结算
    public Double jsCost(String pEntrytime, String pLeavetime){
      return   dao.jscost(pEntrytime,pLeavetime);
    }

    @Transactional
    public void overParking(Parkinginfo parkinginfo){
        dao.overParking(parkinginfo);
    }

    @Transactional
    public void vipCommit(Parkinginfo parkinginfo){
//    先提交订单
//    后修改会员卡余额
//
    }
    public Parkinginfo getOverinfo(Integer pNum){
        return dao.getOverinfo(pNum);
    }

}
