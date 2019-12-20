package com.service;


import com.dao.VipinfoDao;
import com.entity.Carinfo;
import com.entity.Vipinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//声明service层
@Service
public class VipinfoService {
//    自动装配
    @Autowired
    private VipinfoDao dao;
//    查询所有(分页)
    @Transactional
    public List<Vipinfo> getVipAllInfo(int pageNum, int pageSize){
        return dao.getVipAllinfo(pageNum,pageSize);
    }
    public List<Vipinfo> exportVipAllInfo(){
        return dao.exportVipAllinfo();
    }

//    条件查询
    public List<Vipinfo> getVipSomeinfo(Vipinfo vipinfo,int pageNum, int pageSize){
        return dao.getVipSomeinfo(vipinfo.getvName(),vipinfo.getvCard(),vipinfo.getvGender(),pageNum,pageSize);
    }

    //查询车况
    public Carinfo getCarinfo(String cCarplate){
        return dao.getCarinfo(cCarplate);

    }    //删除操作
    @Transactional
    public void vipDel(String vCard){
        dao.delVipinfo(vCard);
    }

//    添加
    @Transactional
    public void vipadd(Vipinfo vipinfo){
        dao.addVipInfo(vipinfo);
        String cCarplate = vipinfo.getcCarplate();
        dao.addCarinfo(cCarplate);
    }

//    修改
//查询出数据
    public Vipinfo getOne(String vCard){
      return   dao.queryOneinfo(vCard);
    }
//修改操作
    @Transactional
    public void vipedit(Vipinfo vipinfo){
        dao.updateVipinfo(vipinfo);
    }



}
