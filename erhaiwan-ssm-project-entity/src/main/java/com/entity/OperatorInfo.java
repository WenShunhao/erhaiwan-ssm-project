package com.entity;

import lombok.Data;

@Data//lombok -->优化pojo类代码块
public class OperatorInfo {
    //OperatorInfo类的依次各字段：编号、账号、密码、账号类型、员工编号
    private Integer oId;
    private String oAccount;
    private String oPassword;
    private String oType;
    private Integer eId;
}
