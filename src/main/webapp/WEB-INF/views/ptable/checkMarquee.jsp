<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/layui/header.jsp"%>
<title>LOGO/图片叠加初审</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/st/Sortable.js"></script> --%>
<script type="text/javascript" defer="defer">
	var mid = '${mid}';
	$(function() {
		initTable();
	});

	function initTable() {
		layui.use('layer', function() {
			var layer = layui.layer;
		});
		layui.use('table', function() {
			var table = layui.table;
			table.render({
				elem : '#table1',
				id : 'flagOne',
				url : '<%=request.getContextPath()%>/ptable/getMarqueeById.do', //,height: 320
				skin : 'row', //,cellMinWidth: 120
				even : true,
				title: "LOGO/图片叠加详情",
				toolbar: '#toolbarDemo',
				limits : [ 10, 25, 50, 75, 100 ],
				cols : [ [
					//{field:'id', width:'1%'}
					{
						type : 'numbers'
					}
					, {
						field : 'marqName',
						width : 270,
						event : 'set1',
						title : '稿件名称'
					}
					, {
						field : 'opacity',
						width : 140,
						event : 'set2',
						title : '透明度'
					}
					, {
						field : 'terminalName',
						width : 140,
						event : 'set3',
						title : '终端'
					}
					, {
						fixed : 'right',
						width : 110,
						event : 'set4',
						title : '操作',
						align : 'center',
						toolbar : '#barDemo'
					}
				] ],
				page : false,
				where : {
					"mid" : mid
				},
				done : function(res, curr, count) {
					//document.getElementById("table1").remove();
					if (res.fail == 1) {
						layer.msg(res.msg, {
							icon : 5,
							time : 2000
						});
					} else if (res.fail == 0) {
						document.getElementById("ptableNameTwo").innerHTML = '<font  size="4"  color="red"> 当前LOGO/图片叠加名：' + res.msg + '</font>';
					}
					var vList = []; // 初始化播放列表 var
					var ms = [];
					var tdata = res.data;
					
					for (var i = 0; i < tdata.length; i++) {
						var filePath = tdata[i].filePath;
						var name = filePath.split("/");
						var origanname = name[name.length - 1];
						var path = '<%=request.getContextPath()%>/downloadController/showVedio.do?filename=' + origanname;
						vList.push(path);
						ms.push(tdata[i]);
					}
					var curr = 0; 
					vLen = vList.length; // 播放列表的长度
					show();
					function show(){
						document.getElementById("mName").innerText = "当前播放稿件名:  " + ms[curr].marqName;
						document.getElementById("mResolution").innerText = "分辨率:  " + ms[curr].resolution;
						document.getElementById("mSize").innerText = "大小:  " + ms[curr].size;
						document.getElementById("mPosition").innerText = "位置:"+"x="+ms[curr].positionX+",y="+ms[curr].positionY;
						document.getElementById("mTerminalName").innerText = "所属终端:  " + ms[curr].terminalName;

						var img = document.getElementById("img1");
						img.src=vList[curr];
					}
				}
			});

			table.on('tool(tableEvent)', function(obj) {
				var tmpdata = obj.data;
				var mid = tmpdata.mid;
				var materialId = tmpdata.materialId;
				var filePath = tmpdata.filePath;
				var name = filePath.split("/");
				var realname = name[name.length - 1];
				console.log(realname);
				document.getElementById("videoView").value = realname;
				if (obj.event === 'mediaView') {
					$.ajax({
						type : "POST",
						url : '<%=request.getContextPath()%>/material/viMaterial.do',
						data : {
							"mid" : materialId
						},
						dataType : "json",
						success : function(msg) {
							var value = msg.toString();
							if (value == "true") {
								console.log(msg);
								window.open('<%=request.getContextPath()%>/file/videoView.jsp', "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
							}
						}
					});
				}
			});
		});
	}

	function goBack() {
		document.location = "<%=request.getContextPath()%>/ptable/MqrqueeCheckFirstList.do";
	}

	function marqueeUnaccess() {
		//var ppid = document.getElementById("modifyPid").value;
		var r = document.getElementsByName("unAccessFlag");
		var checkArray = [];
		for (var i = 0; i < r.length; i++) {
			if (r[i].checked) {
				checkArray.push(r[i].value);
			}
		}
		if (checkArray.length == 0) {
			layer.msg('请选择不通过理由!', {
				icon : 5,
				time : 1500
			});
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/ptable/marqueeUnAccess.do",
			data : {
				"mid" : mid,
				"checkArray" : checkArray
			},
			traditional : true,
			dataType : "json",
			success : function(msg) {
				var value = msg.toString();
				if (value == "true") {
					layer.msg('保存成功!', {
						icon : 6,
						time : 1500
					});
					document.location = "<%=request.getContextPath()%>/ptable/MqrqueeCheckFirstList.do";
				} else {
					layer.msg('审核保存失败!', {
						icon : 5,
						time : 1500
					});
				}
			}
		});
	}

	function MarqueeAccess() {
		var r = document.getElementsByName("unAccessFlag");
		var checkArray = [];
		for (var i = 0; i < r.length; i++) {
			if (r[i].checked) {
				checkArray.push(r[i].value);
			}
		}
		if (checkArray.length > 0) {
			layer.msg('审核通过, 不应该提交不通过理由!', {
				icon : 5,
				time : 1500
			});
			return;
		}

		console.log("LOGO/图片叠加中的mid："+mid);
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/ptable/modifyMarqueeNum.do",
			data : {
				"mid" : mid,
			},
			traditional : true,
			dataType : "json",
			success : function(msg) {
				var value = msg.toString();
				if (value == "true") {
					layer.msg('审核保存成功!', {
						icon : 6,
						time : 1500
					});
					document.location = "<%=request.getContextPath()%>/ptable/MqrqueeCheckFirstList.do";
				} else {
					layer.msg('审核保存失败!', {
						icon : 5,
						time : 1500
					});
				}
			}
		});
	}
</script>
<script>
	function exportImage(){
		document.getElementsByClassName("layui-table-tool")[0].style.display="none";
		html2canvas(document.querySelector("#playTableMaterialsDiv")).then(canvas => {
			document.getElementById("showScreenShot").innerHTML = "";
			document.getElementById("showScreenShot").appendChild(canvas);
		});

	layer.open({
   		type : 1,
   		title : "播表详情-右键可复制或保存截图",
   		area : [ '70%', '80%' ],
   		content : $("#showScreenShot"), //注意，如果str是object，那么需要字符拼接
   		cancel : function () {
   			document.getElementsByClassName("layui-table-tool")[0].style.display="block";
   			//document.getElementsByClassName("layui-table-tool")[0].removeAttribute("style");
   		}
   	});
	} 
</script>
<body>
	<input type="hidden" id="videoView" value="">
	<div class="layui-fluid">
		<div class="layui-row layui-col-space10">
			<div align="center">
				<blockquote class="layui-elem-quote">LOGO/图片叠加初审页</blockquote>
			</div>

			<div class="layui-col-md4">
				<fieldset class="layui-elem-field">
					<legend>
						<i class="layui-icon">&#xe6ed;</i>稿件预览
					</legend>
					<div class="layui-field-box">
						<div class="layui-row layui-col-space10">
							<div class="layui-col-md12">
								<div align="center">
									<img width="300" src="" height="" id="img1" class="indexBanner"/>
								</div>
							</div>
							<div>
								<label id="mName"></label> <br>
								<br> <label id="mResolution"></label>
								&nbsp;&nbsp;&nbsp;&nbsp;<label id="mSize"></label>
								&nbsp;&nbsp;&nbsp;&nbsp;<label id="mPosition"></label> <br>
								<br> <label id="mTerminalName"></label>
							</div>
						</div>
					</div>
				</fieldset>
			</div>

			<div class="layui-col-md8">
				<fieldset id="menu_func_div" class="layui-elem-field">
					<legend>
						<i class="layui-icon">&#xe6ed;</i>LOGO/图片叠加稿件列表
					</legend>
					<div class="layui-field-box" >
						<div class="layui-col-md12 layui-col-space1" id="playTableMaterialsDiv">
							<label class="layui-form-mid" id="ptableNameTwo"> </label>
							<table class="layui-table" id="table1" lay-filter="tableEvent"></table>
							<script type="text/html" id="toolbarDemo">
  								<div class="layui-btn-container">
    								<button class="layui-btn layui-btn-sm" onclick="exportImage()"><i class="layui-icon">&#xe65d;</i> 截图</button>
								</div>
							</script>
							<script type="text/html" id="barDemo">
  						 		<a id="del" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="mediaView">预览</a>
							</script>
							<br>
						</div>
						<div class="layui-col-md12 layui-col-space1">
							<form class="layui-form" id="query_form">
								<div class="layui-form-item">
									<div class="layui-inline">
										<label class="layui-form-mid layui-bg-green">审核不通过理由：</label>
										<div class="layui-input-inline"
											style="width: 150px; height: 35px;">
											<input type="checkbox" name="unAccessFlag" title="稿件有误"
												value="1">
										</div>
									</div>
								</div>
							</form>
							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" type="button"
										onclick="MarqueeAccess()">
										<i class="layui-icon">&#xe605;</i>审核通过
									</button>
								</div>
								<div class="layui-inline">
									<button class="layui-btn layui-btn-danger" type="button"
										onclick="marqueeUnaccess()">
										<i class="layui-icon">&#x1006;</i>审核不通过
									</button>
								</div>
								<div class="layui-inline">
									<button class="layui-btn" type="button" onclick="goBack()">
										<i class="layui-icon">&#xe65c;</i>返回
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
							</div>
							<br>

						</div>
					</div>
					<br>
				</fieldset>
			</div>
		</div>
	</div>
</body>
<div id="showScreenShot" style="display: none;"></div>
</html>