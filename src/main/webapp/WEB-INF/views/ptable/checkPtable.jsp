<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/layui/header.jsp"%>
<title>播表初审</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/st/Sortable.js"></script> --%>
<script type="text/javascript" defer="defer">
	var pid = '${pid}';
	var Pids = '${pids}';
	var pids = Pids.split(',');

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
						type : 'numbers'
					}
					, {
						field : 'materialName',
						width : 270,
						event : 'set1',
						title : '素材名称',
						sort : true
					}
					, {
						field : 'frequency',
						width : 140,
						event : 'set2',
						title : '频次',
						sort : true
					}
					, {
						field : 'duration',
						width : 140,
						event : 'set3',
						title : '时长',
						sort : true
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
					"pid" : pid
				},
				done : function(res, curr, count) {
					//document.getElementById("table1").remove();
					if (res.fail == 1) {
						layer.msg(res.msg, {
							icon : 5,
							time : 2000
						});
					} else if (res.fail == 0) {
						document.getElementById("ptableNameTwo").innerHTML = '<font  size="4"  color="red"> 当前播表名：' + res.msg + '</font>';
					}

					var arr = [];

					var myDate = new Date();
					var year = myDate.getFullYear();
					debugger;
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
						document.getElementById("totalMaterial").innerHTML = '<span style="color: #1E9FFF;" onclick="showMaterialsSortByName()">总共有' + arr.length + '条不同素材啊</span>';
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
						document.getElementById("mName").innerText = "当前播放素材名:  " + ms[curr].materialName;
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
		document.location = "<%=request.getContextPath()%>/ptable/ptableCheckFirstList.do";
	}

	function ptableUnaccess() {
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
		if (pids.length == 1 || pids[0] == ""){
			if(pid != undefined && pid != ""){
				pids[0] = pid;
			}
		}
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/ptable/playTableUnAccess.do",
			data : {
				"ppid" : pids,
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
					document.location = "<%=request.getContextPath()%>/ptable/ptableCheckFirstList.do";
				} else {
					layer.msg('审核保存失败!', {
						icon : 5,
						time : 1500
					});
				}
			}
		});
	}

	function ptableAccess() {
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

		var listFile = '';
		console.log("播表中的pid："+pid);
		console.log("播表中的pids："+pids);
  		if (pids.length == 1 || pids[0] == ""){
			if(pid != undefined && pid != ""){
				pids[0] = pid;
			}
		} 
		console.log("播表中的pid："+pid);
		console.log("播表中的pids："+pids);
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/ptable/modifyPlayTableNum.do",
			data : {
				"ppid" : pids,
				"sortNum" : listFile
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
					document.location = "<%=request.getContextPath()%>/ptable/ptableCheckFirstList.do";
				} else {
					layer.msg('审核保存失败!', {
						icon : 5,
						time : 1500
					});
				}
			}
		});
	}

	function updateSort() {
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/ptable/getTableSortNum.do",
			data : {
				"ppid" : pid
			},
			traditional : true,
			dataType : "json",
			success : function(msg) {
				var value = msg.toString();
				if (value == "true") {
					layer.open({
						title : '播表顺序列表',
						type : 2,
						area : [ '48%', '100%' ],
						content : '<%=request.getContextPath()%>/views/ajaxViews/material-sort.jsp',
						success : function(layero, index) {
							var body = layer.getChildFrame('body', index); //建立父子联系
							var iframeWin = window[layero.find('iframe')[0]['name']];
							// console.log(arr); //得到iframe页的body内容
							// console.log(body.find('input'));
							var inputList = body.find('input');
							$(inputList[0]).val(pid);
						}
					});
				} else {
					layer.msg('播表顺序获取失败!', {
						icon : 5,
						time : 1500
					});
				}
			}
		});
	}
	
	function showMaterialsSortByName(){
		var url = '<%=request.getContextPath()%>/ptable/getDistinctMaterialsByPidSortByName.do?pid='+pid;
		$.post(url, {}, function(str){
			
			var obj = JSON.parse(str);
			var contentStr = "";
			contentStr += "<div style='padding: 1% 5%;'><table class='layui-table'>";
			for(var i =0; i<obj.length;i++){
				contentStr += "<tr>";
				contentStr += "<td>"+obj[i].num+"</td>";
				contentStr += "<td>"+obj[i].name+"</td>";
				contentStr += "<td>"+obj[i].frequncy+"</td>";
				contentStr += "<td>"+obj[i].duration+"</td>";
				contentStr += "</tr>";
			}
			contentStr += "</table></div>";
			//console.log(str.length);
			layer.open({
		   		type: 1,
		   		title: "素材列表",
		   		area : [ '50%', '80%' ],
		   		content: contentStr //注意，如果str是object，那么需要字符拼接。
			});
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
	
/* 	html2canvas(document.querySelector("#playTableMaterialsDiv"), {
		
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

	/*  
	//1.将div转成svg
    var divContent = document.getElementById("playTableMaterialsDiv").innerHTML;
    var data = "data:image/svg+xml," +
    "<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'>" +
    "<foreignObject width='100%' height='100%'>" +
    "<div xmlns='http://www.w3.org/1999/xhtml' style='font-size:16px;font-family:Helvetica'>" +
    divContent +
    "</div>" +
    "</foreignObject>" +
    "</svg>";
    var img = new Image();
    img.src = data;
    document.getElementsByTagName('body')[0].appendChild(img);
 
    //2.svg转成canvas
    var canvas = document.createElement('canvas');  //准备空画布
    canvas.width = img.width;
    canvas.height = img.height;
 
    var context = canvas.getContext('2d');  //取得画布的2d绘图上下文
    context.drawImage(img, 0, 0);
 
    //var a = document.createElement('a');
    //a.href = canvas.toDataURL('image/png');  //将画布内的信息导出为png图片数据
    //a.download = "MapByMathArtSys";  //设定下载名称
    //a.click(); //点击触发下载
 
    //3. 图片导出为 png 格式
    var type = 'png';
    var imgData = canvas.toDataURL(type);
 
        /**
     * 获取mimeType
     * @param  {String} type the old mime-type
     * @return the new mime-type
     */ /*
    var _fixType = function (type) {
        type = type.toLowerCase().replace(/jpg/i, 'jpeg');
        var r = type.match(/png|jpeg|bmp|gif/)[0];
        return 'image/' + r;
    };
 
    // 加工image data，替换mime type
    imgData = imgData.replace(_fixType(type), 'image/octet-stream');
 
    /**
     * 在本地进行文件保存
     * @param  {String} data     要保存到本地的图片数据
     * @param  {String} filename 文件名
     */ /*
    var saveFile = function (data, filename) {
        var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
        save_link.href = data;
        save_link.download = filename;
 
        var event = document.createEvent('MouseEvents');
        event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
        save_link.dispatchEvent(event);
    };
 
    // 下载后的图片名
    var filename = 'baidufe_' + (new Date()).getTime() + '.' + type;
    // download
    saveFile(imgData, filename); */
	} 
</script>
<body>
	<input type="hidden" id="videoView" value="">
	<div class="layui-fluid">
		<div class="layui-row layui-col-space10">
			<div align="center">
				<blockquote class="layui-elem-quote">播表初审页</blockquote>
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
						<i class="layui-icon">&#xe6ed;</i>播表素材顺序列表
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
											<input type="checkbox" name="unAccessFlag" title="排播有误"
												value="1">
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