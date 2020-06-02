<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/layui/header.jsp" %>
    <title>播表列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
    <style>
        .layui-laydate-content .laydate-day-mark::after {
            background-color: red;
        }
        .layui-laydate-content td.layui-this .laydate-day-mark::after {
            display: block !important;
            background-color: red;
        }
    </style>
    <script type="text/javascript" defer="defer">
        $(function () {
            init();
        });

        function refresh() {
            init();
        }

        function init() {
            layui.use('layer', function () {
                var layer = layui.layer;
            });
            layui.use('laydate', function () {
                var laydate = layui.laydate;

                var nowDate = moment().format("YYYY-MM-DD"),   obj = {};
                obj[nowDate] = nowDate.split("-")[2];

                laydate.render({
                    elem: '#startTime', //指定元素
                    mark:obj,
                });
                //执行一个laydate实例
                laydate.render({
                    elem: '#endTime', //指定元素
                    mark:obj,
                });
            });

            //名称
            var terminalId = $("#terminal").val();

            //日期
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();

            //状态
            var statusId = $("#statusId").val();

            layui.use('table', function () {
                var table = layui.table;
                table.render({
                    elem: '#table1'
                    ,
                    id: 'flagOne'
                    ,
                    url: '<%=request.getContextPath()%>/ptable/searchPtable.do'
                    //,height: 550
                    //,cellMinWidth: 120
                    ,
                    height: 'full-200'
                    ,
                    limits: [10, 25, 50, 75, 100, 500]
                    ,
                    initSort: {
                        field: 'statusId' //排序字段，对应 cols 设定的各字段名
                        , type: 'asc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
                    }
                    ,
                    cols: [[
                        //{field:'id', width:'1%'}
                        {checkbox: true, event: 'set1', fixed: true}
                        , {field: 'ptableName', width: 250, event: 'set2', title: '播表名', fixed: true, sort: true}
                        , {
                            field: 'playDate', width: 110, event: 'set3', title: '播放日期', sort: true
                            , templet: function (d) {
                                var date = new Date(d.playDate);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                return Y + M + D;
                            }
                        }
                        //,{field:'periodName',width:130, event: 'set4', title: '时段名', sort: true}
                        , {
                            field: 'periodTime', width: 260, event: 'set4', title: '时段范围', sort: true
                            , templet: function (d) {
                                var flag = d.insertFlag;
                                if (flag == '0') {
                                    // var periodName = d.periodName;
                                    // var periodTime = d.periodTime;
                                    return d.periodSName + " " +d.startInterval+"-"+d.endInterval;
                                } else if (flag == '1') {
                                    var periodStart = d.startTime;
                                    var periodEnd = d.endTime;
                                    return periodStart + "-" + periodEnd;
                                }
                            }
                        }
                        , {
                            field: 'insertFlag', width: 100, event: 'set5', title: '播表类型', sort: true
                            , templet: function (d) {
                                var flag = d.insertFlag;
                                if (flag == '0') {
                                    return '<span style="color: #90EE90;">周期轮播</span>';
                                } else if (flag == '1') {
                                    return '<span style="color: #FF6347;">插播</span>';
                                }
                            }
                        }
                        , {
                            field: 'statusId', width: 100, event: 'set6', title: '审核状态', sort: true
                            , templet: function (d) {
                                var state = d.statusId;
                                if (state == 1) {
                                    return '<span style="color: #FF5722;">' + '未审核' + '</span>';
                                } else if (state == 2) {
                                    return '<span style="color: #90EE90;">' + '已初审' + '</span>';
                                } else if (state == 3) {
                                    return '<span style="color: #5FB878;">' + '已通过' + '</span>';
                                } else if (state == 4) {
                                    return '<span style="color: #FF6347;">' + '未通过' + '</span>';
                                } else if (state == 5) {
                                    return '<span style="color: #FF6347;">' + '未通过(排播有误)' + '</span>';
                                } else if (state == 6) {
                                    return '<span style="color: #FF6347;">' + '未通过(稿件敏感)' + '</span>';
                                } else if (state == 7) {
                                    return '<span style="color: #FFB800;">' + '未通过(排播有误、稿件敏感)' + '</span>';
                                }else if (state == 0){
                                    return '<span style="color: #FFD133;">' + '已停止' + '</span>';
                                }
                            }
                        }
                        , {field: 'playTotalTime', width: 120, event: 'set7', title: '播表时长', sort: true}
                        , {field: 'allTime', width: 120, event: 'set8', title: '可播时长'}
                        , {field: 'screenRate', width: 100, event: 'set9', title: '占屏比', sort: true}
                        , {
                            field: 'terminalName', width: 120, event: 'set10', title: '终端名', sort: true
                            , templet: function (d) {
                                return '<span style="color: #1E9FFF;">' + d.terminalName + '</span>';
                            }
                        }
                        , {field: 'createName', width: 120, event: 'set11', title: '创建人', sort: true}
                        , {
                            field: 'createTime', width: 180, event: 'set12', title: '创建时间', sort: true
                            , templet: function (d) {
                                var date = new Date(d.createTime);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
                                var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
                                var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
                                return Y + M + D + h + m + s;
                            }
                        }
                        , {
                            field: 'modifyTime', width: 180, event: 'set13', title: '修改时间', sort: true
                            , templet: function (d) {
                                if (d.modifyTime == null) {
                                    return "";
                                }
                                var date = new Date(d.modifyTime);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
                                var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
                                var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
                                return Y + M + D + h + m + s;
                            }
                        }
                        , {field: 'checkName', width: 120, event: 'set14', title: '一级审核人', sort: true}
                        , {
                            field: 'checkTime', width: 180, event: 'set15', title: '一级审核时间', sort: true
                            , templet: function (d) {
								if (d.checkTime == null) {
									return "";
								}
                                var date = new Date(d.checkTime);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
                                var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
                                var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
                                return Y + M + D + h + m + s;
                            }
                        }
                        , {field: 'checkSecondName', width: 120, event: 'set16', title: '二级审核人', sort: true}
                        , {
                            field: 'checkSecondTime', width: 180, event: 'set17', title: '二级审核时间', sort: true
                            , templet: function (d) {
								if (d.checkSecondTime == null) {
									return "";
								}
                                var date = new Date(d.checkSecondTime);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
                                var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
                                var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
                                return Y + M + D + h + m + s;
                            }
                        }
                        ,{field:'unAccessReason',width:140, event: 'set16', title: '一级审核未通过的理由', sort: true}
                        ,{field:'mark',width:140, event: 'set16', title: '二级审核未通过的理由', sort: true}
                        , {
                            fixed: 'right',
                            width: 200,
                            event: 'set14',
                            title: '操作',
                            align: 'center',
                            toolbar: '#barDemo'
                        }
                    ]]
                    ,
                    page: true
                    ,
                    where: {"terminalId": terminalId, "statusId": statusId, "startDate": startTime, "endDate": endTime}
                    ,
                    done: function (res, curr, count) {
                        //document.getElementById("table1").remove();
                        if (res.fail == 1) {
                            layer.msg(res.msg, {icon: 5, time: 2000});
                        }
                        //console.log(res.msg);
                    }
                });


                var active = {
                    getDeleteData: function () { //获取选中数据
                        var checkStatus = table.checkStatus('flagOne')
                            , data = checkStatus.data;
                        var mids = [];
                        for (var i = 0; i < data.length; i++) {
                            mids.push(data[i].pid);
                        }

                        if (mids.length == 0) {
                            layer.msg('请选择要删除的数据!', {icon: 6, time: 1500});
                            return;
                        }
                        //批量删除
                        layer.confirm('确定删除选中的播表吗', function (index) {
                            //obj.del();
                            layer.close(index);

                            $.ajax({
                                type: "POST",
                                url: "<%=request.getContextPath()%>/ptable/delPtable.do",
                                data: {"ids": mids},
                                traditional: true,
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        refresh();
                                        layer.msg('删除成功!', {icon: 6, time: 2000});
                                    } else {
                                        layer.msg(data.msg, {icon: 5, time: 2000});
                                    }
                                }
                            });
                        });
                    }
                };

                $('.operatorTable').on('click', function () {
                    var othis = $(this);
                    var dothing = othis.attr("function");
                    if (dothing == "getDeleteData") {
                        //console.log(dothing);
                        active.getDeleteData();
                    }
                });

                getExcel = function () {
                    var url = '<%=request.getContextPath()%>/ptable/generateExcel.do?terminalId=' + $("#terminal").val() + '&startTime=' + $("#startTime").val() + '&endTime=' + $("#endTime").val() + '&statusId=' + $("#statusId").val();
                    console.log(url);
                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', url, true);    // 也可以使用POST方式，根据接口
                    xhr.responseType = "blob";  // 返回类型blob
                    // 定义请求完成的处理函数，请求前也可以增加加载框/禁用下载按钮逻辑
                    xhr.onload = function () {
                        // 请求完成
                        if (this.status === 200) {
                            // 返回200
                            var blob = this.response;
                            var reader = new FileReader();
                            reader.readAsDataURL(blob);  // 转换为base64，可以直接放入a表情href
                            reader.onload = function (e) {
                                // 转换完成，创建一个a标签用于下载
                                var a = document.createElement('a');
                                a.download = 'data.xls';
                                a.href = e.target.result;
                                $("body").append(a);  // 修复firefox中无法触发click
                                a.click();
                                $(a).remove();
                            }
                        }
                    };
                    // 发送ajax请求
                    xhr.send()
                }

                table.on('tool(tableEvent)', function (obj) {
                    var tmpdata = obj.data;
                    var pid = tmpdata.pid;
                    var periodName = tmpdata.periodName + " ";
                    var tid = tmpdata.tid;
                    if (obj.event === 'mediaInfo') {
                        console.log('<%=request.getContextPath()%>/ptable/goModifyPtable/' + pid + '/' + periodName + '/' + tid + '.do');
                        document.location = '<%=request.getContextPath()%>/ptable/goModifyPtable/' + pid + '/' + periodName + '/' + tid + '.do';
                    }
                });

                table.on('sort(flagOne)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                    console.log(obj.field); //当前排序的字段名
                    console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
                    console.log(this) //当前排序的 th 对象*/

                });

            });
        }


    </script>

</head>
<body>
<input type="hidden" id="videoView" value="">
<div class="layui-fluid">
    <div class="layui-row layui-col-space1">
        <div class="layui-col-md12">
            <div class="layui-form-query">
                <form class="layui-form" id="query_form">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-mid">终端：</label>
                            <div class="layui-input-inline"
                                 style="width: 140px; height: 35px;">
                                <select name="terminal" id="terminal" lay-verify="required" lay-search=""
                                        style="width: 140px; height: 35px;">
                                    <option value="">直接选择或搜索</option>
                                    <c:forEach items="${terminalPtable}" var="terminal" varStatus="status">
                                        <option value="${terminal.terminalId}">${terminal.terminalName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-mid">播放日期范围：</label>
                            <div class="layui-inline" style="">
                                <input type="text" id="startTime" name="startTime" autocomplete="off"
                                       style="width: 100px; height: 36px;" class="layui-input fsDate" dateRange="1"/>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <div class="layui-inline" style="">
                                <label class="layui-form-mid">-&nbsp;&nbsp;&nbsp;</label>
                                <input type="text" id="endTime" name="endTime" autocomplete="off"
                                       style="width: 100px; height: 36px;" class="layui-input fsDate" dateRange="1"/>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-mid">状态：</label>
                            <div class="layui-input-inline"
                                 style="width: 150px; height: 35px;">
                                <select id="statusId" name="statusId" style="width: 150px; height: 35px;">
                                    <option value="">-请选择-</option>
                                    <option value="1">未审核</option>
                                    <option value="4">未通过</option>
                                    <option value="2">已初审</option>
                                    <option value="3">通过</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <div class="layui-inline">
                                <button class="layui-btn" type="button" onclick="init()">
                                    <i class="layui-icon">&#xe615;</i>查询
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger operatorTable" function="getDeleteData" data-type="getDeleteData">
                <i class="layui-icon">&#xe640;</i>批量删除
            </button>
            <button class="layui-btn" onclick="refresh()">
                <i class="layui-icon">&#x1002;</i>刷新
            </button>
            </button>

            <button class="layui-btn operatorTable" onclick="getExcel()">
                <i class="layui-icon">&#xe642;</i>导出为EXCEL
            </button>
        </div>
        <div class="layui-col-md12">
            <table class="layui-table" id="table1" lay-filter="tableEvent"></table>
            <!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="top" topUrl="views/datagrid2/one.html" topMode="readonly" topWidth="800px" topHeight="600px" topTitle="查看demo" inputs="id:">查看</a> -->
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-sm" lay-event="mediaInfo">
                    <i class="layui-icon">&#xe6ed;</i>详情</a>

            </script>
            <script type="text/html" id="barDemo1">
                <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5">MD5</a>
            </script>
        </div>

    </div>
</div>

<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
    });
</script>
</body>
</html>