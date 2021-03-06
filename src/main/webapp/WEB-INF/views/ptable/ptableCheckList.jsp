<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/layui/header.jsp"%>
<title>播表列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
<script type="text/javascript">
	layui.use('form', function(){
		  var form = layui.form;
		  form.on('select(test)', function(data){
			  //console.log(data);
			  if(data.value == 1){
				  init();
			  }else if(data.value == 4){
				  initUnaccess();
			  }
			});
		});
	</script>
<script type="text/javascript" defer="defer">
	$(function() {
		init();
	});

	function init() {
		layui.use('layer', function() {
			var layer = layui.layer;
		});

		//状态
		var statusId = $("#statusId").val();
		if (statusId == 1) {
			initUncheck();
		} else if (statusId == 4) {
			initUnaccess();
		}
	}

	function initUncheck() {
		layui.use('layer', function() {
			var layer = layui.layer;
		});

		//状态
		var statusId = $("#statusId").val();

		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#table1',
				id : 'flagOne',
				url : '<%=request.getContextPath()%>/ptable/searchUnckeckFirstPtable.do',
				//height : 550, //,cellMinWidth: 120
				height:'full-200',
				limits : [ 10, 25, 50, 75, 100 ],
				cols : [ [
					//{field:'id', width:'1%'}
					{
						checkbox : true,
						event : 'set1',
						fixed : true
					},
					{
						field : 'ptableName',
						width : 250,
						event : 'set1',
						title : '播表名',
						fixed : true,
						sort : true
					}
					, {
						field : 'playDate',
						width : 110,
						event : 'set2',
						title : '播放日期',
						sort : true,
						templet : function(d) {
							var date = new Date(d.playDate);
							var Y = date.getFullYear() + '-';
							var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
							var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
							return Y + M + D;
						}
					}
					, {
						field : 'periodTime',
						width : 260,
						event : 'set3',
						title : '时段范围',
						sort : true,
						templet : function(d) {
							// var periodName = d.periodName;
							// var periodTime = d.periodTime;
							// return periodName + " " + periodTime;
							var flag = d.insertFlag;
							if(flag == '0'){
								return d.periodSName + " " +d.startInterval+"-"+d.endInterval;
							}else if(flag == '1'){
								return d.startTime +"-"+d.endTime;
							}
						}
					}
					, {
						field : 'insertFlag',
						width : 100,
						event : 'set4',
						title : '播表类型',
						sort : true,
						templet : function(d) {
							var flag = d.insertFlag;
							if (flag == '0') {
								return '<span style="color: #90EE90;">周期轮播</span>';
							} else if (flag == '1') {
								return '<span style="color: #FF6347;">插播</span>';
							}
						}
					}
					, {
						field : 'statusId',
						width : 100,
						event : 'set5',
						title : '审核状态',
						sort : true,
						templet : function(d) {
							var state = d.statusId;
							if (state == 1) {
								return '<span style="color: #FF6347;">' + '未审核' + '</span>';
							} else if (state == 2) {
								return '<span style="color: #90EE90;">' + '已初审' + '</span>';
							} else if (state == 3) {
								return '<span style="color: #90EE90;">' + '已通过' + '</span>';
							} else if (state == 4) {
								return '<span style="color: #FF6347;">' + '未通过' + '</span>';
							}else if (state == 0){
								return '<span style="color: #FFD133;">' + '已停止' + '</span>';
							}
						}
					}
					, {
						field : 'playTotalTime',
						width : 120,
						event : 'set6',
						title : '播表时长',
						sort : true
					}
					, {
						field : 'allTime',
						width : 120,
						event : 'set7',
						title : '可播时长'
					}
					, {
						field : 'screenRate',
						width : 100,
						event : 'set8',
						title : '占屏比',
						sort : true
					}
					, {
						field : 'terminalName',
						width : 120,
						event : 'set9',
						title : '终端名',
						sort : true
					}
					, {
						field : 'createName',
						width : 120,
						event : 'set10',
						title : '创建人',
						sort : true
					}
					, {
						field : 'createTime',
						width : 180,
						event : 'set11',
						title : '创建时间',
						sort : true,
						templet : function(d) {
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
					,{field:'unAccessReason',width:140, event: 'set16', title: '一级审核未通过的理由', sort: true}
					,{field:'mark',width:140, event: 'set16', title: '二级审核未通过的理由', sort: true}
					, {
						fixed : 'right',
						width : 100,
						event : 'set12',
						title : '操作',
						align : 'center',
						toolbar : '#barDemo'
					}
				] ],
				page : true,
				where : {
					"statusId" : statusId,
					"sortName" : "playDate",
					"sortBy" : "desc"
				},
				done : function(res, curr, count) {
					//document.getElementById("table1").remove();
					if (res.fail == 1) {
						layer.msg(res.msg, {
							icon : 5,
							time : 2000
						});
					}
				//console.log(res.msg);
				}
			});

			var active = {
				getBatchAudit : function() { 
					//获取选中数据
					var checkStatus = table.checkStatus('flagOne'),
						data = checkStatus.data;
					var pid = [];
					var ptableNames = [];
					var statusids = [];
					for (var i = 0; i < data.length; i++) {
						pid.push(data[i].pid);
						statusids.push(data[i].statusId);
						var j = data[i].ptableName.indexOf("(");
						var pt = data[i].ptableName.substring(0, j);
						if (ptableNames.indexOf(pt) < 0) {
							ptableNames.push(pt);
						}
					}
					console.log(ptableNames);
					console.log(pid);
					if (pid.length == 0) {
						layer.msg('请选择要审核的播表!', {
							icon : 6,
							time : 1500
						});
						return;
					} else if (ptableNames.length > 1) {
						for (var i = 0; i < ptableNames.length; i++) {
							if (ptableNames.indexOf(ptableNames[i]) > 0) {
								layer.msg('请选择一致的播表名!', {
									icon : 6,
									time : 1500
								});
								init();
							}
						}
					} else if (statusids.indexOf("3") > -1) {
						layer.msg('选择的播表含有已通过播表!', {
							icon : 6,
							time : 2000
						});
						init();
					}

					//批量审核
					else {
						layer.confirm('确认审核选中的播表吗', {
							icon : 3,
							title : '提示',
							btn : [ '是', '否' ],
							btn2 : function(index, layero) {
								init();
								layer.close(index);
							}
						},
							function(index) {
								var pids = pid.join(",");
								document.location = '<%=request.getContextPath()%>/ptable/goCheckPtablesFirst/' + pids + '.do';
							}
						);
					}
				}
			}

			$('.operatorTable').on('click', function() {
				var othis = $(this);
				var dosomething = othis.attr("function");
				if (dosomething == "getBatchAudit") {
					active.getBatchAudit();
				}
			});

			table.on('tool(tableEvent)', function(obj) {
				var tmpdata = obj.data;
				var pid = tmpdata.pid;
				if (obj.event === 'mediaInfo') {
					document.location = '<%=request.getContextPath()%>/ptable/goCheckPtableFirst/' + pid + '.do';
				}
			});
		});
	}

	function initUnaccess() {
		layui.use('layer', function() {
			var layer = layui.layer;
		});

		//状态
		var statusId = $("#statusId").val();

		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#table1',
				id : 'flagOne',
				url : '<%=request.getContextPath()%>/ptable/searchUnckeckFirstPtable.do',
				//height : 550, //,cellMinWidth: 120
				height:'full-200',
				limits : [ 10, 25, 50, 75, 100 ],
				cols : [ [
					//{field:'id', width:'1%'}
					{
						field : 'ptableName',
						width : 250,
						event : 'set1',
						title : '播表名',
						fixed : true,
						sort : true
					}
					, {
						field : 'mark',
						width : 150,
						event : 'set2',
						title : '备注'
					}
					, {
						field : 'playDate',
						width : 110,
						event : 'set3',
						title : '播放日期',
						sort : true,
						templet : function(d) {
							var date = new Date(d.playDate);
							var Y = date.getFullYear() + '-';
							var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
							var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
							return Y + M + D;
						}
					}
					, {
						field : 'periodTime',
						width : 260,
						event : 'set4',
						title : '时段范围',
						sort : true,
						templet : function(d) {
							// var periodName = d.periodName;
							// var periodTime = d.periodTime;
							// return periodName + " " + periodTime;
							var flag = d.insertFlag;
							if(flag == '0'){
								return d.periodSName + " " +d.startInterval+"-"+d.endInterval;
							}else if(flag == '1'){
								return d.startTime +"-"+d.endTime;
							}
						}
					}
					, {
						field : 'insertFlag',
						width : 100,
						event : 'set5',
						title : '播表类型',
						sort : true,
						templet : function(d) {
							var flag = d.insertFlag;
							if (flag == '0') {
								return '<span style="color: #90EE90;">周期轮播</span>';
							} else if (flag == '1') {
								return '<span style="color: #FF6347;">插播</span>';
							}
						}
					}
					, {
						field : 'statusId',
						width : 110,
						event : 'set6',
						title : '审核状态',
						sort : true,
						templet : function(d) {
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
					, {
						field : 'playTotalTime',
						width : 120,
						event : 'set7',
						title : '播表时长',
						sort : true
					}
					, {
						field : 'allTime',
						width : 120,
						event : 'set8',
						title : '可播时长'
					}
					, {
						field : 'screenRate',
						width : 100,
						event : 'set9',
						title : '占屏比',
						sort : true
					}
					, {
						field : 'terminalName',
						width : 120,
						event : 'set10',
						title : '终端名',
						sort : true
					}
					, {
						field : 'createName',
						width : 120,
						event : 'set11',
						title : '创建人',
						sort : true
					}
					, {
						field : 'createTime',
						width : 180,
						event : 'set12',
						title : '创建时间',
						sort : true,
						templet : function(d) {
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
						fixed : 'right',
						width : 100,
						event : 'set13',
						title : '操作',
						align : 'center',
						toolbar : '#barDemo'
					}
				] ],
				page : true,
				where : {
					"statusId" : statusId
				},
				done : function(res, curr, count) {
					//document.getElementById("table1").remove();
					if (res.fail == 1) {
						layer.msg(res.msg, {
							icon : 5,
							time : 2000
						});
					}
				//console.log(res.msg);
				}
			});

			table.on('tool(tableEvent)', function(obj) {
				var tmpdata = obj.data;
				var pid = tmpdata.pid;
				if (obj.event === 'mediaInfo') {
					document.location = '<%=request.getContextPath()%>/ptable/goCheckPtableFirst/' + pid + '.do';
				}
			});
		});
	}
	
	setInterval(init, 30 * 60 * 1000);
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
								<label class="layui-form-mid">状态：</label>
								<div class="layui-input-inline"
									style="width: 150px; height: 35px;">
									<select id="statusId" name="statusId"
										style="width: 150px; height: 35px;" lay-filter="test">
										<option value="1">未审核</option>
										<option value="4">二审未通过</option>
									</select>
								</div>
							</div>

							<!-- <div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" type="button" onclick="init()">
										<i class="layui-icon">&#x1002;</i>刷新
									</button>
								</div>
							</div> -->
						</div>
					</form>
				</div>
			</div>

			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-danger operatorTable"
					function="getBatchAudit" data-type="getBatchAudit">
					<i class="layui-icon">&#xe6ed;</i>批量审核 普通用户
				</button>
				<button class="layui-btn" type="button" onclick="init()">
					<i class="layui-icon">&#x1002;</i>刷新
				</button>
			</div>
			
			<div class="layui-col-md12">
            <table class="layui-table" id="table1" lay-filter="tableEvent"></table>
			<script type="text/html" id="barDemo">
 				<a class="layui-btn layui-btn-sm" lay-event="mediaInfo">
                <i class="layui-icon">&#xe6ed;</i>审核</a>
			</script>
			<script type="text/html" id="barDemo1">
 				<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5" >MD5</a>
			</script>
	      </div>
		</div>
	</div>
</body>
</html>