
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<!--修改页面-->

    <a href="/parkinglst" target="iframe_a"><i class="layui-icon layui-icon-close" title="关闭" style="font-size: 30px; color: black;float: right;cursor: pointer"></i></a>
    <br>
    <h2 align="center" style="margin-top: 20px;">-----------------修改${username}的密码-----------------</h2>
    <form action="/sureupdateinfo?username=${username}" method="post" style="margin-left: 400px">

        <br>
        <label class="layui-form-label ziti">新密码：</label>
        <div class="layui-input-block">
            <input type="password" id="oPassword" name="oPassword" required lay-verify="required" autocomplete="off"  class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px">
        </div>
        <br>
        <br>
        <label class="layui-form-label ziti">重输输入：</label>
        <div class="layui-input-block">
            <input type="password" id="oPassword2" name="oPassword2" required lay-verify="required" autocomplete="off"  class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px">
        </div>
        <div id="msg"></div>
        <br>
        <br>
        <button type="submit"  class="layui-btn" lay-submit   lay-filter="formDemo" style="height: 45px;width: 200px;margin-left: 110px;" >确定</button>
    </form>
</div>

<%--<div id="fade" class="black_overlay"></div>--%>

<%--<script>--%>
<%--    layui.use(['form','layer'], function(){--%>
<%--        var form = layui.form--%>
<%--    });--%>

<%--    document.getElementById('fade').style.display='block'--%>
<%--    document.getElementById('light').style.display='block'--%>
<%--        // $("#oPassword2").blur(function () {--%>
<%--        //     if ($("#oPassword").val() != $("#oPassword2").val()) {--%>
<%--        //         $("#msg").html("密码不一致，请重新输入！");--%>
<%--        //         document.getElementById("oPassword2").value = "";--%>
<%--        //     }--%>
<%--        // })--%>
<%--</script>--%>
</body>

</html>
