package com.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;


@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("vipinfo")
public class Vipinfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId("v_card")
    @Excel(name = "会员卡号", width = 20, orderNum = "1")
    private String vCard;
    @TableId("v_password")
    @Excel(name = "密码", width = 20, orderNum = "2")
    private String vPassword;
    @TableId("v_name")
    @Excel(name = "持卡人", width = 20, orderNum = "3")
    private String vName;
    @TableId("v_balance")
    @Excel(name = "余额", width = 20, orderNum = "4")
    private Double vBalance;
    @TableId("c_carplate")
    @Excel(name = "车牌号", width = 20, orderNum = "5")
    private String cCarplate;
    @TableId("v_birthday")
    @Excel(name = "出生日期", width = 20, orderNum = "6")
    private String vBirthday;
    @TableId("v_gender")
    @Excel(name = "性别", width = 20, orderNum = "7")
    private String vGender;
    @TableId("v_address")
    @Excel(name = "通讯地址", width = 20, orderNum = "8")
    private String vAddress;
    @TableId("v_condition")
    @Excel(name = "状态", width = 20, orderNum = "9")
    private String vCondition;

    public Vipinfo() {
    }

    public Vipinfo(String vCard, String vPassword, String vName, Double vBalance, String cCarplate, String vBirthday, String vGender, String vAddress, String vCondition) {
        this.vCard = vCard;
        this.vPassword = vPassword;
        this.vName = vName;
        this.vBalance = vBalance;
        this.cCarplate = cCarplate;
        this.vBirthday = vBirthday;
        this.vGender = vGender;
        this.vAddress = vAddress;
        this.vCondition = vCondition;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getvCard() {
        return vCard;
    }

    public void setvCard(String vCard) {
        this.vCard = vCard;
    }

    public String getvPassword() {
        return vPassword;
    }

    public void setvPassword(String vPassword) {
        this.vPassword = vPassword;
    }

    public String getvName() {
        return vName;
    }

    public void setvName(String vName) {
        this.vName = vName;
    }

    public Double getvBalance() {
        return vBalance;
    }

    public void setvBalance(Double vBalance) {
        this.vBalance = vBalance;
    }

    public String getcCarplate() {
        return cCarplate;
    }

    public void setcCarplate(String cCarplate) {
        this.cCarplate = cCarplate;
    }

    public String getvBirthday() {
        return vBirthday;
    }

    public void setvBirthday(String vBirthday) {
        this.vBirthday = vBirthday;
    }

    public String getvGender() {
        return vGender;
    }

    public void setvGender(String vGender) {
        this.vGender = vGender;
    }

    public String getvAddress() {
        return vAddress;
    }

    public void setvAddress(String vAddress) {
        this.vAddress = vAddress;
    }

    public String getvCondition() {
        return vCondition;
    }

    public void setvCondition(String vCondition) {
        this.vCondition = vCondition;
    }

    @Override
    public String toString() {
        return "Vipinfo{" +
                "vCard='" + vCard + '\'' +
                ", vPassword='" + vPassword + '\'' +
                ", vName='" + vName + '\'' +
                ", vBalance=" + vBalance +
                ", cCarplate='" + cCarplate + '\'' +
                ", vBirthday=" + vBirthday +
                ", vGender='" + vGender + '\'' +
                ", vAddress='" + vAddress + '\'' +
                ", vCondition='" + vCondition + '\'' +
                '}';
    }
}
