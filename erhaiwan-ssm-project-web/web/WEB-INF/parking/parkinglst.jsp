<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-16
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>停车情况</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <script src="/static/js/bootstrap.js"></script>
    <link href="/static/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        #tblMain{
            width: 2000px;
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
        #selectform2{
            width: 1300px;
            padding-left: 50px;
        }
        .refresh{
            width: 90px;
        }
        .selectdate{
            width: 135px;
            height:38px;
        }
        .lsdata{
            border: 0px;
            border-bottom: 1px lightgray solid;
            height: 35px;
            width: 200px;
        }

    </style>
</head>
<body>

<!--总体框-->
<div id="All" >
    <!--会员停车搜索-->
    <div style="margin-top: 18px;margin-right: 50px">
        <form class="layui-form">
            <H4 align="center" style="margin-left: 50px;;color: rgb(0, 150, 136)">停车登记</H4><br>
            <div id="selectform">
            <label >会员卡：</label><input type="text" name="vCard" id="vCard" required lay-verify="required" placeholder="请输入要查询的会员卡号" style="width: 180px;height: 38px">&nbsp;
                <div id="msg" style="display:inline;"></div>&nbsp;&nbsp;
                <input class="layui-btn layui-btn-fluid refresh" id="viptc" value="查询">
                <a onclick="openDialog()"  class="layui-btn refresh" >非会员</a>
            </div>
        </form>

    </div>
    <hr>

    <!--按条件搜索-->
    <div style="margin-top: 18px;margin-right: 50px">
<%--         action="selectparking"--%>
        <form action="/selectparking" method="post">
                <H4 align="center" style="margin-left: 50px;color: rgb(0, 150, 136)">搜索数据</H4><br>
            <div id="selectform2">

                <label >手机号：</label><input type="text" name="vPhone" value="" placeholder="请输入你要查询的手机号" style="width: 180px;height: 38px">&nbsp;&nbsp;&nbsp;
                <label>入场时间：</label><input type="date" name="date1" id="date1" class="selectdate" />
                                         <i class="layui-icon layui-icon-date" style="font-size: 26px; color: skyblue;padding-top: 6px"></i>
                                         <input type="date" name="date2" id="date2" class="selectdate" />
                <select style="width: 135px;height:38px;" name="pType">
                    <option value="临时客户">--请选择类型--</option>
                    <option value="会员客户">会员客户</option>
                    <option value="临时客户">临时客户</option>

                </select>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="layui-btn" lay-submit lay-filter="formDemo">点击查询</button>
                <a href="/parkinglst?pageNum=1&pageSize=8" id="refresh" class="layui-btn refresh" target="iframe_a"  >刷新数据</a>
            </div>
        </form>

    </div>
    <hr>

    <div id="lstVip" class="table-responsive" style="text-align: center;margin-left: 25px">
        <table id="tblMain"  class="layui-table"  lay-skin="line">
            <tr>
                <th>编号</th>
                <th>车牌号</th>
                <th>停车牌号</th>
                <th>进场照片</th>
                <th>入场时间</th>
                <th>客户类型</th>
                <th>会员卡号</th>
                <th>手机号</th>
                <th>状态</th>
                <th>备注</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${pageInfo.list}" var="parking">
                <tr>
                    <td>${parking.PNum}</td>
                    <td>${parking.CCarplate}</td>
                    <td>${parking.PCard}</td>
                    <td><img src="http://localhost:88/${parking.PPicture}"style="width: 65px;height: 65px"></td>
                    <td>${parking.PEntrytime}</td>
                    <td>${parking.PType}</td>
                    <td>${parking.VCard}</td>
                    <td>${parking.VPhone}</td>
                    <td>${parking.PCondition}</td>
                    <td>${parking.PRemark}</td>
                    <td><a href="/overparkingui?pNum=${parking.PNum}" type="button"    class="layui-btn layui-btn-danger" style="height: 32px;width: 60px;" >结算</a>
                        <a href="" class="layui-btn layui-btn-fluid"  style="height: 32px;width: 60px;" >车况</a></td>
                </tr>
            </c:forEach>

        </table>

    <div class="fenye">
        <ul class="pagination" >
            <br>
            <li> <a href="/parkinglst?pageNum=1&pageSize=5">首页</a></li>
            <li><a href="/parkinglst?pageNum=${pageInfo.prePage}&pageSize=5">上一页</a></li>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <li> <a href="/parkinglst?pageNum=${num}&pageSize=5">${num}</a> </li>
            </c:forEach>
            <li> <a href="/parkinglst?pageNum=${pageInfo.nextPage}&pageSize=5">下一页</a></li>
            <li> <a href="/parkinglst?pageNum=${pageInfo.pages}&pageSize=5">尾页</a></li>
        </ul>
    </div>
    </div>

</div>

<br >

<!--会员用户停车登记-->
<div id="light2" class="white_content" style="height: 450px;width: 480px">
    <form class="layui-form" enctype="multipart/form-data"  method="post" action="/addvipparking">
        <h4 align="center" style="margin-top: 20px;">----------会员客户<${info.vName}>信息----------</h4>
        <br />
        <table   style=" width: 100%;height: 250px;" class="layui-table">
            <tr>
                <td>会员号：</td>
                <td><input type="text" name="vCard"   value="${info.vCard}" class="lsdata" maxlength="11"/></td>
            </tr>
            <tr>
                <td>车牌号：</td>
                <td >
                    <input type="text"  name="cCarplate"  value="${info.cCarplate}" class="lsdata" maxlength="7"/>
                </td>
            </tr>
            <tr>
                <td>停车牌号：</td>
                <td><input type="text" name="pCard" value="" class="lsdata"  /></td>
            </tr>
            <tr>
                <td>抓拍照片</td>
                <td>
                    <input type="file"  name="picture2" id="picture2">
                    <img id="preview2" src="" style="width: 80px;height: 70px">
                    </img>
                </td>
            </tr>
            <tr>
                <td>客户类型：</td>
                <td><input type="text" name="pType"  value="会员客户" class="lsdata" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>卡情况：</td>
                <td><input type="text"  value="${info.vCondition}" class="lsdata" maxlength="11"/></td>
            </tr>

        </table>
        <br />
        <br />
        <div class="layui-form-item">
            <div class="layui-input-block" >
                <button class="layui-btn" id="add2" lay-submit   lay-filter="formDemo" >确认登记</button>
                <input   class="layui-btn layui-btn-fluid"  onclick="closeDialog2()" value="关闭"  style="height: 38px;width: 90px;" ></input>
            </div>
        </div>
    </form>
</div>
<div id="fade2" class="black_overlay"></div>


<!--临时用户停车登记-->
<div id="light" class="white_content" style="height: 450px;;width: 480px">
<form class="layui-form" enctype="multipart/form-data" action="/addls" method="post">
    <h4 align="center" style="margin-top: 20px;">----------登记临时用户停车信息----------</h4>
    <br />
    <table   style=" width: 100%;height: 250px;" class="layui-table">
        <tr>
            <td>预留手机号：</td>
            <td><input type="text" name="vPhone"  value="" class="lsdata" maxlength="11"/></td>
        </tr>
        <tr>
            <td>车牌号：</td>
            <td >
                <input type="text"  name="cCarplate" value="" class="lsdata" maxlength="7"/>
            </td>
        </tr>
        <tr>
            <td>停车牌号：</td>
            <td><input type="text" name="pCard" value="" class="lsdata"  /></td>
        </tr>
        <tr>
            <td>抓拍照片</td>
            <td>
                <input type="file"  name="picture" id="picture">
            <img id="preview" src="" style="width: 80px;height: 70px">
            </img>
            </td>
        </tr>
        <tr>
            <td>客户类型：</td>
            <td><input type="text" name="pType" value="临时客户" class="lsdata" readonly="readonly" /></td>
        </tr>

    </table>
    <br />
    <br />
    <div class="layui-form-item">
        <div class="layui-input-block" >
            <button class="layui-btn" id="add" lay-submit   lay-filter="formDemo" >确认登记</button>
            <input   class="layui-btn layui-btn-fluid"  onclick="closeDialog()" value="关闭" style="height: 38px;width: 90px;" ></input>
        </div>
    </div>
</form>
</div>
<div id="fade" class="black_overlay"></div>

</body>

<script>

    layui.use(['form','layer','laydate'], function(){
        var form = layui.form
        var laydate = layui.laydate;
        layer.msg("数据加载成功！");
        laydate.render({
            elem: '#date1',

    });
        laydate.render({
            elem: '#date2',

        });
    });

$("#viptc").on('click',function () {
    $.ajax({
        url:"/addvipparkingui",
        data:{vCard:$("#vCard").val()},
        method: "post",
        dataType: "json"
    }).done(function (result) {
            openDialog2();
    })
})


    function openDialog(){
        document.getElementById('fade').style.display='block'
        document.getElementById('light').style.display='block';

    }
    function closeDialog(){
        document.getElementById('light').style.display='none';
        document.getElementById('fade').style.display='none'
    }

    function openDialog2(){
        document.getElementById('fade2').style.display='block'
        document.getElementById('light2').style.display='block';

    }
    function closeDialog2(){
        document.getElementById('light2').style.display='none';
        document.getElementById('fade2').style.display='none'
    }
        //FileReader预览图片
        $("#picture").change(function (event) {
            var file = $("#picture")[0].files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#preview").attr("src", this.result);
            };
            reader.readAsDataURL(file);
        });

    //FileReader预览图片2
    $("#picture2").change(function (event) {
        var file = $("#picture2")[0].files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#preview2").attr("src", this.result);
        };
        reader.readAsDataURL(file);
    });
    //验证会员号
    $(document).ready(function(){
        //给账号文本框绑定失去焦点的事件
        $("#vCard").blur(function(){
            // alert("测试"+$(this).val());
            $.ajax({
                url:"/panduan2",//设置服务器地址
                type:"post",//提交的方式
                data:{vCard:$(this).val()},//提交到服务器的数据
                success:function(data){//回调函数，data是返回的数据
                    $("#msg").html(data);
                }
            });
        });
    });





</script>

</html>
