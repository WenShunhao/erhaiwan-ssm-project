<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-5
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会员信息</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <script src="/static/js/bootstrap.js"></script>
    <link href="/static/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        #tblMain{
            width: 1700px;
            overflow-y: auto;
            overflow-x: auto;
        }
        .fenye{

            width: 950px;
            text-align:center;
        }
        .pagination{
            position: fixed;
        }
        #selectform{
            width: 1300px;
            padding-left: 50px;
        }
        .refresh{
            width: 90px;
        }

    </style>
</head>
<body>

<!--总体框-->
<div id="All" >
    <!--按条件搜索会员-->
    <div style="margin-top: 18px;margin-right: 50px">
        <form action="/selectvip" method="post">

            <div id="selectform">

            <label >姓名：</label><input type="text" name="vName" placeholder="请输入要查询的持卡人姓名" style="width: 180px;height: 38px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label >卡号：</label><input type="text" name="vCard" placeholder="请输入要查询的会员卡号" style="width: 180px;height: 38px">&nbsp;
                    <select style="width: 135px;height:38px;" name="vGender">
                        <option value="">--请选择性别--</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="layui-btn" lay-submit lay-filter="formDemo">点击查询</button>
                <a href="/viplist?pageNum=1&pageSize=8" id="refresh" class="layui-btn refresh" target="iframe_a">刷新数据</a>
                <a type="export" id="export" href="/exportvip"  class="layui-btn refresh" style="width: 120px">导出所有数据</a>

            </div>
        </form>

    </div>
    <hr>

    <div id="lstVip" class="table-responsive" style="text-align: center;margin-left: 25px">
        <table id="tblMain"  class="layui-table"  lay-skin="line">
            <tr>
                <th>会员卡号</th>
                <th>密码</th>
                <th>姓名</th>
                <th>余额</th>
                <th>关联车牌号</th>
                <th>出生日期</th>
                <th>性别</th>
                <th>通讯地址</th>
                <th>会员卡状态</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${pageInfo.list}" var="vip">
                <tr>
                    <td>${vip.vCard}</td>
                    <td>${vip.vPassword}</td>
                    <td>${vip.vName}</td>
                    <td>${vip.vBalance}</td>
                    <td>${vip.cCarplate}</td>
                    <td>${vip.vBirthday}</td>
                    <td>${vip.vGender}</td>
                    <td>${vip.vAddress}</td>
                    <td>${vip.vCondition}</td>
                    <td><input type="button"  value="注销" onclick="del(${vip.vCard})" class="layui-btn layui-btn-danger" style="height: 32px;width: 60px;" />
                        <a href="/updatevipui?vCard=${vip.vCard}" class="layui-btn layui-btn-warm" target="iframe_a" style="height: 32px" >修改</a>
                        <input type="button"  value="车况" onclick="openDialog()"  class="layui-btn layui-btn-fluid"  style="height: 32px;width: 60px" />

                    </td>
                </tr>
            </c:forEach>

        </table>

    <div class="fenye">
        <ul class="pagination" >
            <br>
            <li> <a href="/viplist?pageNum=1&pageSize=8">首页</a></li>
            <li><a href="/viplist?pageNum=${pageInfo.prePage}&pageSize=8">上一页</a></li>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <li> <a href="/viplist?pageNum=${num}&pageSize=8">${num}</a> </li>
            </c:forEach>
            <li> <a href="/viplist?pageNum=${pageInfo.nextPage}&pageSize=8">下一页</a></li>
            <li> <a href="/viplist?pageNum=${pageInfo.pages}&pageSize=8">尾页</a></li>
        </ul>
    </div>
    </div>

</div>

<br >




<!--支付页面-->



<div id="light" class="white_content" style="height: 400px">
    <h3 align="center" style="margin-top: 20px;">--粤SV497E的车况---</h3>

        <label class="layui-form-label ziti">品牌：</label>
        <div class="layui-input-block">
            <input type="text" name="cBrand"  id="cBrand" value="${carinfo.cBrand}" class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px" readonly="readonly">
        </div>
        <br>
        <label class="layui-form-label ziti">类型：</label>
        <div class="layui-input-block">
            <input type="text" name="cType" id="cType" value="${carinfo.cType}"   class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px" readonly="readonly">
        </div>
        <br>
        <label class="layui-form-label ziti">颜色：</label>
        <div class="layui-input-block">
            <input type="text" name="cColor" id="cColor"   value="${carinfo.cColor}"  class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px" readonly="readonly">
        </div>
        <br>
        <label class="layui-form-label ziti">座位：</label>
        <div class="layui-input-block">
            <input type="text" name="cSeat" id="cSeat" value="${carinfo.cSeat}"  class="layui-input" style="border: 0px; border-bottom: 1px solid gray;width: 200px" readonly="readonly">
        </div>
        <br>
        <button   class="layui-btn layui-btn-fluid"  onclick="closeDialog()"  style="height: 45px;width: 200px;margin-left: 110px;" >关闭</button>

</div>
<div id="fade" class="black_overlay"></div>


</body>

<script>

    layui.use(['form','layer'], function(){
        var form = layui.form
        layer.msg("数据加载成功！");

    });
    function del(vCard) {

        if(confirm("是否删除此条数据？")==true)
        {
            $.ajax({
                url:"/delvip",
                data:{"vCard":vCard},
                method:"GET"
            }).done(function () {
                alert("删除成功！！！");
                window.location.href=window.location.href;
            }).fail(function () {
                alert("删除失败！！！");
            })
        }};

    //浮框
    function openDialog() {
            $.ajax({
                url:"/carcondition?cCarplate="+"粤SV497E",
                method: "post",
                dataType: "json"
            }).done(function (result) {
                openDialog();
            })
    }
    function openDialog() {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';
    }
    function closeDialog() {
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none'
    }

</script>

</html>
