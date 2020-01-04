<%--
  Created by IntelliJ IDEA.
  User: NFS
  Date: 2019-12-22
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>营业额统计</title>
    <script src="/static/js/highcharts.js"></script>
    <style>
        #container {
            margin-left: 80px;
            height: 500px;
            min-width: 510px;
            max-width: 900px;
        }
        #yearbox{
            float: right;
            margin-top: -470PX;
            margin-right: 50px;

        }
    </style>
</head>
<body>
<div id="container"></div>

<div id="yearbox">
    <select id="selectyear" onchange="changeval()">
        <option value="2019">2019年度</option>
        <option value="2020">2020年度</option>
        <option value="2021">2021年度</option>
        <option value="2022">2022年度</option>
        <option value="2023">2023年度</option>
        <option value="2024">2024年度</option>
        <option value="2025">2025年度</option>
        <option value="2026">2026年度</option>
        <option value="2027">2027年度</option>
        <option value="2028">2028年度</option>
        <option value="2029">2029年度</option>
        <option value="2030">2030年度</option>
        <option value="2031">2031年度</option>
        <option value="2032">2032年度</option>
        <option value="2033">2033年度</option>
    </select>
</div>

</body>
<script>
    var chart = Highcharts.chart('container', {
        chart: {
            type: 'column'
        },
        title: {
            text: '洱海湾停车场营业额统计'
        },

        legend: {
            align: 'right',
            verticalAlign: 'middle',
            layout: 'vertical'
        },
        xAxis: {
            categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            labels: {
                x: -10
            }
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '金额'
            }
        },
        series: [{
            name: '会员充值收入',
            data: ${redata}
        }, {
            name: '停车收入',
            data: ${padata}
        }, {
            name: '合计收入',
            data: ${totaldata}
        }],
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 1500
                },
                chartOptions: {
                    legend: {
                        align: 'center',
                        verticalAlign: 'bottom',
                        layout: 'horizontal'
                    },
                    yAxis: {
                        labels: {
                            align: 'left',
                            x: 0,
                            y: -5
                        },
                        title: {
                            text: '￥金额以元为单位'
                        }
                    },
                    subtitle: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    }
                }
            }]
        }
    });
    alert("亲，你想干啥子？！")

    function changeval() {
        var nf=document.getElementById("selectyear");
        var nfval = nf.options[nf.selectedIndex].value;
    alert(nfval);
        $.ajax({
            url: "/totalui?toyear="+nfval,
            type: "get",
            success: function (data) {
                alert("成功！！！");
            }

        })
    };


</script>
</html>

