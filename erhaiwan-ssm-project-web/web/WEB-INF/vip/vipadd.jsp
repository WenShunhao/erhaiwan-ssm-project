<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-5
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员注册</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <style>
        .kuangdaxiao{
            width: 500px;
        }
        #all{
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div id="all">
<form method="post" id="vipform" action="/addvip" class="layui-form" >
    <div class="layui-form-item" >
<%--        <!--会员号-->--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
            <input type="text" name="vCard" value="" id="vCard" required lay-verify="required" placeholder="请填入会员手机号" autocomplete="off" class="layui-input" maxlength="11">
        </div>
    <br>
    <%--        <!--密码-->--%>
    <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: skyblue"></i></label>
    <div class="layui-input-block kuangdaxiao" >
        <input type="text" name="vPassword" id="vPassword" required lay-verify="required" placeholder="请填写会员密码" autocomplete="off" class="layui-input" maxlength="20">
    </div>

    <br>

    <%--        <!--姓名-->--%>
    <label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
        <input type="text" name="vName" value="" id="vName" required lay-verify="required" placeholder="请填入持卡人真实姓名" autocomplete="off" class="layui-input" maxlength="20">
    </div>
    <br>


    <%--        车牌号--%>
    <label class="layui-form-label"><i class="layui-icon layui-icon-form" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao">
        <input type="text" name="cCarplate" id="cCarplate" value="" required lay-verify="required" placeholder="请填入会员关联的车牌号" autocomplete="off" class="layui-input" minlength="7" maxlength="7">
    </div>

    <br>
<%--        <!--出生日期-->--%>
        <label class="layui-form-label" style="margin-top: -2px;"><i class="layui-icon layui-icon-date" style="font-size: 30px; color: skyblue;"></i></label>
        <div class="layui-input-block" >
        <input type="date" name="vBirthday"  id="vBirthday" style="width: 500px;float: left" class="layui-input" title="填写会员的出生日期"/>
        </div>
    <br>


<%--        性别--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-male" style="font-size: 30px; color: skyblue;"></i></label>
            <div class="layui-input-block kuangdaxiao" >
             <select name="vGender" id="vGender" lay-verify="required" class="layui-form-select">
                 <option value="男"></option>
                 <option value="男">男</option>
                 <option value="女">女</option>

             </select>
            </div>
                <br>

<%--<!--住址-->--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-home" style="font-size: 30px; color: skyblue;"></i></label>
                 <div class="layui-input-block kuangdaxiao" >
                <input type="text" name="vAddress" id="vAddress" required lay-verify="required" placeholder="请填写会员的通讯住址" autocomplete="off" class="layui-input">
            </div>
            <br>

<br><br>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="add" lay-submit   lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary" style="width: 90px;">重置</button>
        </div>
    </div>


</form>
</div>
<%--使用layui的radio、select等控件--%>
<script>
    layui.use(['form','layer','laydate'], function(){
        var form = layui.form
        var laydate = layui.laydate;
    layer.msg("添加操作！！");
        laydate.render({
            elem: '#vBirthday',

        });
    });
        function x() {
      document.getElementById("cCarplate").value=document.getElementById("cCarplate1").value;
        }


</script>
</body>
</html>