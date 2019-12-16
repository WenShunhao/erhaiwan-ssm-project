select o_id, o_account, o_password, o_type, e_id from operatorinfo where o_account = 'admin' and o_Password= '123456';
select e_id, e_name, e_birthday, e_phone, e_gender, e_idcard, e_salary, e_hiredate, e_dept, e_condition, e_address, e_remark from employeeinfo;


create table operatorinfo(
                             o_id INT PRIMARY KEY AUTO_INCREMENT COMMENT'编号',
                             o_account VARCHAR(20) NOT NULL COMMENT'登录账号',
                             o_password VARCHAR(20) NOT NULL COMMENT'登录密码',
                             o_type VARCHAR(10) NOT NULL COMMENT'账号类型',
                             e_id INT COMMENT '员工编号',
                             FOREIGN KEY(e_id) REFERENCES employeeinfo(e_id)
)ENGINE = innodb COMMENT '系统操作信息表';

--  员工信息备份表
CREATE TABLE IF NOT EXISTS employeeinfobackup(
                                           e_id INT PRIMARY KEY COMMENT '员工编号',
                                           e_name VARCHAR(20) NOT NULL COMMENT '姓名',
                                           e_birthday DATE NULL COMMENT '出生日期',
                                           e_phone varchar(11) COMMENT '手机号',
                                           e_gender CHAR(4) NOT NULL  COMMENT '性别',
                                           e_idcard CHAR(18) NOT NULL COMMENT '身份证',
                                           e_salary DOUBLE COMMENT '工资',
                                           e_hiredate DATE NOT NULL  COMMENT '入职日期',
                                           e_leavedate DATE  COMMENT '离职日期',
                                           e_dept VARCHAR(20) NOT NULL COMMENT '职位',
                                           e_condition VARCHAR(10) DEFAULT '离职' COMMENT '状态',
                                           e_address VARCHAR(50)  COMMENT '家庭住址',
                                           e_remark VARCHAR(100)  COMMENT '备注'
)ENGINE = InnoDB COMMENT '员工离职信息表';
alter table employeeinfobackup change e_leavedate e_leavedate timestamp not null default NOW();

insert  into employeeinfobackup(e_id, e_name, e_birthday, e_phone, e_gender, e_idcard, e_salary, e_hiredate, e_dept, e_address, e_remark)
VALUES(12,'温顺豪','2000-10-09','13049618318','男','44162120001009595X',1000.0,'2012-10-02','总裁','广东河源','3')
;


insert into employeeinfo(e_name, e_birthday,
                         e_phone, e_gender, e_idcard,
                         e_salary, e_hiredate, e_dept,
                         e_condition, e_address, e_remark)
VALUES ('温顺豪',
        '2000-10-09','13049618318','男',
        '44162120001009595X',1000.0,'2012-10-02',
        '总裁','正式工','广东河源','这是个无业游民，被Boss挖掘的')


-- 会员汽车信息表
CREATE TABLE carinfo
(
    c_carplate VARCHAR(20) PRIMARY KEY COMMENT '车牌号',
    c_brand    VARCHAR(20) COMMENT '汽车品牌',
    c_type     VARCHAR(20) COMMENT '汽车类型',
    c_color    VARCHAR(20) COMMENT '汽车颜色',
    c_seat     INT COMMENT '汽车座位数'
)ENGINE = InnoDB COMMENT '会员汽车信息表';

-- 会员信息表
CREATE TABLE vipinfo(
    v_card INT PRIMARY KEY COMMENT '会员卡号/手机号',
    v_password VARCHAR(20) COMMENT '密码',
    v_name VARCHAR(20) COMMENT '持卡人姓名',
    v_balance DOUBLE DEFAULT '0' COMMENT '余额',
    v_carplate VARCHAR(20) COMMENT '关联车牌号',
    v_birthday Date COMMENT '出生日期',
    v_gender VARCHAR(4) COMMENT '性别',
    v_address VARCHAR(50) COMMENT '通讯地址',
    v_condition VARCHAR(10) COMMENT '状态',
        foreign key(v_carplate) references carinfo(c_carplate)
)ENGINE = InnoDB COMMENT '会员信息表';

-- 会员充值表
CREATE TABLE rechargeinfo(
    r_num INT PRIMARY KEY COMMENT '充值编号',
    v_card VARCHAR(12) COMMENT '会员卡号',
    r_recharge DOUBLE COMMENT '充值金额',
    r_payway VARCHAR(20) COMMENT '支付方式',
    o_id INT COMMENT '操作员工编号',
    r_time DATETIME COMMENT '交易时间',
    r_remark VARCHAR(50) COMMENT '交易备注',
    FOREIGN KEY(v_card) REFERENCES vipinfo(v_card),
    FOREIGN KEY (o_id) REFERENCES operatorinfo(o_id)
)ENGINE = InnoDB COMMENT '会员充值信息表';
alter table rechargeinfo change r_time r_time timestamp not null default NOW();



-- 计费标准设置表
CREATE TABLE setbilling(
    b_ordinarytime INT COMMENT '计时/小时(临时客户)',
    b_ordinaryfee DOUBLE COMMENT '费用(临时客户)',
    b_viptime INT COMMENT '计时/小时(会员客户)',
    b_vipfee DOUBLE COMMENT '费用(会员客户)'
)ENGINE = InnoDB COMMENT '计费标准设置表';