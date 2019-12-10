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
    <title>新员工入职</title>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <style>
        .kuangdaxiao{
            width: 500px;

        }
        .tishi{
            font-family: 华文中宋;
            font-size: 17px;
            color:red;
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div id="all">
<form method="post"  class="layui-form" action="">
    <div class="layui-form-item" >
<%--        <!--姓名-->--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
            <input type="text" name="eName" required lay-verify="required" placeholder="请填入你的真实姓名" autocomplete="off" class="layui-input">
        </div>
    <br>
<%--        <!--出生日期-->--%>
        <label class="layui-form-label" style="margin-top: -2px;"><i class="layui-icon layui-icon-date" style="font-size: 30px; color: skyblue;"></i></label>
        <div class="layui-input-block" >
        <input type="date" name="eBirthday"  style="width: 200px;float: left" class="layui-input" /><span class="tishi">出生日期</span>
        </div>
    <br>
<%--        <!--手机号-->--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone" style="font-size: 30px; color: skyblue"></i></label>
    <div class="layui-input-block kuangdaxiao" >
            <input type="text" name="ePhone" required lay-verify="required|phone" placeholder="请填入11位手机号" autocomplete="off" class="layui-input">
        </div>

        <br>
<%--        性别--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-male" style="font-size: 30px; color: skyblue;"></i></label>
            <div class="layui-input-block">
             <input type="radio" name="eGender" value="男" title="男" checked />
             <input type="radio" name="eGender" value="女"  title="女"/>
            </div>
                <br>
<%--身份证--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-templeate-1" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao">
            <input type="text" name="eIdcard" required lay-verify="required" placeholder="请填入你的身份证号码" autocomplete="off" class="layui-input">
        </div>
    <br>
<%--工资--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-rmb" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao">
                <input type="text" name="eSalary" required lay-verify="required" lay-verify="number" placeholder="设置新员工薪资" autocomplete="off" class="layui-input">
            </div>
        <br>

            <%--        <!--入职日期-->--%>
            <label class="layui-form-label" style="margin-top: -2px;"><i class="layui-icon layui-icon-date" style="font-size: 30px; color: skyblue;"></i></label>
            <div class="layui-input-block" >
                <input type="date" name="eHiredate"  style="width: 200px;float: left" class="layui-input"/><span class="tishi">入职日期</span>
            </div>
<%--      <!--所属部门-->--%>
    <br>
                <label class="layui-form-label"><i class="layui-icon layui-icon-group" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
                    <select name="eDept" lay-verify="required" class="layui-form-select" >
                        <option value=""></option>
                        <option value="0">总裁</option>
                        <option value="1">会计</option>
                        <option value="2">保安</option>
                        <option value="3">经理</option>
                    </select>
                </div>

        <br>
<%--状态--%>
                <label class="layui-form-label"><i class="layui-icon layui-icon-note" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
                    <select name="eDept" lay-verify="required" class="layui-form-select">
                        <option value=""></option>
                        <option value="0">正式员工</option>
                        <option value="0">实习生</option>

                    </select>
                </div>



    <br>
            <%--        <!--住址-->--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-home" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
                <input type="text" name="eAddress" required lay-verify="required" placeholder="请填写你的常住住址" autocomplete="off" class="layui-input">
            </div>

        <br>
<%--    备注--%>
    <label class="layui-form-label"><i class="layui-icon layui-icon-form" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
        <textarea name="eRemark" placeholder="备注:" class="layui-textarea"></textarea>
    </div>
<br><br>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit  lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary" style="width: 90px;">重置</button>
        </div>
    </div>


</form>
</div>
<%--使用layui的radio、select等控件--%>
<script>
    layui.use(['form'], function(){
        var form = layui.form

    });
</script>
</body>
</html>
