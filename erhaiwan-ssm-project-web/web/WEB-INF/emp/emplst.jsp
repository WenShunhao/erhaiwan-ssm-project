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
    <title>员工信息</title>
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
        /*.fenye{*/
        /*    width: 1400px;*/
        /*    text-align:center;*/
        /*}*/

    </style>
</head>
<body>

<!--总体框-->
<div id="All" >
    <!--按条件搜索员工-->
    <div style="margin-top: 18px;margin-left: 15px">
        <form action="/empselect" method="post">

            <div style="width: 1300px;text-align: center">

            <label >姓名:</label><input type="text"  placeholder="请输入你要查询的姓名" style="width: 180px;height: 38px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label>入职时间:</label><input type="date" name="date1"  style="width: 135px;height:38px;"/>
            <i class="layui-icon layui-icon-date" style="font-size: 25px; color: skyblue;padding-top: 6px"></i>
             <input type="date" name="date2"  style="width: 135px;height:38px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <select style="width: 135px;height:38px;">
                        <option value="">--请选择部门--</option>
                        <option value="总裁">总裁</option>
                        <option value="技术部">技术部</option>
                        <option value="保安部">保安部</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="layui-btn" lay-submit lay-filter="formDemo">点击查询</button>
            </div>
        </form>
    </div>
    <hr>

    <div id="lstVip" class="table-responsive" style="text-align: center">
        <table id="tblMain"  class="layui-table"  lay-skin="line">
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>出生日期</th>
                <th>联系方式</th>
                <th>性别</th>
                <th>身份证</th>
                <th>工资</th>
                <th>入职日期</th>
                <th>所属部门</th>
                <th>状态</th>
                <th>家庭地址</th>
                <th>备注</th>
                <th>操作</th>

            </tr>

            <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td>${emp.EId}</td>
                    <td>${emp.EName}</td>
                    <td>${emp.EBirthday}</td>
                    <td>${emp.EPhone}</td>
                    <td>${emp.EGender}</td>
                    <td>${emp.EIdcard}</td>
                    <td>${emp.ESalary}</td>
                    <td>${emp.EHiredate}</td>
                    <td>${emp.EDept}</td>
                    <td>${emp.ECondition}</td>
                    <td>${emp.EAddress}</td>
                    <td>${emp.ERemark}</td>
                    <td><input type="button"  value="离职" onclick="" class="layui-btn layui-btn-danger" style="height: 32px; margin-top: -5px;width: 60px;" />
                        <input type="button"  value="修改" onclick="" class="layui-btn layui-btn-warm" style="height: 32px; margin-top: -5px;width: 60px;" />
                </tr>
            </c:forEach>

        </table>
    <div class="fenye">
        <ul class="pagination" >
            <li> <a href="/emplist?pageNum=1&pageSize=8">首页</a></li>
            <li><a href="/emplist?pageNum=${pageInfo.prePage}&pageSize=8">上一页</a></li>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <li> <a href="/emplist?pageNum=${num}&pageSize=8">${num}</a> </li>
            </c:forEach>
            <li> <a href="/emplist?pageNum=${pageInfo.nextPage}&pageSize=8">下一页</a></li>
            <li> <a href="/emplist?pageNum=${pageInfo.pages}&pageSize=8">尾页</a></li>
        </ul>
    </div>
    </div>

</div>
































</body>
<script>
    function del(EId) {
        $.ajax({
            url:"/del",
            data:{"EId":EId},
            type:"GET"
        }).done(function () {
            alert("删除成功！！！");
        }).fail(function () {
            alert("删除失败！！！");
        })
    }
    layui.use(['form'], function(){
        var form = layui.form

    });
</script>

</html>




















<%--<script>--%>
<%--    window.onload(function () {--%>
<%--        loadUser(1,8);--%>
<%--    })--%>
<%--    function loadUser(pageNum,pageSize){--%>
<%--        $.ajax({--%>
<%--            method:"get",--%>
<%--            url:"/emplist?pageNum="+pageNum+"&pageSize="+pageSize,--%>
<%--            dataType:"json"--%>
<%--        }).done(function (pageInfo) {--%>
<%--            var table = "<div id='div2'><table >";--%>
<%--            pageInfo.list.forEach(function (employee) {--%>
<%--                table+="<tr>";--%>
<%--                table+="<td>"+employee.eId+"</td>";--%>
<%--                table+="<td>"+employee.eName+"</td>";--%>
<%--                table+="<td>"+employee.eBirthday+"</td>";--%>
<%--                table+="<td>"+employee.eGender+"</td>";--%>
<%--                table+="<td>"+employee.eIdcard+"</td>";--%>
<%--                table+="<td>"+employee.eSalary+"</td>";--%>
<%--                table+="<td>"+employee.eHiredate+"</td>";--%>
<%--                table+="<td>"+employee.eDept+"</td>";--%>
<%--                table+="<td>"+employee.eCondition+"</td>";--%>
<%--                table+="<td>"+employee.eAddress+"</td>";--%>
<%--                table+="<td>"+employee.eRemark+"</td>";--%>

<%--                table+="</tr>";--%>
<%--            })--%>
<%--            table+="</table><br>";--%>
<%--            table+="<input type='button' value='首页' class='bt' pageNum='1'pageSize='"+pageInfo.pageSize+"' />";--%>
<%--            table+="<input type='button' value='上一页' class='bt' pageNum='"+pageInfo.prePage+"'pageSize='"+pageInfo.pageSize+"' />";--%>
<%--            table+="<input type='button' value='下页' class='bt' pageNum='"+pageInfo.nextPage+"'pageSize='"+pageInfo.pageSize+"' />";--%>
<%--            table+="<input type='button' value='尾页' class='bt' pageNum='"+pageInfo.navigateLastPage+"'pageSize='"+pageInfo.pageSize+"' />";--%>
<%--            table+="</div>"--%>
<%--            $("#div2").remove();--%>
<%--            $("#div1").html(table);--%>
<%--        })--%>
<%--    }--%>

<%--</script>--%>
