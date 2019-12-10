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
    <title>离职员工备份信息</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <script src="/static/js/bootstrap.js"></script>
    <link href="/static/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        #all{
        margin-top: -10px;
        margin-left: 20px;
        }
        #tblMain{
            width: 1350px;
            text-align: center;
            overflow-y: auto;
            overflow-x: auto;

        }
        .fenye{
            text-align:center;
        }

    </style>
</head>
<body>

<!--总体框-->
<div id="All" >
    <!--按条件搜索员工-->
    <div style="margin-top: 18px;margin-left: 15px;text-align: center">
        <form action="/empselect" method="post" >
        <div class="form-group">&nbsp;&nbsp;&nbsp;&nbsp;
            <label >Name:</label> <input type="text"  placeholder="请输入你要查询的姓名" style="width: 180px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        <br>
            <button class="layui-btn" lay-submit lay-filter="formDemo">点击查询</button>
        <br>
        </form>
    </div>
    <hr>

    <div id="lstVip" class="table-responsive" >
        <table id="tblMain"  class="layui-table"  lay-skin="line">
            <tr >
                <th>编号</th>
                <th>姓名</th>
                <th>联系方式</th>
                <th>性别</th>
                <th>身份证</th>
                <th>入职日期</th>
                <th>离职日期</th>
                <th>原所属部门</th>
                <th>状态</th>
                <th>家庭地址</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            <tr>
                <td>1</td>
                <td>测试</td>
                <td>123049618318</td>
                <td>男</td>
                <td>44444444444444</td>
                <td>2000-10-22</td>
                <td>2019-1-4</td>
                <td>总裁</td>
                <td>离职</td>
                <td>广东河源</td>
                <td>离职原因：个人情况</td>
                <td><input type="button"  value="删除" onclick="" class="layui-btn layui-btn-danger" style="height: 32px; margin-top: -5px;width: 60px;" />
                <td><input type="button"  value="还原" onclick="" class="layui-btn layui-btn-warm" style="height: 32px; margin-top: -5px;width: 60px;" />
            </tr>

<%--            <c:forEach items="${pageInfo.list}" var="emp">--%>
<%--                <tr>--%>
<%--                    <td>${emp.EId}</td>--%>
<%--                    <td>${emp.EName}</td>--%>
<%--                    <td>${emp.EPhone}</td>--%>
<%--                    <td>${emp.EGender}</td>--%>
<%--                    <td>${emp.EIdcard}</td>--%>
<%--                    <td>${emp.EHiredate}</td>--%>
<%--                    <td>${emp.ELeavedate}</td>--%>
<%--                    <td>${emp.EDept}</td>--%>
<%--                    <td>${emp.ECondition}</td>--%>
<%--                    <td>${emp.EAddress}</td>--%>
<%--                    <td>${emp.ERemark}</td>--%>
<%--                    <td><input type="button"  value="删除" onclick="" class="layui-btn layui-btn-danger" style="height: 32px; margin-top: -5px;width: 60px;" /><td><input type="button"  value="还原" onclick="" class="layui-btn layui-btn-warm" style="height: 32px; margin-top: -5px;width: 60px;" />--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>

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
