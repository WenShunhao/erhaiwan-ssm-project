package com.dao;
import com.entity.Carinfo;
import com.entity.Vipinfo;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface VipinfoDao {
//      获取所有数据(分页)
    List<Vipinfo> getVipAllinfo(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    List<Vipinfo> exportVipAllinfo();
//      多条件查询数据
    List<Vipinfo> getVipSomeinfo(@Param("vName") String vName, @Param("vCard") String vCard,@Param("vGender") String vGender,@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

//      查询车况
Carinfo getCarinfo(@Param("cCarplate")String cCarplate);
//      删除数据
    void delVipinfo(@Param("vCard") String vCard);


//      添加数据
void addVipInfo(Vipinfo vipinfo);
void addCarinfo(@Param("cCarplate")String cCarplate);


//      修改数据
    Vipinfo queryOneinfo(@Param("vCard")String vCard);
    void updateVipinfo(Vipinfo vipinfo);
}
