package com.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class Rechargeinfo {
    private String  rNum;
    private String vCard;
    private Double rRecharge;
    private String rPayway;
    private Integer oId;
    private String rIssself;
    private Date rTime;
    private String rRemark;


}
