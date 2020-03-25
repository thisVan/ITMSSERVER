<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/layui/header.jsp"%>
<title>播表终审</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/lay/modules/layer.js"></script>
<script type="text/javascript" defer="defer">
	var pid = '${pid}';
	var Pids = '${pids}';
	var pids = Pids.split(',');
	var ptdate = '${playTablePlayDate}';
	var startTime = '${startTime}';
	var endTime = '${endTime}';
	var insertFlag = '${insertFlag}'
	var min = '${min}';
	var periodName = '${periodName}'; //时段名

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
				url : '<%=request.getContextPath()%>/ptable/getPtableById.do', //,height: 320
				skin : 'row', //,cellMinWidth: 120
				even : true,
				title: "播表详情",
				toolbar: '#toolbarDemo',
				limits : [ 10, 25, 50, 75, 100 ],
				cols : [ [
					//{field:'id', width:'1%'}
					{
						field : '序号',
						type : 'numbers'
					}
					, {
						field : 'materialName',
						width : 270,
						event : 'set1',
						title : '稿件名称',
						sort : true
					}
					, {
						field : 'frequency',
						width : 140,
						event : 'set2',
						title : '频次'
					}
					, {
						field : 'duration',
						width : 140,
						event : 'set3',
						title : '时长'
					}
					, {
						field : 'min',
						width : 140,
						event : 'set5',
						title : '间隔'
						,templet: function(d){
							if(insertFlag == '0') {
								return " " ;
							}else if (insertFlag == '1'){
								return min;
							}
						}
					}
					,{field:'periodTime',width:260, event: 'set6', title: '时段范围', sort: true
						,templet: function(d){
							if(insertFlag == '0') {
								return d.periodName + " " ;
							}else if (insertFlag == '1'){
								return startTime + "-" + endTime;
							}
						}
					}//选择
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
					"pid" : pid
				},
				done : function(res, curr, count) {
					if(insertFlag == '0') {
						$("[data-field='min']").css('display','none');
						$("[data-field='periodTime']").css('display','none');
					}

					//document.getElementById("table1").remove();
					if (res.fail == 1) {
						layer.msg(res.msg, {
							icon : 5,
							time : 2000
						});
					} else if (res.fail == 0) {
						document.getElementById("ptableNameThree").innerHTML = '<font  size="4"  color="red"> 当前播表名：' + res.msg + '</font>' + '<br>播放日期： ' + ptdate;
					}

					var arr = [];

					var myDate = new Date();
					var year = myDate.getFullYear();
					var vList = []; // 初始化播放列表 var
					var ms = [];
					var tdata = res.data;
					for (var i = 0, l = tdata.length; i < l; i++) {
						for (var j = i + 1; j < l; j++)
							if (tdata[i].material.mid === tdata[j].material.mid)
								j = ++i;
						arr.push(tdata[i].material.mid);
					}
					if (arr.length != 0) {
						document.getElementById("totalMaterial").innerHTML = '<span style="color: #1E9FFF;">总共有' + arr.length + '条不同稿件</span>';
					//document.getElementById("totalMaterial").innerText = "" +  + "";
					}

					for (var i = 0; i < tdata.length; i++) {
						var filePath = tdata[i].material.filePath;
						var name = filePath.split("/");
						var origanname = name[name.length - 1];
						// var path = "<%=request.getContextPath()%>/media/" + year + "/" + realname;
						var realname = origanname.substr(0, origanname.lastIndexOf(".") + 1) + 'mp4';
						var path = '<%=request.getContextPath()%>/downloadController/showVedio.do?filename=' + realname;
						vList.push(path);
						ms.push(tdata[i].material);
					}

					var curr = 0; // 当前播放的视频 
					var video = document.getElementById("video1");
					video.addEventListener('ended', play);
					vLen = vList.length; // 播放列表的长度
					play();
					function play() {
						document.getElementById("mName").innerText = "当前播放稿件名:  " + ms[curr].materialName;
						document.getElementById("mResolution").innerText = "分辨率:  " + ms[curr].resolution;
						document.getElementById("mSize").innerText = "大小:  " + ms[curr].size;
						document.getElementById("mDuration").innerText = "时长:  " + ms[curr].duration;
						document.getElementById("mTerminalName").innerText = "所属终端:  " + ms[curr].terminal.terminalName;

						var video = document.getElementById("video1");
						video.src = vList[curr];
						video.load(); //如果短的话，可以加载完成之后再播放，监听 canplaythrough 事件即可
						video.play();
						curr++;
						if (curr >= vLen)
							curr = 0; // 播放完了，重新播放
					}
				//console.log(res.msg);
				}
			});

			table.on('tool(tableEvent)', function(obj) {
				var tmpdata = obj.data;
				var mid = tmpdata.material.mid;
				var filePath = tmpdata.material.filePath;
				var name = filePath.split("/");
				var realname = name[name.length - 1];
				console.log(realname);
				document.getElementById("videoView").value = realname;
				if (obj.event === 'mediaView') {
					$.ajax({
						type : "POST",
						url : '<%=request.getContextPath()%>/material/viMaterial.do',
						data : {
							"mid" : mid
						},
						dataType : "json",
						success : function(msg) {
							var value = msg.toString();
							if (value == "true") {
								console.log(6666);
								window.open('<%=request.getContextPath()%>/file/videoView.jsp', "_blank", "toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
							}
						}
					});
				}
			});
		});
	}

	function goBack() {
		document.location = "<%=request.getContextPath()%>/ptable/ptableCheckSecondList.do";
	}

	function ptableUnaccess() {

		var unAccessReason = '';

		var mark = $("#mark").val();
		if (pids.length == 1 || pids[0] == ""){
			if(pid != undefined && pid != ""){
				pids[0] = pid;
			}
		}

		<%--if (pids.length == 1){--%>
		<%--	layer.prompt({--%>
		<%--		formType: 2,--%>
		<%--		value: '',--%>
		<%--		title: '请输入不通过理由，200字以内',--%>
		<%--		area: ['800px', '350px'] //自定义文本域宽高--%>
		<%--	}, function(value, index, elem){--%>
		<%--		unAccessReason = value;--%>

		<%--		$.ajax({--%>
		<%--			type : "POST",--%>
		<%--			url : '<%=request.getContextPath()%>/ptable/updateUnAccessReason.do',--%>
		<%--			data : {--%>
		<%--				"pid" : pid,--%>
		<%--				"reason" : unAccessReason--%>
		<%--			},--%>
		<%--			dataType : "json",--%>
		<%--			success : function(msg) {--%>
		<%--				var value = msg.toString();--%>
		<%--				if (value == 'true') {--%>
		<%--					alert("成功提交");--%>
		<%--					opener.location.reload();--%>
		<%--					window.close();--%>
		<%--				}--%>
		<%--			}--%>
		<%--		});--%>

		<%--		layer.close(index);--%>
		<%--	});--%>
		<%--}--%>

		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/ptable/modifyPlayTableFinalNumUn.do",
			traditional : true,
			data : {
				"ppid" : pids,
				"mark" : mark
			},
			dataType : "json",
			success : function(msg) {
				var value = msg.toString();
				if (value == "true") {
					//initGrid();
					//doCheckSearch();
					layer.msg('审核保存成功!', {
						icon : 6,
						time : 1500
					});
					document.location = "<%=request.getContextPath()%>/ptable/ptableCheckSecondList.do";
				} else {
					layer.msg('审核保存失败!', {
						icon : 5,
						time : 1500
					});
				}
			}
		});
		//alert(mark);

	}

	// 播表二级审核通过
	// modify by bobo 2020/3/21
	// 添加播表组机制，一起审核

	function ptableAccess() {
		var noValue = "";
		//审核通过后台代码要求的值pids为数组，修改此处代码，如果非批量审核方式，pids为[""]，此时重新赋值为pids[pid]
		if (pids.length == 1 || pids[0] == ""){
			if(pid != undefined && pid != ""){
				pids[0] =  pid;
			}
		}

		//ptableGroupAccess();
		// 当审核的只有一个播表时才进入这个机制
		if (pids.length != 1){
			return;
		}


		let doGroupAccess = false;
		let groupId = 0;
		let groupMembers = [];

		// 查播表组数据，填充groupId 和 groupMembers
		$.ajax({
			type : "POST",
			async: false,
			url : "<%=request.getContextPath()%>/ptable/getPtableGroupAndMembers.do",
			data : {
				"pid" : pids[0],
				"checkKind" : 2,
			},
			traditional : true,
			dataType : "json",
			success : function(msg) {
				groupMembers = msg;
				console.log(groupMembers);
				//layer.msg(groupMembers[0].pid);

				let content = '<br>以下为一次排播的多天播表： </br>';
				for (let member in groupMembers){
					content += ('<br>播表名: ' + groupMembers[member].ptableName + ',播放日期：' + timestampToTime(groupMembers[member].playDate) + '</br>');
				}
				content += "<br><strong>是否合并审核?</strong></br>";

				if (groupMembers.length == 1){
					$.ajax({
						type : "POST",
						async : false,
						url : "<%=request.getContextPath()%>/ptable/modifyPlayTableFinalNum.do",
						data : {
							"ppid" : pids,
							"sortNum" : noValue
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
								document.location = "<%=request.getContextPath()%>/ptable/ptableCheckSecondList.do";
							} else {
								layer.msg('审核保存失败!', {
									icon : 5,
									time : 1500
								});
							}
						}
					});
					return;
				}


				layer.confirm(content, {
					btn: ['是','否'], //按钮
					area:['500px','600px']
				}, function(){

					// 是
					doGroupAccess = true;
					let accessIds= [];
					for (let member in groupMembers){
						accessIds.push(groupMembers[member].pid);
					}

					$.ajax({
						type : "POST",
						async : false,
						url : "<%=request.getContextPath()%>/ptable/modifyPlayTableFinalNum.do",
						data : {
							"ppid" : accessIds,
							"sortNum" : noValue
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
								document.location = "<%=request.getContextPath()%>/ptable/ptableCheckSecondList.do";
							} else {
								layer.msg('审核保存失败!', {
									icon : 5,
									time : 1500
								});
							}
						}
					});


				}, function(){

					// 否
					doGroupAccess = false;

					$.ajax({
						type : "POST",
						async : false,
						url : "<%=request.getContextPath()%>/ptable/modifyPlayTableFinalNum.do",
						data : {
							"ppid" : pids,
							"sortNum" : noValue
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
								document.location = "<%=request.getContextPath()%>/ptable/ptableCheckSecondList.do";
							} else {
								layer.msg('审核保存失败!', {
									icon : 5,
									time : 1500
								});
							}
						}
					});

				});


			}

		});
	}

	function timestampToTime(timestamp) {
		var date = new Date(timestamp);
		var Y = date.getFullYear() + '-';
		var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
		var D = (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
		var h = (date.getHours() < 10 ? '0'+date.getHours() : date.getHours()) + ':';
		var m = (date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes()) + ':';
		var s = (date.getSeconds() < 10 ? '0'+date.getSeconds() : date.getSeconds());
		return Y+M+D;
	}

	function testbuttonmsg() {
		layer.msg(pid + ',' + periodName + ',' + periodID + ',' + ptdate + ',' + tid, {
			icon : 5,
			time : 1500
		});
	}
	
	function exportImage(){
		document.getElementsByClassName("layui-table-tool")[0].style.display="none";
		html2canvas(document.querySelector("#playTableMaterialsDiv")).then(canvas => {
			document.getElementById("showScreenShot").innerHTML = "";
			document.getElementById("showScreenShot").appendChild(canvas);
		});
	
		/* 	
		html2canvas(document.querySelector("#playTableMaterialsDiv"), {
	        onrendered: function(canvas) {
	            //document.getElementById("showScreenShot").innerHTML = "";
	    		document.getElementById("showScreenShot").appendChild(canvas);
	        },
	        // height: 300
	        ignoreElements: function() {
	        	document.querySelector(".ayui-table-tool-temp") => false
	        } 
	    });*/

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
				<blockquote class="layui-elem-quote">播表终审页</blockquote>
			</div>

			<div class="layui-col-md4">
				<fieldset class="layui-elem-field">
					<legend>
						<i class="layui-icon">&#xe6ed;</i>播放预览
					</legend>
					<div class="layui-field-box">
						<div class="layui-row layui-col-space10">
							<div class="layui-col-md12">
								<div align="center">
									<video width="300" height="250" id="video1" class="indexBanner"
										controls="controls" autoplay>
										<source src="" type="video/mp4" />
									</video>
								</div>
							</div>
							<div>
								<label id="mName"></label> <br>
								<br> <label id="mResolution"></label>
								&nbsp;&nbsp;&nbsp;&nbsp;<label id="mSize"></label>
								&nbsp;&nbsp;&nbsp;&nbsp;<label id="mDuration"></label> <br>
								<br> <label id="mTerminalName"></label>
							</div>
						</div>

					</div>
				</fieldset>
			</div>

			<div class="layui-col-md8">
				<fieldset id="menu_func_div" class="layui-elem-field">
					<legend>
						<i class="layui-icon">&#xe6ed;</i>播表稿件顺序列表
					</legend>
					<div class="layui-field-box">
						<div class="layui-col-md12 layui-col-space1" id="playTableMaterialsDiv">
							<label class="layui-form-mid" id="ptableNameThree"> </label>
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
										<label class="layui-form-mid ">备注：</label>
										<div class="layui-input-inline"
											style="width: 400px; height: 35px;">
											<input id="mark" placeholder="审核理由" style="width: 350px; height: 35px;" class="layui-input input-text" />
										</div>
									</div>
								</div>
							</form>
							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" type="button"
										onclick="ptableAccess()">
										<i class="layui-icon">&#xe605;</i>审核通过
									</button>
								</div>
								<div class="layui-inline">
									<button class="layui-btn layui-btn-danger" type="button"
										onclick="ptableUnaccess()">
										<i class="layui-icon">&#x1006;</i>审核不通过
									</button>
								</div>
								<div class="layui-inline">
									<button class="layui-btn" type="button" onclick="goBack()">
										<i class="layui-icon">&#xe65c;</i>返回
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label id="totalMaterial"></label>
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