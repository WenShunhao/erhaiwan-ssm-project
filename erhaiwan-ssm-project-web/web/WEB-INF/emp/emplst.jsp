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
        .selectdate{
            width: 135px;
            height:38px;
        }

    </style>
</head>
<body>

<!--总体框-->
<div id="All" >
    <!--按条件搜索员工-->
    <div style="margin-top: 18px;margin-right: 50px">
        <form action="/selectemp" method="post">

            <div id="selectform">

            <label >姓名：</label><input type="text" name="eName" placeholder="请输入你要查询的姓名" style="width: 180px;height: 38px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label>入职时间：</label><input type="date" name="date1" class="selectdate" />
            <i class="layui-icon layui-icon-date" style="font-size: 26px; color: skyblue;padding-top: 6px"></i>
             <input type="date" name="date2"  class="selectdate" />
                    <select style="width: 135px;height:38px;" name="eDept">
                        <option value="">--请选择部门--</option>
                        <option value="总裁">总裁</option>
                        <option value="会计">会计</option>
                        <option value="保安">保安</option>
                        <option value="经理">经理</option>
                        <option value="维护员">维护员</option>
                        <option value="清洁工">清洁工</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="layui-btn" lay-submit lay-filter="formDemo">点击查询</button>
                <a href="/emplist?pageNum=1&pageSize=8" id="refresh" class="layui-btn refresh" target="iframe_a"  >刷新数据</a>
                <a href="/emplist?pageNum=1&pageSize=8" class="layui-btn refresh" target="iframe_a"  >导出数据</a>

            </div>
        </form>

    </div>
    <hr>

    <div id="lstVip" class="table-responsive" style="text-align: center;margin-left: 25px">
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
                    <td><input type="button"  value="离职" onclick="del(${emp.EId})" class="layui-btn layui-btn-danger" style="height: 32px;width: 60px;" />
                        <a href="/updateui?eId=${emp.EId}" class="layui-btn layui-btn-warm" target="iframe_a" style="height: 32px" >修改</a></td>
                </tr>
            </c:forEach>

        </table>

    <div class="fenye">
        <ul class="pagination" >
            <br>
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

<br >

<div id="div1" style="margin-left: 500px;float: left">
    XXX
    <a id="xx">显示</a>
</div>

</body>

<script>

    layui.use(['form','layer'], function(){
        var form = layui.form
        layer.msg("数据加载成功！");

    });
    function del(eId) {
        if(confirm("是否删除此条信息？")==true)
        {
            $.ajax({
                url:"/delemp",
                data:{"eId":eId},
                method:"GET"
            }).done(function () {
                alert("删除成功！！！");
                // $("#sy").trigger("click");第一种 刷新方式  下面是第二种
                window.location.href=window.location.href;

            }).fail(function () {
                alert("删除失败！！！");
            })
        }};




       $("#xx").click(function () {
           loadEmp(1,8);
       })

    function loadEmp(pageNum,pageSize){
        $.ajax({
            type:"get",
            url:"/emplist?pageNum="+pageNum+"&pageSize="+pageSize,
            dataType:"json"
        }).done(function (pageInfo) {
            var table = "<div id='div2'><table >";
            pageInfo.list.forEach(function (emp) {
                table+="<tr>";
                table+="<td>"+emp.eId+"</td>";
                table+="<td>"+emp.eName+"</td>";
                table+="</tr>";
            })
            table+="</table><br>";
            table+="<input type='button' value='首页' class='bt' pageNum='1'pageSize='"+pageInfo.pageSize+"' />";
            table+="<input type='button' value='上一页' class='bt' pageNum='"+pageInfo.prePage+"'pageSize='"+pageInfo.pageSize+"' />";
            table+="<input type='button' value='下页' class='bt' pageNum='"+pageInfo.nextPage+"'pageSize='"+pageInfo.pageSize+"' />";
            table+="<input type='button' value='尾页' class='bt' pageNum='"+pageInfo.navigateLastPage+"'pageSize='"+pageInfo.pageSize+"' />";
            table+="</div>"
            $("#div1").append(table)
            $(".bt").on('click',function () {
                //prop只能获取标签的固有属性
                //attr可以获取自定义属性
                loadUser($(this).attr("pageNum"),$(this).attr("pageSize"));
            })
        })
    }





</script>

</html>
