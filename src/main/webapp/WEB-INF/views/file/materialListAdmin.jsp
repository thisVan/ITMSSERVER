<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="/layui/header.jsp" %>
    <title>稿件列表</title>
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
        var node = [];
        var terminalVal = [];
        $(function () {
            treeSearch();
            init();
            getAllTerminal();
        });


        function getAllTerminal() {
            $.ajax({
                url: '<%=request.getContextPath()%>/material/findAllTerminal.do',
                type: "get",
                dataType: "json",
            })
                .done(function (msg) {
                    var data = msg.data;
                    for (var i = 0; i < data.length; i++) {
                        terminalVal.push(data[i]);
                    }

                })
                .fail(function (xhr, status, errorThrown) {
                    alert("Sorry, there was a problem!");
                    console.log("Error: " + errorThrown);
                    console.log("Status: " + status);
                    console.dir(xhr);
                })
        }


        function init() {
            layui.use('layer', function () {
                var layer = layui.layer;
            });

            layui.use('laydate', function () {
                var laydate = layui.laydate;
                var nowDate = moment().format("YYYY-MM-DD"),   obj = {};
                obj[nowDate] = nowDate.split("-")[2];
                //执行一个laydate实例
                laydate.render({
                    elem: '#dateTime' //指定元素
                    , range: true
                    ,mark:obj
                });
            });

            var param = "";

            //名称
            var materialName = $("#materialName").val();
            if (materialName != "") {
                param = param + "materialName" + ",like,%" + materialName + "%,";
            }


            //类型
            var fileType = $("#fileType").val();
            if (fileType != "") {
                param = param + "fileType" + ",=," + fileType + ",";
            }


            //状态
            var statusId = $("#statusId").val();
            if (statusId != "") {
                param = param + "statusId" + ",=," + statusId + ",";
            }

            //时间
            var dateTime = $("#dateTime").val();

            layui.use('table', function () {
                var table = layui.table;
                table.render({
                    elem: '#table1'
                    , id: 'flagTwo'
                    , url: '<%=request.getContextPath()%>/material/searchFile.do'
                    //,height: 550
                    //,cellMinWidth: 120
                    , height: 'full-200'
                    , limits: [10, 25, 50, 75, 100]
                    , cols: [[
                        //{field:'id', width:'1%'}
                        {checkbox: true, event: 'set1', fixed: true}
                        , {field: 'materialName', width: 280, event: 'set2', title: '稿件名', fixed: true, sort: true}
                        , {
                            field: 'terminalName', width: 120, event: 'set3', title: '终端名', sort: true
                            , templet: function (d) {
                                var tname = d.tis;
                                var name = d.terminal;
                                if (tname == '0') {
                                    return '<span style="color: #FF6347;">' + '未选择' + '</span>';
                                } else {
                                    return '<span style="color: #1E9FFF;">' + name.terminalName + '</span>';
                                }
                            }
                        }
                        , {
                            field: 'statusId', width: 100, event: 'set4', title: '审核状态', sort: true
                            , templet: function (d) {
                                var state = d.statusId;
                                if (state == 1) {
                                    return '<span style="color: #FF6347;">' + '未审核' + '</span>';
                                } else if (state == 2) {
                                    return '<span style="color: #90EE90;">' + '已初审' + '</span>';
                                } else if (state == 3) {
                                    return '<span style="color: #90EE90;">' + '已通过' + '</span>';
                                } else if (state == 4) {
                                    return '<span style="color: #FF6347;">' + '未通过' + '</span>';
                                }
                            }
                        }
                        , {field: 'duration', width: 80, event: 'set7', title: '时长', sort: true}
                        , {field: 'size', width: 100, event: 'set6', title: '稿件大小'}
                        , {field: 'resolution', width: 100, event: 'set5', title: '分辨率'}
                        , {field: 'usedNum', width: 80, event: 'set8', title: '使用次数', sort: true}
                        , {
                            field: 'info', width: 100, event: 'set9', title: '排播状态', sort: true
                            , templet: function (d) {
                                var state = d.info;
                                if (state == 0) {
                                    return '<span style="color: #FF6347;">' + '未排播' + '</span>';
                                } else if (state == 1) {
                                    return '<span style="color: #90EE90;">' + '已排播' + '</span>';
                                }
                            }
                        }
                        /* ,{field:'playDate',width:200, event: 'set9', title: '播放日期', sort: true}
                        ,{field:'playTime',width:200, event: 'set10', title: '播放时段', sort: true}
                        ,{field:'frequency',width:100, event: 'set11', title: '频次', sort: true} */
                        , {
                            field: 'uploadTime', width: 160, event: 'set10', title: '上传时间', sort: true
                            , templet: function (d) {
                                var date = new Date(d.uploadTime);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
                                var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
                                var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
                                return Y + M + D + h + m + s;
                            }
                        }
                        , {field: 'uploadName', width: 90, event: 'set11', title: '上传人', sort: true}
                        , {
                            field: 'checkTime', width: 180, event: 'set12', title: '一级审核时间', sort: true
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
                        , {field: 'checkName', width: 120, event: 'set13', title: '一级审核人', sort: true}
                        , {
                            field: 'checkSecondTime', width: 180, event: 'set14', title: '二级审核时间', sort: true
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
                        , {field: 'checkSecondName', width: 120, event: 'set15', title: '二级审核人', sort: true}
                        , {field: 'unAccessReason', width: 140, event: 'set16', title: '未通过的理由', sort: true}
                        , {fixed: 'right', width: 80, event: 'set17', title: '操作', align: 'center', toolbar: '#barDemo'}
                    ]]
                    , page: true
                    , where: {"param": param, "dateTime": dateTime, "field": "uploadTime", "order": "desc"}
                    , done: function (res, curr, count) {
                        //changeBg();
                    }
                });

                table.on('sort(tableEvent)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                    table.reload('flagTwo', { //testTable是表格容器id
                        initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
                        , where: {
                            field: obj.field //排序字段
                            , order: obj.type //排序方式
                        }
                    });
                });


                table.on('checkbox(tableEvent)', function (obj) {
                    //console.log(obj);
                });

                var active = {
                    getDeleteData: function () { //获取选中数据
                        var checkStatus = table.checkStatus('flagTwo')
                            , data = checkStatus.data;
                        var mids = [];
                        for (var i = 0; i < data.length; i++) {
                            mids.push(data[i].mid);
                        }
                        if (mids.length == 0) {
                            layer.msg('请选择要删除的数据!', {icon: 6, time: 1500});
                            return;
                        }
                        //批量删除
                        layer.confirm('真的删除这些稿件么', function (index) {
                            //obj.del();
                            layer.close(index);
                            console.log(mids.length);
                            $.ajax({
                                type: "POST",
                                url: "<%=request.getContextPath()%>/material/delMaterial.do",
                                data: {"mid": mids},
                                traditional: true,
                                dataType: "json",
                                success: function (msg) {
                                    var value = msg.toString();
                                    if (value == "true") {
                                        init();
                                        layer.msg('删除成功!', {icon: 6, time: 4000});
                                    }
                                    if (value == "false") {
                                        init();
                                        layer.msg('删除失败!只能删除未审核且你自己上传的！', {icon: 5, time: 4000});
                                    }
                                }
                            });
                        });
                    }
                    , getUpdateData: function () { //获取选中数据
                        var checkStatus = table.checkStatus('flagTwo')
                            , data = checkStatus.data;
                        if (data.length == 1) {
                            var mmid = data[0].mid;
                            var mname = data[0].materialName;
                            layer.open({
                                title: '稿件修改列表',
                                type: 2,
                                area: ['50%', '95%'],
                                content: '<%=request.getContextPath()%>/views/ajaxViews/material-update.jsp',
                                success: function (layero, index) {
                                    var body = layer.getChildFrame('body', index);//建立父子联系
                                    var iframeWin = window[layero.find('iframe')[0]['name']];

                                    var inputList = body.find('input');
                                    $(inputList[0]).val(mmid);
                                    $(inputList[1]).val(mname);

                                    if (data[0].tis == "1") {  //邦定了终端就要初始化可修改的播放端
                                        iframeWin.setUpdateTerminal(terminalVal, data[0].terminal);
                                    }
                                }
                                //end: function(){
                                //window.location.reload();
                                //}
                            });
                        } else if (data.length == 0) {
                            layer.msg('请选择要修改的数据!', {icon: 6, time: 1500});
                        } else {
                            layer.msg('只能选中一条数据修改!', {icon: 6, time: 1500});
                        }
                        //console.log(checkStatus.data.length) //获取选中行数量，可作为是否有选中行的条件
                        //console.log(checkStatus.isAll ) //表格是否全选
                        //layer.msg('选中了：'+ data.length + ' 个');
                    }
                };

                $('.operatorTable').on('click', function () {
                    var othis = $(this);
                    var dothing = othis.attr("function");
                    if (dothing == "getDeleteData") {
                        //console.log(dothing);
                        active.getDeleteData();
                    } else if (dothing == "getUpdateData") {
                        //console.log(dothing);
                        active.getUpdateData();
                    }
                });

                table.on('tool(tableEvent)', function (obj) {
                    var tmpdata = obj.data;
                    var mid = tmpdata.mid;
                    var md5 = tmpdata.md5;
                    var filePath = tmpdata.filePath;
                    var name = filePath.split("/");
                    var realname = name[name.length - 1];
                    document.getElementById("videoView").value = realname;
                    if (obj.event === 'mediaView') {
                        $.ajax({
                            type: "POST",
                            url: '<%=request.getContextPath()%>/material/deposeMaterial.do',
                            data: {"mid": mid},
                            dataType: "json",
                            success: function (msg) {
                                var value = msg.toString();
                                if (value == "true") {
                                    window.open('<%=request.getContextPath()%>/file/videoViewDepose.jsp', "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
                                } else if (value == "false") {
                                    window.open('<%=request.getContextPath()%>/file/videoView.jsp', "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
                                }
                            }
                        });
                    } else if (obj.event == "md5") {
                        layer.open({
                            title: 'MD5'
                            , content: md5
                        });
                    }
                });
            });
        }


        function myTrim(x) {
            return x.replace(/^\s+|\s+$/gm, '');
        }


        function treeSearch() {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/material/treeDate.do",
                dataType: "json",
                success: function (msg) {
                    for (var i = 0; i < msg.length; i++) {
                        node.push({
                            name: '' + msg[i].name,
                            id: '' + msg[i].id,
                            spread: '' + true
                        });
                        if (msg[i].children.length > 0) {
                            var child = [];
                            for (var j = 0; j < msg[i].children.length; j++) {
                                child.push({
                                    name: '' + msg[i].children[j].name,
                                    id: '' + msg[i].children[j].id
                                });
                            }
                        }
                        node[i].children = child;
                    }

                    layui.use(['tree', 'layer'], function () {
                        var layer = layui.layer
                            , $ = layui.jquery;

                        layui.tree({
                            elem: '#demo1' //指定元素
                            , target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
                            , click: function (item) { //点击节点回调
                                //layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
                                //console.log(item);
                                var id = item.id;
                                doTreeSearch(id);
                            }
                            , nodes: node
                        });
                    });
                }
            });
        }

        function doTreeSearch(id) {
            layui.use('table', function () {
                var table = layui.table;
                // if(id == null || "".equals(id)){
                // 	id = "t9";
                // }
                table.render({
                    elem: '#table1'
                    , id: 'flagTwo'
                    , url: '<%=request.getContextPath()%>/material/searchTreeFile.do'
                    , height: 550
                    //,cellMinWidth: 120
                    , limits: [10, 25, 50, 75, 100]
                    , cols: [[
                        //{field:'id', width:'1%'}
                        {checkbox: true, event: 'set1', fixed: true}
                        , {field: 'materialName', width: 280, event: 'set2', title: '稿件名', fixed: true, sort: true}
                        , {
                            field: 'terminalName', width: 120, event: 'set3', title: '终端名', sort: true
                            , templet: function (d) {
                                var tname = d.tis;
                                var name = d.terminal;
                                if (tname == '0') {
                                    return '<span style="color: #FF6347;">' + '未选择' + '</span>';
                                } else {
                                    return '<span style="color: #1E9FFF;">' + name.terminalName + '</span>';
                                }
                            }
                        }
                        , {
                            field: 'statusId', width: 100, event: 'set4', title: '审核状态', sort: true
                            , templet: function (d) {
                                var state = d.statusId;
                                if (state == 1) {
                                    return '<span style="color: #FF6347;">' + '未审核' + '</span>';
                                } else if (state == 2) {
                                    return '<span style="color: #90EE90;">' + '已初审' + '</span>';
                                } else if (state == 3) {
                                    return '<span style="color: #90EE90;">' + '已通过' + '</span>';
                                } else if (state == 4) {
                                    return '<span style="color: #FF6347;">' + '未通过' + '</span>';
                                }
                            }
                        }
                        , {field: 'duration', width: 80, event: 'set7', title: '时长', sort: true}
                        , {field: 'size', width: 100, event: 'set6', title: '稿件大小'}
                        , {field: 'resolution', width: 100, event: 'set5', title: '分辨率'}
                        , {field: 'usedNum', width: 100, event: 'set8', title: '使用次数', sort: true}
                        , {
                            field: 'info', width: 100, event: 'set9', title: '排播状态', sort: true
                            , templet: function (d) {
                                var state = d.info;
                                if (state == 0) {
                                    return '<span style="color: #FF6347;">' + '未排播' + '</span>';
                                } else if (state == 1) {
                                    return '<span style="color: #90EE90;">' + '已排播' + '</span>';
                                }
                            }
                        }
                        /* ,{field:'playDate',width:200, event: 'set9', title: '播放日期', sort: true}
                        ,{field:'playTime',width:200, event: 'set10', title: '播放时段', sort: true}
                        ,{field:'frequency',width:100, event: 'set11', title: '频次', sort: true} */
                        , {
                            field: 'uploadTime', width: 160, event: 'set10', title: '上传时间', sort: true
                            , templet: function (d) {
                                var date = new Date(d.uploadTime);
                                var Y = date.getFullYear() + '-';
                                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                                var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
                                var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
                                var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
                                var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
                                return Y + M + D + h + m + s;
                            }
                        }
                        , {field: 'uploadName', width: 90, event: 'set11', title: '上传人', sort: true}
                        , {
                            field: 'checkTime', width: 180, event: 'set13', title: '一级审核时间', sort: true
                            , templet: function (d) {
                                if (d.checkTime == null) {
                                    return "";
                                } else {
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
                        }
                        , {field: 'checkName', width: 120, event: 'set14', title: '一级审核人', sort: true}
                        , {
                            field: 'checkSecondTime', width: 180, event: 'set15', title: '二级审核时间', sort: true
                            , templet: function (d) {
                                if (d.checkSecondTime == null) {
                                    return "";
                                } else {
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
                        }
                        , {field: 'checkSecondName', width: 120, event: 'set16', title: '二级审核人', sort: true}
                        , {field: 'unAccessReason', width: 140, event: 'set17', title: '未通过的理由', sort: true}
                        , {fixed: 'right', width: 80, event: 'set12', title: '操作', align: 'center', toolbar: '#barDemo'}
                    ]]
                    , page: true
                    , where: {"treeId": id}
                    , done: function (res, curr, count) {
                        //changeBg();
                    }
                });

                table.on('sort(tableEvent)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                    table.reload('flagTwo', { //testTable是表格容器id
                        initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
                        , where: {
                            field: obj.field //排序字段
                            , order: obj.type //排序方式
                        }
                    });
                });


                table.on('checkbox(tableEvent)', function (obj) {
                    //console.log(obj);
                    var checkStatus = table.checkStatus('flagTwo');
                    var da = checkStatus.data;
                });


                table.on('tool(tableEvent)', function (obj) {
                    var tmpdata = obj.data;
                    var mid = tmpdata.mid;
                    var md5 = tmpdata.md5;
                    var filePath = tmpdata.filePath;
                    var name = filePath.split("/");
                    var realname = name[name.length - 1];
                    document.getElementById("videoView").value = realname;
                    if (obj.event === 'mediaView') {
                        $.ajax({
                            type: "POST",
                            url: '<%=request.getContextPath()%>/material/deposeMaterial.do',
                            data: {"mid": mid},
                            dataType: "json",
                            success: function (msg) {
                                var value = msg.toString();
                                if (value == "true") {
                                    window.open('<%=request.getContextPath()%>/file/videoViewDepose.jsp', "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
                                } else if (value == "false") {
                                    window.open('<%=request.getContextPath()%>/file/videoView.jsp', "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
                                }
                            }
                        });
                    } else if (obj.event === 'md5') {
                        layer.open({
                            title: 'MD5'
                            , content: md5
                        });
                    }
                });
            });
        }

        function refresh() {
            init();
        }

    </script>

</head>
<body>
<input type="hidden" id="videoView" value="">
<div style="width: 14%; height:100%; float: left">
    <%--	    <br><font  size="4"  color="red">双击打开关闭</font><br>--%>

    <ul id="demo1">
        <li data-spread="true" onclick="refresh()">
            <i class="layui-icon layui-tree-branch"></i>
            <city>全部</city>
        </li>
    </ul>
</div>
<div style="width: 86%; height:100%; float: left">
    <div class="layui-fluid">
        <div class="layui-row layui-col-space1">
            <div class="layui-col-md12">
                <div class="layui-form-query">
                    <form class="layui-form" id="query_form">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-mid">稿件名：</label>
                                <div class="layui-input-inline"
                                     style="width: 100px; height: 35px;">
                                    <input type="tel" id="materialName" name="materialName" autocomplete="off"
                                           style="width: 120px; height: 35px;" placeholder="稿件名"
                                           class="layui-input input-text"/>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <label class="layui-form-mid">类型：</label>
                                <div class="layui-input-inline"
                                     style="width: 90px; height: 35px;">
                                    <select id="fileType" name="fileType" style="width: 150px; height: 35px;">
                                        <option value="">请选择</option>
                                        <option value="vedio">视频</option>
                                        <option value="picture">图片</option>
                                        <option value="other">其他</option>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <label class="layui-form-mid">状态：</label>
                                <div class="layui-input-inline"
                                     style="width: 90px; height: 35px;">
                                    <select id="statusId" name="statusId" style="width: 150px; height: 35px;">
                                        <option value="">请选择</option>
                                        <option value="1">未审核</option>
                                        <option value="3">通过</option>
                                        <option value="4">未通过</option>
                                        <option value="">全部</option>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <label class="layui-form-mid">上传日期范围：</label>
                                <div class="layui-inline" style="">
                                    <input type="text" id="dateTime" name="dateTime" autocomplete="off"
                                           style="width: 170px; height: 36px;" class="layui-input fsDate" dateRange="1"
                                           placeholder=" - "/>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <div class="layui-inline">
                                    <button class="layui-btn" type="button" function="query" onclick="init()">
                                        <i class="layui-icon">&#xe615;</i>查询
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="layui-col-md12">
                <div class="layui-row grid-demo">
                    <div class="layui-btn-container">
                        <button class="layui-btn operatorTable" function="getUpdateData" data-type="getUpdateData">
                            <i class="layui-icon">&#xe642;</i>修改
                        </button>
                        <button class="layui-btn layui-btn-danger operatorTable" function="getDeleteData"
                                data-type="getDeleteData">
                            <i class="layui-icon">&#xe640;</i>批量删除
                        </button>
                        <button class="layui-btn" onclick="refresh()">
                            <i class="layui-icon">&#x1002;</i>刷新
                        </button>
                    </div>

                    <div class="layui-col-md12">
                        <table class="layui-table" id="table1" lay-filter="tableEvent"></table>
                        <!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="top" topUrl="views/datagrid2/one.html" topMode="readonly" topWidth="800px" topHeight="600px" topTitle="查看demo" inputs="id:">查看</a> -->
                        <script type="text/html" id="barDemo">
                            <a class="layui-btn layui-btn-sm" lay-event="mediaView">预览</a>
                        </script>
                        <script type="text/html" id="barDemo1">
                            <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5">MD5</a>
                        </script>
                    </div>
                </div>
            </div>
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