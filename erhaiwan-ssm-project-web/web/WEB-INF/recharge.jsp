<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-13
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>充值缴费</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <style>
        .Paytitle{
            margin-right: 20px;
            text-align: right;
            font-family: 华文中宋;
            font-size: 18px;
        }
        .ziti{
            font-family: 华文中宋;
            font-size: 15px;
        }

        #Paypage{


            margin-top: 35px;
            margin-left: 320px;
            width: 520px;
            height: 350px;

        }
        .moneykuang{
            float: left;
            margin-right: 15px;
            width: 64px;
            height: 24px;
            border: 1px solid lightgray;
            text-align: center;
            padding-top: 8px;
            cursor: pointer;
        }
        .zz{
            cursor: pointer;
        }

        .moneykuang:hover{
            background-color: sandybrown;
        }



        .shezhi{
            text-align: center;

            width: 600px;
            height: 150px;
            font-family: 华文中宋;
            font-size: 18px;

        }

    </style>
</head>
<body>
<br />
<div class="Paytitle" style="text-align:right">充值缴费区>></div>
<hr />
<div id="Paypage">
    <form>
        <div id="VipPhone">
            <label class="layui-form-label ziti">充值号码：</label>
            <div class="layui-input-block">
                <input type="text" name="title" maxlength="11" required lay-verify="required" placeholder="请输入11位手机号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <br>
        <label class="layui-form-label ziti">充值金额：</label>
        <div class="layui-input-block">
            <div class="moneykuang" id="money1" name="money1" value="30" onclick="select(this)" >
                <label class="zz">30元</label>
            </div>
            <div class="moneykuang" id="money2" name="money2" value="50" onclick="select(this)">
                <label class="zz">50元</label>
            </div>
            <div class="moneykuang" id="money3" name="money3" value="100" onclick="select(this)">
                <label class="zz">100元</label>
            </div>
            <div class="moneykuang" id="money4" name="money4" value="200" onclick="select(this)">
                <label class="zz">200元</label>
            </div>
            <div class="moneykuang" id="money5" name="money5" value="200" onclick="select(this)">
                <label class="zz">500元</label>
            </div>

            <br />
            <br />
            <br />
            <input type="text" id="money" name="money"  placeholder="¥请输入充值金额"  class="layui-input"
                    style="margin-top: 10px;">
        </div>

        <br />
        <br />
        <input onclick="openDialog()" type="button" value="下一步" class="layui-btn layui-btn-radius layui-btn-danger"
               style="width: 220px;height: 50px; border-radius: 4px; margin-left: 150px;" />
    </form>
    <br>
    <br>


</div>
<br>
<hr />
<div class="Paytitle" style="text-align:right">收费标准设置区>></div>
<br>
<br>

<form method="post">

    <table align="center" cellpadding="1" cellspacing="1" class="shezhi" border="1">
        <tr>
            <td>客户类型</td>
            <td>费用(￥元)</td>
            <td>计时</td>
        </tr>

        <tr>
            <td>临时客户</td>
            <td><input type="text" name="fee1" required lay-verify="required" placeholder="¥费用" autocomplete="off" class="layui-input"
                       value="" style="border: 0px; border-bottom: 1px solid gray;"></td>
            <td><label>每小时/h</label></td>
        </tr>
        <tr>
            <td>会员客户</td>
            <td><input type="text" name="fee2" required lay-verify="required" placeholder="¥费用" autocomplete="off" class="layui-input"
                       value="" style="border: 0px; border-bottom: 1px solid gray;"></td>
            <td><label>每小时/h</label></td>
        </tr>

    </table>
    <br>
    <br>
    <input type="submit"  value="保存修改" onclick="closeDialog()" class="layui-btn layui-btn-normal" style="width: 220px;height: 50px; border-radius: 4px;margin-left: 470px;" />
    <br>
    <br>
    <br>
</form>





<!--支付页面-->
<div id="light" class="white_content" style="height: 440px">

    <h2 align="center" style="margin-top: 20px;">-----------------------支付页面-----------------------</h2>
    <form action="" method="post">
        <label class="layui-form-label ziti">会员卡号：</label>
        <div class="layui-input-block">
            <input type="text" name="vId" value="" class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px"
                   readonly="readonly">
        </div>
        <br>
        <label class="layui-form-label ziti">充值金额：</label>
        <div class="layui-input-block">
            <input type="text" name="vMoney"  class="layui-input" style="border: 0px;color: red;font-size: 18px" readonly="readonly">
        </div>
        <br>
        <label class="layui-form-label ziti">充值方式：</label>
        <div class="layui-input-block"  >
        <select name="payWay" style="margin-top: 8px;width: 200px;height: 25px" >
            <option value="weixin">微信支付</option>
            <option value="zhifubao">支付宝支付</option>
            <option value="xianjin">现金支付</option>
            <option value="yinhangka">银行卡刷卡</option>
        </select>
        </div>
        <br>
        <br>
        <label class="layui-form-label ziti">备注：</label>
        <div class="layui-input-block">
            <textarea name="desc" placeholder="备注:" class="layui-textarea" style="width: 200px"></textarea>
        </div>
        <br>
        <br>
        <input type="submit" id="" value="充值" onclick="closeDialog()" class="layui-btn layui-btn-fluid" style="height: 45px;width: 200px;margin-left: 110px;" />
    </form>
</div>
<div id="fade" class="black_overlay"></div>
<!--支付页面  ===============end==================-->
</body>
<script type="text/javascript">
// 点击获取当前选中金额
    function select(obj) {
    var my = $(obj).attr("value");
    document.getElementById("money").value=my;
    };

//浮框
    $(function() {})

    function openDialog() {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block'
    }

    function closeDialog() {
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none'
    }
</script>
</html>
