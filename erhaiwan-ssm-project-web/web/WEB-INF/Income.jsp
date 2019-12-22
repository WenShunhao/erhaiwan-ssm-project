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
        #xxx{
            float: right;
            margin-top: -470PX;
            margin-right: 50px;

        }
    </style>
</head>
<body>
<div id="container"></div>
<div id="xxx">
    <select>
        <option>2019年度</option>
        <option>2020年度</option>
        <option>2021年度</option>
        <option>2022年度</option>
        <option>2022年度</option>
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
            data: [200, 100, 50, 100, 100, 100, 300, 100, 700, 100, 100, 100]
        }, {
            name: '停车收入',
            data: [100, 100, 50, 100, 100, 50, 300, 100, 50, 100, 100, 100]
        }, {
            name: '合计收入',
            data: [300, 200, 100, 200, 200, 150, 600, 200, 750, 200, 200, 200]
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

</script>
</html>

