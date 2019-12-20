package com.dao;

import com.entity.Parkinginfo;
import com.entity.Vipinfo;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

public interface ParkingDao {
//    查询所有正在停车的数据(分页)
    List<Parkinginfo> getAllParkinginfo(@Param("pageNum")int pageNum,@Param("pageSize") int pageSize);
//登记临时用户
    void addLsparking(Parkinginfo parkinginfo);

//    登记会员用户
//      修改数据
Vipinfo getOneinfo(@Param("vCard")String vCard);
void addVipparking(Parkinginfo parkinginfo);

//多条件查询
//      多条件查询数据
List<Parkinginfo> getParkinginfo(@Param("vPhone") String vPhone, @Param("date1") Date date1, @Param("date2") Date date2, @Param("pType") String pType, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);
//获取当前收费标准

//计算结算费用
    Double jscost(@Param("pEntrytime") String pEntrytime, @Param("pLeavetime") String pLeavetime);

    //临时客户交易完成
    void overParking(Parkinginfo parkinginfo);
    Parkinginfo getOverinfo(@Param("pNum") int pNum);


//    //会员客户交易完成
//    //1查询出当前会员的余额
//    Double res(@Param("vCard") String vCard);
//    //2修改会员里 的余额
//    void vipPay(@Param("vCard") String vCard,@Param("pCost") Double pCost);
//    //3修改数据
//    void overVipparking(Parkinginfo parkinginfo);

}
