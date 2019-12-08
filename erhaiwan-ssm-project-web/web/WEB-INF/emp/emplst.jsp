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
    <link href="/static/css/emplst.css" rel="stylesheet" type="text/css">
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <script src="/static/js/bootstrap.js"></script>
    <link href="/static/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<body>
<!--总体框-->
<div id="All" >
    <!--按条件搜索员工-->
    <div style="margin-top: 18px;margin-left: 20px" style="border: 2px blue solid">
        <form action="/empselect" method="post" >
        <div class="form-group">
            <label >ID:</label>
            <input type="text"  placeholder="请输入你要查询的编号" style="width: 180px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label >Name:</label> <input type="text"  placeholder="请输入你要查询的姓名" style="width: 180px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        <br>
            <button class="layui-btn" lay-submit lay-filter="formDemo">点击查询</button>
        <br>
        </form>
    </div>
    <hr>

    <div id="lstVip" class="table-responsive" style="width: 1150px">
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
                    <td><input type="button"  value="注销" onclick="" class="layui-btn layui-btn-danger" style="height: 32px; margin-top: -5px;width: 60px;" />
                        &nbsp;&nbsp;
                        <input type="button"  value="修改" onclick="" class="layui-btn layui-btn-warm" style="height: 32px; margin-top: -5px;width: 60px;" />
                </tr>
            </c:forEach>

        </table>

        <ul class="pagination" style="text-align: center">
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








</body>


</body>

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
