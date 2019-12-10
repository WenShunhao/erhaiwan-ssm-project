package com.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class EmpBackupInfo extends EmployeeInfo {
    private Integer eId;
    private String eName;
    private Date eBirthday;
    private String ePhone;
    private String eGender;
    private String eIdcard;
    private Double eSalary;
    private Date eHiredate;
    private Date eLeavedate;
    private String eDept;
    private String eCondition;
    private String eAddress;
    private String eRemark;



}
