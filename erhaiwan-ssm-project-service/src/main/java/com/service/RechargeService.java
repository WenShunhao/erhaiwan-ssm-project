package com.service;

import com.dao.RechargeDao;
import com.entity.Rechargeinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RechargeService {
    @Autowired
    private RechargeDao dao;
    @Transactional
    public String fingCard(String vCard){
        return dao.findvCard(vCard);
    }

//操作员充值
    @Transactional
    public void recharge(Rechargeinfo rechargeinfo,String oAccount){
//        查询
        int oId = dao.queryId(oAccount);
        rechargeinfo.setOId(oId);
//        添加
        dao.addRecharge(rechargeinfo);
//        修改余额
        String vCard = rechargeinfo.getVCard();
        Double rRecharge =rechargeinfo.getRRecharge();
        dao.updateMoney(vCard,rRecharge);
    }
}
