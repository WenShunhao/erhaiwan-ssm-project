<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-3
  Time: 08:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统管理员登录🚩</title>
    <link href="/static/css/adminlogin.css" rel="stylesheet" type="text/css">
    <script src="/static/js/jquery-3.31.min.js"></script>
    <style>
        #loginbtn{
            display: block;
            width: 100%;
            height: 40px;
            background-color: deepskyblue;
            background-size: 200%;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.5s;
            margin-top: 30px;
        }
        #loginbtn:hover {
            background-position: right;
        }
    </style>
</head>
<body>
<form  action="/login" method="post" >
    <h2 align="center">洱海湾停车场管理系统</h2>
    <div class="ib">
        <input  id="oAccount" name="oAccount" value=""/>
        <span data-placeholder="Please Enter Administrator ID"></span>
    </div>
    <div class="ib">
        <input  id="oPassword" name="oPassword" type="password" value="123456"/>
        <span data-placeholder="Please Enter Your Password"></span>
    </div>
    <!--这里加一个隐藏域-->
    <input type="hidden" name="back_url" value="">

    <input type="submit" value="登陆" id="loginbtn">


</form>

<script>
    window.onload = function (ev) {
        var nodeListOf = document.querySelectorAll("input");
        nodeListOf.forEach(function (o) {
            o.onfocus = function (ev) {
                ev.target.classList.add("focus");
            };
            o.onblur = function (ev) {
                if (!ev.target.value) {
                    ev.target.classList.remove("focus");
                }
            }
        });
    };
</script>
</body>
</html>
