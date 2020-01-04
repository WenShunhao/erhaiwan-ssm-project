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
    <title>结算页面</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
<style>
    .lsdata{
        border: 0px;
        border-bottom: 1px lightgray solid;
        height: 35px;
        width: 300px;
        text-align: center;
    }
</style>
</head>
<body>
<div id="all">
    <!--会员用户停车结算-->
    <div id="light" class="white_content" style="height: 650px;width: 580px;margin-left: -100px;margin-top: -180px">
        <form class="layui-form"  method="post" action="/overparking">
            <h2 align="center" style="margin-top: 20px;font-family: 楷体;padding-left: 50px">*结算详情信息*</h2>
            <br />
            <table   style=" width: 100%;height: 250px;text-align: center" class="layui-table">
                <tr>
                    <td>停车编号:</td>
                    <td><input type="text" name="pNum"   value="${overinfo.PNum}" class="lsdata" maxlength="11" readonly="readonly"/></td>

                </tr>
                <tr>
                    <td>进场抓拍:</td>
                    <td><img src="http://localhost:88/${overinfo.PPicture}"style="width: 80px;height: 80px"></td>
                </tr>
                <tr>
                    <td>会员号：</td>
                    <td><input type="text" name="vCard"   value="${overinfo.VCard}" class="lsdata" maxlength="11" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>车牌号：</td>
                    <td >
                        <input type="text"  name="cCarplate"  value="${overinfo.CCarplate}" class="lsdata" maxlength="7" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>停车牌号：</td>
                    <td><input type="text" name="pCard" value="${overinfo.PCard}" class="lsdata" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>进场时间：</td>
                    <td><input type="text" name="pEntrytime" value="${overinfo.PEntrytime}" class="lsdata" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>当前时间：</td>
                    <td><input type="text" name="pLeavetime" value="${overinfo.PLeavetime}" class="lsdata" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>总费用：</td>
                    <td><input type="text" name="pCost" value="${overinfo.PCost}" class="lsdata" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>支付方式</td>
                    <td>
                        <div class="layui-input-block" style="width: 300px;margin-left: 55px" >
                            <select align="center" name="pPayway" id="pPayway" lay-verify="required" class="layui-form-select"  style="text-align:center; text-align-last:center">
                                <option value=""></option>
                                <option value="会员卡余额">会员卡余额</option>
                                <option value="微信支付">微信支付</option>
                                <option value="支付宝">支付宝支付</option>
                                <option value="银行卡支付">银行卡支付</option>
                            </select>
                        </div></td>
                </tr>
                <tr>
                    <td>客户类型：</td>
                    <td><input type="text" name="pType"  value="${overinfo.PType}" class="lsdata" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td>当前情况：</td>
                    <td><input type="text"  value="${overinfo.PCondition}" class="lsdata" maxlength="11"/></td>
                </tr>

            </table>
            <br />
            <br />
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 180px" >
                    <button class="layui-btn" id="add" lay-submit   lay-filter="formDemo" >立即结算</button>
                    <a href="/parkinglst" target="iframe_a" class="layui-btn layui-btn-fluid"   style="height: 38px;width: 90px;" >返回</a>
                </div>
            </div>
        </form>
    </div>
    <div id="fade" class="black_overlay"></div>
</div>
</body>
<script>

    layui.use(['form','layer'], function(){
        var form = layui.form
    });
    document.getElementById('fade').style.display='block'
    document.getElementById('light').style.display='block';


</script>
</html>