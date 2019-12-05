package com.entity;

import com.valid.IsNotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data//lombok -->优化pojo类代码块
public class OperatorInfo {
    //OperatorInfo类的依次各字段：编号、账号、密码、账号类型、员工编号
    private Integer oId;
    @IsNotNull
    private String oAccount;
    @Length(min = 3,max = 20,message = "详细信息：密码长度为3-20位")
    private String oPassword;
    private String oType;
    private Integer eId;
}
