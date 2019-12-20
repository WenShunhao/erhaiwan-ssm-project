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
<form method="post" id="empform" action="/addemp" class="layui-form" >
    <div class="layui-form-item" >
<%--        <!--姓名-->--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
            <input type="text" name="eName" value="" id="eName" required lay-verify="required" placeholder="请填入你的真实姓名" autocomplete="off" class="layui-input">
        </div>
    <br>
<%--        <!--出生日期-->--%>
        <label class="layui-form-label" style="margin-top: -2px;"><i class="layui-icon layui-icon-date" style="font-size: 30px; color: skyblue;"></i></label>
        <div class="layui-input-block" >
        <input type="date" name="eBirthday"  id="eBirthday" style="width: 500px;float: left" class="layui-input" title="填写员工的出生日期"/>
        </div>
    <br>
<%--        <!--手机号-->--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone" style="font-size: 30px; color: skyblue"></i></label>
    <div class="layui-input-block kuangdaxiao" >
            <input type="text" name="ePhone" id="ePhone" required lay-verify="required|phone" placeholder="请填入11位手机号" autocomplete="off" class="layui-input" maxlength="11">
        </div>

        <br>
<%--        性别--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-male" style="font-size: 30px; color: skyblue;"></i></label>
            <div class="layui-input-block kuangdaxiao" >
             <select name="eGender" id="eGender" lay-verify="required" class="layui-form-select">
                 <option value=""></option>
                 <option value="男">男</option>
                 <option value="女">女</option>

             </select>
            </div>
                <br>
<%--身份证--%>
        <label class="layui-form-label"><i class="layui-icon layui-icon-templeate-1" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao">
            <input type="text" name="eIdcard" id="eIdcard" required lay-verify="required" placeholder="请填入你的身份证号码" autocomplete="off" class="layui-input"  maxlength="18">
        </div>
    <br>
<%--工资--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-rmb" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao">
                <input type="text" name="eSalary" id="eSalary" required lay-verify="required" lay-verify="number" placeholder="设置新员工薪资" autocomplete="off" class="layui-input">
            </div>
        <br>

<%--        <!--入职日期-->--%>
            <label class="layui-form-label" style="margin-top: -2px;"><i class="layui-icon layui-icon-date" style="font-size: 30px; color: skyblue;"></i></label>
            <div class="layui-input-block" >
                <input type="date" name="eHiredate" id="eHiredate"  style="width: 500px;float: left" class="layui-input" title="填写该员工的入职日期"/>
            </div>
<%--      <!--所属部门-->--%>
    <br>
                <label class="layui-form-label"><i class="layui-icon layui-icon-group" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
                    <select name="eDept" id="eDept" lay-verify="required" class="layui-form-select" >
                        <option value=""></option>
                        <option value="总裁">总裁</option>
                        <option value="会计">会计</option>
                        <option value="保安">保安</option>
                        <option value="经理">经理</option>
                        <option value="维护员">维护员</option>
                        <option value="清洁工">清洁工</option>

                    </select>
                </div>

        <br>
<%--状态--%>
                <label class="layui-form-label"><i class="layui-icon layui-icon-note" style="font-size: 30px; color: skyblue;"></i></label>
                <div class="layui-input-block kuangdaxiao" >
                    <select name="eCondition" id="eCondition" lay-verify="required" class="layui-form-select">
                        <option value=""></option>
                        <option value="正式员工">正式员工</option>
                        <option value="实习生">实习生</option>
                    </select>
                </div>

                                     <br>
<%--<!--住址-->--%>
            <label class="layui-form-label"><i class="layui-icon layui-icon-home" style="font-size: 30px; color: skyblue;"></i></label>
                 <div class="layui-input-block kuangdaxiao" >
                <input type="text" name="eAddress" id="eAddress" required lay-verify="required" placeholder="请填写你的常住住址" autocomplete="off" class="layui-input">
            </div>

                                      <br>
<%--    备注--%>
    <label class="layui-form-label"><i class="layui-icon layui-icon-form" style="font-size: 30px; color: skyblue;"></i></label>
    <div class="layui-input-block kuangdaxiao" >
        <textarea name="eRemark" id="eRemark" placeholder="备注:" class="layui-textarea"></textarea>
    </div>
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
        laydate.render({
            elem: '#eHiredate',
        });
        laydate.render({
            elem: '#eBirthday',
        });
    layer.msg("添加操作！！");
    });








//     $("#add").on('click', function(){
//             $.ajax( {
//         url:"/addemp",
//         method:"POST",
//         date: data.field,
//         dataType:JSON,
//         success:function (res) {
//             if (res.code=='200') {
//                 alert("添加成功！！！")
//             }
//             else {
//                 alert("添加失败")
//             }},
//
//     })
//
// });
</script>
</body>
</html>























<%--// var eName =$("#eName").val();--%>
<%--// var eBirthday=$("#eBirthday").val();--%>
<%--// var ePhone =$("#ePhone").val();--%>
<%--// var eGender =$('input[name="eGender"]:checked').val();--%>
<%--// var eIdcard =$("#eIdcard").val();--%>
<%--// var eSalary =$("#eSalary").val();--%>
<%--// var eHiredate =$("#eHiredate").val();--%>
<%--// var eDept =$("#eDept").val();--%>
<%--// var eCondition =$("#eCondition").val();--%>
<%--// var eAddress =$("#eAddress").val();--%>
<%--// var eRemark =$("#eRemark").val();--%>
