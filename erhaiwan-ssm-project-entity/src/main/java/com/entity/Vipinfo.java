package com.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class Vipinfo {
    private String vCard;
    private String vPassword;
    private String vName;
    private Double vBalance;
    private String cCarplate;
    private Date vBirthday;
    private String vGender;
    private String vAddress;
    private String vCondition;


}
