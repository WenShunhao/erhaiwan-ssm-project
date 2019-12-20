<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-3
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>管理员操作系统</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <link href="/static/css/adminIndex.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <script src="/static/js/zui.js"></script>

    <style>
        body{overflow-y: scroll;}
    </style>
</head>
<body>
<div id="all">
    <div id="daohang">
    <ul class="layui-nav layui-nav-tree layui-nav-side "  lay-filter="test" style="margin-right: 10px;">
        <li class="layui-nav-item"><b><span id="projecttitle">洱海湾</span></b></li>
        <li class="layui-nav-item ">
            <a href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 30px; color: white;"></i>会员管理中心</a>
            <dl class="layui-nav-child">
                <dd><a href="/viplist" target="iframe_a">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-search" style="font-size: 22px; color: white;"></i>详细信息查询</a></dd>
                <dd><a href="/addvipui" target="iframe_a">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-add-1" style="font-size: 22px; color: white;"></i>添加会员</a></dd>
                <dd><a href="javascript:;">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-edit" style="font-size: 22px; color: white;"></i>修改信息记录</a></dd>
                <dd><a href="javascript:;">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-delete" style="font-size: 22px; color: white;"></i>注销申请</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item ">
            <a href="javascript:;"><i class="layui-icon layui-icon-user" style="font-size: 25px; color: white;"></i>员工管理中心</a>
            <dl class="layui-nav-child">
                <dd><a href="/emplist" target="iframe_a">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-search" style="font-size: 22px; color: white;"></i>详细信息查询</a></dd>
                <dd><a href="/addui" target="iframe_a">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-add-1" style="font-size: 22px; color: white;"></i>新员工入职</a></dd>
                <dd><a href="javascript:;">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-edit" style="font-size: 22px; color: white;"></i>修改信息记录</a></dd>
                <dd><a href="/empbackuplist" target="iframe_a">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-delete" style="font-size: 22px; color: white;"></i>离职员工信息</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;"><i class="layui-icon layui-icon-release" style="font-size: 25px; color: white;"></i>停车场管理中心</a>
            <dl class="layui-nav-child">
                <dd><a href="/parkinglst" target="iframe_a">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-search" style="font-size: 22px; color: white;"></i>查看停车情况</a></dd>
                <dd><a href="javascript:;">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-about" style="font-size: 22px; color: white;"></i>停车位情况</a></dd>
                <dd><a href="javascript:;">&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-template-1" style="font-size: 22px; color: white;"></i>停车位操作</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/recharge?username="+${username} target="iframe_a"><i class="layui-icon layui-icon-rmb" style="font-size: 25px; color: white;"></i>充值与收费标准</a></li>
        <li class="layui-nav-item"><a href="#"><i class="layui-icon layui-icon-chart-screen" style="font-size: 25px; color: white;"></i>营业额</a></li>
        <li class="layui-nav-item"><a href="#"><i class="layui-icon layui-icon-set-sm" style="font-size: 25px; color: white;"></i>系统设置</a></li>

    </ul>

    </div>
        <!--下——右:页面部分-->
        <div id="Content_right">
            <div id="topdaohang" >
                <ul class="layui-nav" >
                <div id="topcontext" >
                    <li class="layui-nav-item" >
                        <a href="#">消息中心<span class="layui-badge">1</span></a>
                    </li>
                    <li class="layui-nav-item" >
                        <a href="#">个人中心<span class="layui-badge-dot"></span></a>
                    </li>
                    <li class="layui-nav-item" lay-unselect="" >
                        <a href="javascript:;"><img src="http://localhost:88/3.png" class="layui-nav-img">${username}</a>
                        <dl class="layui-nav-child">
                            <dd><a  target="iframe_a">安全管理</a></dd>
                            <dd><a  id="zhuxiao" ><span id="zhuxiaoanniu">注销登录</span></a></dd>
                        </dl>
                    </li>
                </div>
                </ul>
            </div>
            <div id="kuangjia">
            <iframe  src="/emplist" name="iframe_a" width="1160" height="1000"  scrolling="no" >

            </iframe>
            </div>
        </div>
</div>


</div>


</body>
<script>

    layui.use('element','layer', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());

        });

    });
    $("#zhuxiaoanniu").click(function () {
        if(confirm("亲，您确定要退出吗？")==true) {
            window.location.href="/";
            layer.msg("退出成功！！！")
        }
    });




</script>
</html>
