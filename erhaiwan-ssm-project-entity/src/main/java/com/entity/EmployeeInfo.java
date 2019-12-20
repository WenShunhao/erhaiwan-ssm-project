package com.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.sql.Date;
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("employeeinfo")
public class EmployeeInfo {
    private static final long serialVersionUID = 1L;
    @TableId("e_id")
    @Excel(name = "员工编号", width = 20, orderNum = "1")
    private Integer eId;
    @TableId("e_name")
    @Excel(name = "员工姓名", width = 20, orderNum = "2")
    private String eName;
    @TableId("e_birthday")
    @Excel(name = "出生日期", width = 20, orderNum = "3")
    private Date eBirthday;
    @TableId("e_phone")
    @Excel(name = "联系方式", width = 20, orderNum = "4")
    private String ePhone;
    @TableId("e_gender")
    @Excel(name = "性别", width = 20, orderNum = "5")
    private String eGender;
    @TableId("e_idcard")
    @Excel(name = "身份证", width = 20, orderNum = "6")
    private String eIdcard;
    @TableId("e_salary")
    @Excel(name = "工资", width = 20, orderNum = "7")
    private Double eSalary;
    @TableId("e_hiredate")
    @Excel(name = "入职日期", width = 20, orderNum = "8")
    private Date eHiredate;
    @TableId("e_dept")
    @Excel(name = "职位", width = 20, orderNum = "9")
    private String eDept;
    @TableId("e_condition")
    @Excel(name = "状态", width = 20, orderNum = "10")
    private String eCondition;
    @TableId("e_address")
    @Excel(name = "通讯地址", width = 20, orderNum = "11")
    private String eAddress;
    @TableId("e_remark")
    @Excel(name = "备注", width = 20, orderNum = "12")
    private String eRemark;

    public EmployeeInfo() {
    }

    public EmployeeInfo(Integer eId, String eName, Date eBirthday, String ePhone, String eGender, String eIdcard, Double eSalary, Date eHiredate, String eDept, String eCondition, String eAddress, String eRemark) {
        this.eId = eId;
        this.eName = eName;
        this.eBirthday = eBirthday;
        this.ePhone = ePhone;
        this.eGender = eGender;
        this.eIdcard = eIdcard;
        this.eSalary = eSalary;
        this.eHiredate = eHiredate;
        this.eDept = eDept;
        this.eCondition = eCondition;
        this.eAddress = eAddress;
        this.eRemark = eRemark;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public Date geteBirthday() {
        return eBirthday;
    }

    public void seteBirthday(Date eBirthday) {
        this.eBirthday = eBirthday;
    }

    public String getePhone() {
        return ePhone;
    }

    public void setePhone(String ePhone) {
        this.ePhone = ePhone;
    }

    public String geteGender() {
        return eGender;
    }

    public void seteGender(String eGender) {
        this.eGender = eGender;
    }

    public String geteIdcard() {
        return eIdcard;
    }

    public void seteIdcard(String eIdcard) {
        this.eIdcard = eIdcard;
    }

    public Double geteSalary() {
        return eSalary;
    }

    public void seteSalary(Double eSalary) {
        this.eSalary = eSalary;
    }

    public Date geteHiredate() {
        return eHiredate;
    }

    public void seteHiredate(Date eHiredate) {
        this.eHiredate = eHiredate;
    }

    public String geteDept() {
        return eDept;
    }

    public void seteDept(String eDept) {
        this.eDept = eDept;
    }

    public String geteCondition() {
        return eCondition;
    }

    public void seteCondition(String eCondition) {
        this.eCondition = eCondition;
    }

    public String geteAddress() {
        return eAddress;
    }

    public void seteAddress(String eAddress) {
        this.eAddress = eAddress;
    }

    public String geteRemark() {
        return eRemark;
    }

    public void seteRemark(String eRemark) {
        this.eRemark = eRemark;
    }

    @Override
    public String toString() {
        return "EmployeeInfo{" +
                "eId=" + eId +
                ", eName='" + eName + '\'' +
                ", eBirthday=" + eBirthday +
                ", ePhone='" + ePhone + '\'' +
                ", eGender='" + eGender + '\'' +
                ", eIdcard='" + eIdcard + '\'' +
                ", eSalary=" + eSalary +
                ", eHiredate=" + eHiredate +
                ", eDept='" + eDept + '\'' +
                ", eCondition='" + eCondition + '\'' +
                ", eAddress='" + eAddress + '\'' +
                ", eRemark='" + eRemark + '\'' +
                '}';
    }
}
