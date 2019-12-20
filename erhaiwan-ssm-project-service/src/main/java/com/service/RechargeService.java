package com.service;

import com.dao.RechargeDao;
import com.entity.Rechargeinfo;
import com.entity.SetBilling;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RechargeService {
    @Autowired
    private RechargeDao dao;
//查询会员账号是否存在
    public String fingCard(String vCard){
        return dao.findvCard(vCard);
    }
//   查询出操作员编号
    public int finoper(String oAccount){
        return dao.queryId(oAccount);
    }

//操作员充值
    @Transactional
    public void recharge(Rechargeinfo rechargeinfo){
//        添加
        dao.addRecharge(rechargeinfo);
//        修改余额
        String vCard = rechargeinfo.getVCard();
        Double rRecharge =rechargeinfo.getRRecharge();
        dao.updateMoney(vCard,rRecharge);
    }

//   查询停车费用数据
    public Double getfeeinfo1(){
      return  dao.feedata1();
    }
    //   查询停车费用数据
    public Double getfeeinfo2(){
        return  dao.feedata2();
    }

//    修改停车费用
    @Transactional
    public void updatefee(SetBilling setBilling){
        dao.updatefee(setBilling);
    }
}
