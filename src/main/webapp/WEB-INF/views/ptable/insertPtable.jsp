<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/layui/header.jsp"%>
	<title>插播管理列表</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/layui/lay/modules/layer.js"></script>
	<script type="text/javascript">
		layui.use('layer', function() {
			var layer = layui.layer;
		});
		layui.use('form', function() {
			var form = layui.form;
			form.on('select(test)', function(data) {
				//console.log(data);
				initUncheck();
			});

			form.on('radio(infoValue)', function(data) {
				if (data.value == "时间") {
					document.getElementById("pinci").style.display = "none"; //隐藏
					document.getElementById("shijian").style.display = ""; //显示
				} else if (data.value == "频次") {
					document.getElementById("pinci").style.display = ""; //显示
					document.getElementById("shijian").style.display = "none"; //隐藏
				}

				checkTip(); //前台提示该插播安排是否有溢出
			});

		});
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			laydate.render({
				elem : '#dateTime', //指定元素
				range : true,
				format: 'yyyy-MM-dd'
			});
			laydate.render({
				elem : '#testDate', //指定元素
				type : 'time',
				range : true
			});
		});
	</script>
	<script type="text/javascript" defer="defer">
		$(function(){
			init();
			document.getElementById("pinci").style.display="none";//隐藏

			initDateTime();
		});

		function init(){
			layui.use('layer', function(){
				var layer = layui.layer;
			});
			initUncheck();
		}

		function initUncheck(){
			layui.use('layer', function(){
				var layer = layui.layer;
			});

			//终端
			var terminalId = $("#terminal").val();

			layui.use('table', function(){
				var table = layui.table;
				table.render({
					elem: '#table1'
					,id: 'flagOne'
					,url:'<%=request.getContextPath()%>/ptable/fildIPtable.do'
					//,height: 265
					//,cellMinWidth: 120
					,height:'full-50'
					,limits:[10,25,50,75,100]
					,skin:"nob"
					,cols: [[
						//{field:'id', width:'1%'}
						{checkbox: true, event: 'set1', fixed: true},
						{field:'ptableName',width:280, event: 'set1', title: '插播名称', fixed: true, sort: true}
						,{field:'playDate',width:120, event: 'set2', title: '插播日期', sort: true
							,templet: function(d){
								var date = new Date(d.playDate);
								var Y = date.getFullYear() + '-';
								var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
								var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
								return Y+M+D;
							}
						}
						,{field:'periodTime',width:160, event: 'set3', title: '时段范围', sort: true
							,templet: function(d){
								if(d.startTime != null && d.endTime != null){
									var periodName = d.startTime;
									var periodTime = d.endTime;
									return periodName + "-" + periodTime;
								}else{
									return "";
								}
							}
						}
						,{field:'insertFlag',width:110, event: 'set4', title: '播表类型', sort: true
							,templet: function(d){
								var flag = d.insertFlag;
								if(flag == '0'){
									return '<span style="color: #90EE90;">周期轮播</span>';
								}else if(flag == '1'){
									return '<span style="color: #FF6347;">插播</span>';
								}
							}
						}
						,{field:'min',width:95, event: 'set5', title: '间隔', sort: true}
						,{field:'duraTime',width:120, event: 'set6', title: '视频总时间', sort: true}
						,{field:'frequency',width:95, event: 'set7', title: '频次',sort:true
							,templet: function(d){
								var start = '2017/12/14 ' + d.startTime;
								var end = '2017/12/14 ' + d.endTime;
								var d1 = new Date(start);
								var d2 = new Date(end);
								var fre = parseInt((d2-d1)/1000);
								var fre1 = parseInt(fre/(d.min + d.duraTime));
								return fre1;
							}
						},{field:'state',width:110, event: 'set6', title: '插播时态', sort: true
							,templet: function(d){
								var state = d.state;
								if(state == 1){
									return '<span style="color: #FF5722">' + '紧急插播' + '</span>';
								}else if(state == 2){
									return '<span style="color: #5FB878">' + '插播' + '</span>';
								}
							}
						}
						,{field:'statusId',width:100, event: 'set5', title: '审核状态', sort: true
							,templet: function(d){
								var state = d.statusId;
								if(state == 1){
									return '<span style="color: #FF6347;">' + '未审核' + '</span>';
								}else if(state == 2){
									return '<span style="color: #90EE90;">' + '已初审' + '</span>';
								}else if(state == 3){
									return '<span style="color: #90EE90;">' + '已通过' + '</span>';
								}else if(state == 4){
									return '<span style="color: #FF6347;">' + '未通过' + '</span>';
								}else if(state == 5){
									return '<span style="color: #FF6347;">' + '未通过(排播有误)' + '</span>';
								}else if(state == 6){
									return '<span style="color: #FF6347;">' + '未通过(稿件敏感)' + '</span>';
								}else if(state == 7){
									return '<span style="color: #FF6347;">' + '未通过(排播有误、稿件敏感)' + '</span>';
								}
							}
						}
						,{field:'terminalName',width:140, event: 'set9', title: '终端名', sort: true
							,templet:function(d){
								return '<span style="color: #1E9FFF;">' + d.terminalName + '</span>';
							}
						}
						,{fixed: 'right', width:200, event: 'set10', title: '操作', align:'center', toolbar: '#barDemo2'}
						//,{fixed: 'right', width:150, event: 'set7', title: '操作', align:'center', toolbar: '#barDemo'}
					]]
					,page: true
					,where: {"terminalId":terminalId, "field":"playDate", "order":"desc"}
					,done: function(res, curr, count){
						//document.getElementById("table1").remove();
						if(res.fail == 1){
							layer.msg(res.msg,{icon:5,time:2000});
						}
						//console.log(res.msg);
					}
				});

				var active = {
					getDeleteData: function () { //获取选中数据
						var checkStatus = table.checkStatus('flagOne')
								, data = checkStatus.data;
						var insertPtableIds = [];
						for (var i = 0; i < data.length; i++) {
							insertPtableIds.push(data[i].pid);
						}

						if (insertPtableIds.length == 0) {
							layui.use('layer', function() {
								var layer = layui.layer;
								layer.msg('请选择要删除的数据!', {icon: 6, time: 1500});
								return;
							});
						}
						else{

							layui.use('layer', function() {
								var layer = layui.layer;
								layer.confirm('是否删除以下插播？', {
									btn: ['确认','取消'] //按钮
								}, function(){
									<%--$.ajax({--%>
									<%--	type: "POST",--%>
									<%--	url: "<%=request.getContextPath()%>/ptable/delPtable.do",--%>
									<%--	data: {"ids": insertPtableIds},--%>
									<%--	traditional: true,--%>
									<%--	dataType: "json",--%>
									<%--	success: function (data) {--%>
									<%--		if (data.success) {--%>
									<%--			refresh();--%>
									<%--			layer.msg('删除成功!', {icon: 6, time: 2000});--%>
									<%--		} else {--%>
									<%--			layer.msg(data.msg, {icon: 5, time: 2000});--%>
									<%--		}--%>
									<%--	}--%>
									<%--});--%>
									layer.msg('已删除', {icon: 1});
								}, function(){
									//refresh();
								});
							});


						}
					}
				};

				$('.operatorTable').on('click', function () {
					var othis = $(this);
					var dothing = othis.attr("function");
					if (dothing == "getDeleteData") {
						//console.log(dothing);
						//active.getDeleteData();
						var checkStatus = table.checkStatus('flagOne')
								, data = checkStatus.data;
						var insertPtableIds = [];
						var insertPtableNameList = [];
						for (var i = 0; i < data.length; i++) {
							insertPtableIds.push(data[i].pid);
							insertPtableNameList.push(data[i].ptableName);
						}

						if (insertPtableIds.length == 0) {
							layer.msg('请选择要删除的数据!', {icon: 6, time: 1500});
						}
						else{
							//alert(insertPtableNameList);
							layui.use('layer', function() {
								var layer = layui.layer;
								let content = '<br>是否删除以下插播： </br>';
								for (var i = 0 ; i < insertPtableNameList.length; i++){
									content += '<br>插播播表名: ' + insertPtableNameList[i] + '</br>';
								}
								content += "<br><strong>确认批量删除吗?</strong></br>";
								layer.confirm(content, {
									btn: ['确认','取消'] //按钮
								}, function(){
									$.ajax({
										type: "POST",
										url: "<%=request.getContextPath()%>/ptable/delPtable.do",
										data: {"ids": insertPtableIds},
										traditional: true,
										dataType: "json",
										success: function (data) {
											if (data.success) {
												init();
												layer.msg('删除成功!', {icon: 6, time: 2000});
											} else {
												layer.msg(data.msg, {icon: 5, time: 2000});
											}
										}
									});
									//layer.msg('已删除', {icon: 1});
									//init();
								}, function(){
								});
							});


						}
					}
				});

				table.on('sort(tableEvent)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					table.reload('flagOne', { //testTable是表格容器id
						initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
						,where: {
							field: obj.field //排序字段
							,order: obj.type //排序方式
						}
					});
				});


				table.on('tool(tableEvent)', function(obj){
					var tmpdata = obj.data;
					var pid = tmpdata.pid;
					//console.log(obj);
					if(obj.event === 'ptableDel'){
						//批量删除
						layer.confirm('确定删除该插播记录?', function(index){
							var pids = [];
							pids.push(pid);
							layer.close(index);

							$.ajax({
								type: "POST",
								url: "<%=request.getContextPath()%>/ptable/delPtable.do",
								data: {"ids":pids},
								traditional: true,
								dataType : "json",
								success : function(data){
									if(data.success) {
										initUncheck();
										layer.msg('删除成功!',{icon:6,time:2000});
									} else {
										layer.msg(data.msg, {icon:5,time:2000});
									}
								}
							});
						});
					}
					if(obj.event === 'mediaInfo'){
						var pid = tmpdata.pid;
						var periodName=tmpdata.periodName+" ";
						var tid=tmpdata.tid;
						//console.log('<%=request.getContextPath()%>/ptable/goModifyPtable/' + pid + '/' + periodName + '/' + tid + '.do');
						document.location = '<%=request.getContextPath()%>/ptable/goModifyPtable/' + pid + '/' + periodName + '/' + tid + '.do';
					}
				});
			});
		}

		function myFunction(){
			var durTime = document.getElementById("intervalTime").value;
			if(parseInt(durTime) != durTime){
				layer.msg("时间间隔不是整数",{icon:5,time:2000});
				document.getElementById("frequ").innerText = "";
				return ;
			}
			if(isNaN(durTime)){
				layer.msg("时间间隔不是整数",{icon:5,time:2000});
				document.getElementById("frequ").innerText = "";
				return ;
			}else{
				var tim = document.getElementById("testDate").value;
				if(tim == ""){
					document.getElementById("frequ").innerText = "";
				}else{
					var dat = tim.split("-");
					var start = '2017/12/14 ' + dat[0];
					var end = '2017/12/14 ' + dat[1];
					var d1 = new Date(start);
					var d2 = new Date(end);
					var fre = parseInt(d2 - d1)/1000;
					var fre1 = parseInt(fre/durTime);
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "约" + fre1 + "次";
				}
			}
		}

		function myCiFunction(){
			var durTime = document.getElementById("insertCi").value;
			if(parseInt(durTime) != durTime){
				layer.msg("时间间隔不是整数",{icon:5,time:2000});
				document.getElementById("frequ").innerText = "";
				return ;
			}
			if(isNaN(durTime)){
				layer.msg("频次不是整数",{icon:5,time:2000});
				document.getElementById("frequ").innerText = "";
				return ;
			}else{
				var tim = document.getElementById("testDate").value;
				if(tim == ""){
					document.getElementById("frequ").innerText = "";
				}else{
					var dat = tim.split("-");
					var start = '2017/12/14 ' + dat[0];
					var end = '2017/12/14 ' + dat[1];
					var d1 = new Date(start);
					var d2 = new Date(end);
					var fre = parseInt(d2 - d1)/1000;
					var fre1 = parseInt(fre/durTime);
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "约" + fre1 + "秒";
				}
			}
		}

		var midArr = [];
		var len = 0;

		function addFileMaterial(){
			var odiv=document.getElementById("thediv");

			document.getElementById("checkTwice").value = '';
			layer.open({
				title:'添加稿件',
				type:2,
				area:['80%','100%'],
				content:'<%=request.getContextPath()%>/material/addMaterialInfo2.do?terminalId=' + $("#terminal").val(),
				end: function(index){
					var data = $("#checkData").val();
					var checkdata = $('#checkTwice').val();
					var mids = $("#midData").val();
					if(checkdata == ''){
						console.log('no check!!!');
					}else{
						if(data == ''){
							console.log(666);
						}else{
							var str = data.split("=");
							//for(var i = 0; i < str.length; i++){
							//	console.log(str[i]);
							//}
							var num = (str.length - 1)/4;
							//console.log(num);
							//console.log(len);

							for(var i = len; i < (len + num); i++){

								var trObj = document.createElement("tr");
								trObj.id = "insertM" + i;
								if ($("#ptableName").val() == "") {
									$("#ptableName").val("插播-" + str[(i-len)*4]);
								}
								var tdStr = "<td>" + str[(i-len)*4] + "</td>"
										+ "<td>" + str[(i-len)*4 + 1] + "</td>"
										+ "<td>" + str[(i-len)*4 + 2] + "</td>"
										+ "<td>" + str[(i-len)*4 + 3] + "</td>"
										+ "<td>"
										+ "<input id='toNum" + i + "' value='1' type='text' class='layui-input' oninput='checkTip()' style='width:30px;'>"
										+ "</td>"
										+ "<td><button id='delbtn"+i+"' class='layui-btn layui-btn-mini layui-btn-danger' onclick='delFile(" + i + ")'>删除</button></td>";
								trObj.innerHTML = tdStr;
								document.getElementById("demoList").appendChild(trObj);
							}
							odiv.style.display="block";
							checkTip();  //前台提示该插播安排是否有溢出

						}
					}

					if(mids == ''){

					}else{
						var mi = mids.split(",");
						for(var i = 0; i < mi.length; i++){
							midArr.push(mi[i]);
						}
						len = len + mi.length;
					}

				}
			});
		}

		function delFile(index){
			var deltrObj = document.getElementById("insertM" + index);
			document.getElementById("demoList").removeChild(deltrObj);
			midArr[index] = 0;
			checkTip();  //前台提示该插播安排是否有溢出
		}

		function addInsertPtable(){
			//var method = document.getElementById("method").value;
			//if(method == 'on'){
			if($("#shijian").is(":visible") == true){
				var ptableName = document.getElementById("ptableName").value;//播表名
				var dateTime = document.getElementById("dateTime").value;//插播日期
				var testDate = document.getElementById("testDate").value;//插播时间段
				var stat = document.getElementById("stat").value;
				var terminalId = document.getElementById("terminal").value;
				var intervalTime = document.getElementById("intervalTime").value;
				if(ptableName == ''){
					layer.msg("没有指定播表名，系统将自动生成！",{icon:1,time:2000});
				}
				if(terminalId == ''){
					layer.msg("请选择终端",{icon:5,time:2000});
					return ;
				}
				if(dateTime == ''){
					layer.msg("插播日期不能为空",{icon:5,time:2000});
					return ;
				}
				if(testDate == ''){
					layer.msg("插播时段不能为空",{icon:5,time:2000});
					return ;
				}
				if(intervalTime == ''){
					layer.msg("插播间隔时间不能为空",{icon:5,time:2000});
					return ;
				}

				if(parseInt(intervalTime) != intervalTime){
					layer.msg("时间间隔不是整数",{icon:5,time:2000});
					return ;
				}
				if(isNaN(intervalTime)){
					layer.msg("时间间隔不是整数",{icon:5,time:2000});
					return ;
				}

				var midds = '';
				for(var i = 0; i < midArr.length; i++){
					if(midArr[i] != 0){
						var tonum = document.getElementById("toNum" + i).value;
						midds = midds + midArr[i] + '-' + tonum + ',';
					}
				}
				//console.log(midds);
				if(midds == ''){
					layer.msg("未选择稿件",{icon:5,time:2000});
					return ;
				}

				$.ajax({
					type:"POST",
					url: '<%=request.getContextPath()%>/ptable/addInsertMaterial.do',
					data: {"ptableName":ptableName,"terminalId":terminalId,"mid": midds, "dateTime":dateTime, "testDate":testDate, "stat":stat, "intervalTime":intervalTime},
					dataType : "json",
					success: function(msg){
						var value = msg.toString();
						if(value=="true"){
							layer.msg("保存成功",{icon:6,time:2000});
							//init();
							//document.getElementById("pinci").style.display="none";//隐藏
							document.location = "<%=request.getContextPath()%>/ptable/goAddPtable.do";
						}else if(value == '1'){
							layer.msg("时段前后有误",{icon:5,time:2000});
						}else if(value == 'false'){
							layer.msg("保存失败",{icon:5,time:2000});
						}
					}
				});

			}else{
				var ptableName = document.getElementById("ptableName").value;//播表名
				var dateTime = document.getElementById("dateTime").value;//插播日期
				var testDate = document.getElementById("testDate").value;
				var stat = document.getElementById("stat").value;
				var terminalId = document.getElementById("terminal").value;
				var insertCi = document.getElementById("insertCi").value;
				if(ptableName == ''){
					layer.msg("没有指定播表名，系统将自动生成！",{icon:1,time:2000});
				}
				if(terminalId == ''){
					layer.msg("请选择终端",{icon:5,time:2000});
					return ;
				}
				if(dateTime == ''){
					layer.msg("插播日期不能为空",{icon:5,time:2000});
					return ;
				}
				if(testDate == ''){
					layer.msg("插播时段不能为空",{icon:5,time:2000});
					return ;
				}
				if(insertCi == ''){
					layer.msg("插播次数不能为空",{icon:5,time:2000});
					return ;
				}

				if(parseInt(insertCi) != insertCi){
					layer.msg("次数不是整数",{icon:5,time:2000});
					return ;
				}
				if(isNaN(insertCi)){
					layer.msg("次数不是整数",{icon:5,time:2000});
					return ;
				}

				var dat = testDate.split("-");
				//任意一天，计算插播开始时间和结束时间之间的秒数
				var start = '2017/12/14 ' + dat[0];
				var end = '2017/12/14 ' + dat[1];
				var d1 = new Date(start);
				var d2 = new Date(end);
				var fre = parseInt(d2 - d1)/1000;
				var fre1 = parseInt(fre/insertCi);
				//var intervalTime = fre1;
				//2019.1.3
				var timeDurationStr = document.getElementById("frequ").innerHTML;
				var intervalTime= parseInt(timeDurationStr.replace(/[^0-9]/ig,""));

				var midds = '';
				console.log("midArr=" + midArr);
				for(var i = 0; i < midArr.length; i++){
					if(midArr[i] != 0){
						var tonum = document.getElementById("toNum" + i).value;
						midds = midds + midArr[i] + '-' + tonum + ',';
					}
				}
				//console.log(midds);
				if(midds == ''){
					layer.msg("未选择稿件",{icon:5,time:2000});
					return ;
				}

				$.ajax({
					type:"POST",
					url: '<%=request.getContextPath()%>/ptable/addInsertMaterial.do',
					data: {"ptableName":ptableName,"terminalId":terminalId,"mid": midds, "dateTime":dateTime, "testDate":testDate, "stat":stat, "intervalTime":intervalTime},
					dataType : "json",
					success: function(msg){
						var value = msg.toString();
						if(value=="true"){
							layer.msg("保存成功",{icon:6,time:2000});
							//init();
							//document.getElementById("pinci").style.display="none";//隐藏
							document.location = "<%=request.getContextPath()%>/ptable/goAddPtable.do";
						}else if(value == '1'){
							layer.msg("时段前后有误",{icon:5,time:2000});
						}else if(value == 'false'){
							layer.msg("保存失败",{icon:5,time:2000});
						}
					}
				});
			}
		}

		function checkTip() {
			var reg = /^\d+(?=\.{0,1}\d+$|$)/

			document.getElementById("frequ").innerText = "";

			//校验

			//计算一次插播需要使用的秒数
			var insertSecond = 0;

			$("#demoList tr").each(function() {
				var num = $(this).find('input').val();
				if(!reg.test(num))  {  //不是合法的输入
					insertSecond = -1;
					return false;
				}
				var oneSecond = $(this).children('td').eq(1).text();

				insertSecond = insertSecond + oneSecond * num;
			});

			if(insertSecond == -1) {
				layer.msg("输入的次数必须是正整数",{icon:5,time:1500});
				return;
			}

			if(insertSecond == 0) return;

			//校验插播时段不为空
			var tim = document.getElementById("testDate").value;
			if(tim == ""){
				return;
			}
			var dat = tim.split("-");
			var start = '2017/12/14 ' + dat[0];
			var end = '2017/12/14 ' + dat[1];
			var d1 = new Date(start);
			var d2 = new Date(end);
			var totalSecond = parseInt(d2 - d1)/1000;

			if($("#shijian").is(":visible") == true){  //时段
				var intervalTime = document.getElementById("intervalTime").value;
				if(!reg.test(intervalTime))  {  //不是合法的输入
					//layer.msg("输入的时间间隔必须是正整数",{icon:5,time:1500});
					return;
				}
				intervalTime = parseInt(intervalTime);

				console.log("时间间隔:" + " totalSecond:" + totalSecond + " insertSecond:" + insertSecond + " intervalTime:" + intervalTime);
				if(insertSecond > totalSecond) {
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "溢出";
				} else if(insertSecond == totalSecond) {
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "约1次";
				} else {
					var num = parseInt(totalSecond/(insertSecond + intervalTime));
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "约" + num + "次";
				}

			} else {

				var insertCi = document.getElementById("insertCi").value;
				if(!reg.test(insertCi))  {  //不是合法的输入
					// layer.msg("输入的频次必须是正整数",{icon:5,time:1500});
					return;
				}
				insertCi = parseInt(insertCi);

				var oneInsertSecond = parseInt(totalSecond / insertCi);
				console.log("频次:" + " totalSecond:" + totalSecond + " insertSecond:" + insertSecond + " insertCi:" + insertCi + " oneInsertSecond:" + oneInsertSecond);

				if(insertSecond > oneInsertSecond) {
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "溢出";
				} else {
					var intervalTime = oneInsertSecond - insertSecond;
					document.getElementById('frequ').style.color= "red";
					document.getElementById("frequ").innerText = "时间间隔约" + intervalTime + "秒";
				}

			}

		}

		function initDateTime(){
			var timeStr = new Date().format("yyyy-MM-dd") +" - "+ new Date().format("yyyy-MM-dd");
			$("#dateTime").val(timeStr);
			$("#testDate").val('18:30:00 - 20:00:00');
		}

		Date.prototype.format = function(fmt) { //author: meizz
			var o = {
				"M+" : this.getMonth() + 1, //月份
				"d+" : this.getDate(), //日
				"h+" : this.getHours(), //小时
				"m+" : this.getMinutes(), //分
				"s+" : this.getSeconds(), //秒
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度
				"S" : this.getMilliseconds() //毫秒
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			for (var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			return fmt;
		}

		<%-- 	    function goBack() {
                       document.location = "<%=request.getContextPath()%>/ptable/ptableList.do";
                    } --%>

	</script>

</head>
<body>
<input type="hidden" id="videoView" value="">
<input type="hidden" id="checkData" value="">
<input type="hidden" id="checkTwice" value="">
<input type="hidden" id="midData" value="">
<div class="layui-fluid">
	<div align="center">
		<blockquote class="layui-elem-quote">插播管理页</blockquote>
	</div>
	<div class="layui-row layui-col-space1">
		<div class="layui-col-md12">
			<div class="layui-form-query">
				<form class="layui-form" id="query_form">
					<div class="layui-form-item">

						<div class="layui-inline">
							<label class="layui-form-mid"><i class="layui-icon">&#xe6ed;</i>当前终端：</label>
							<div class="layui-input-inline"
								 style="width: 140px; height: 35px;">
								<select name="terminal" id="terminal" lay-filter="test"
										style="width: 140px; height: 35px;">
									<option value="">直接选择或搜索</option>
									<c:forEach items="${terminals}" var="terminal"
											   varStatus="status">
										<option value="${terminal.terminalId}">${terminal.terminalName}</option>
									</c:forEach>
								</select>
							</div>
							<button class="layui-btn layui-bg-green" type="button"
									onclick="addFileMaterial()">
								<i class="layui-icon">&#xe654;</i>插播
							</button>
							<button class="layui-btn layui-btn-danger operatorTable" type="button" function="getDeleteData" data-type="getDeleteData">
								<i class="layui-icon">&#xe640;</i>批量删除
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="layui-col-md12">

			<div id="thediv" style="display:none">
				<div class="layui-form-query">
					<form class="layui-form" id="insert_form">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-mid">播表名：</label>
								<div class="layui-inline">
									<input type="text" id="ptableName" name="ptableName"
										   style="width: 200px; height: 36px;" class="layui-input" />
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">插播日期：</label>
								<div class="layui-inline" style="">
									<input type="text" id="dateTime" name="dateTime"
										   autocomplete="off" style="width: 200px; height: 36px;"
										   class="layui-input fsDate" dateRange="1" placeholder=" - " />
								</div>
							</div>

							<!-- <div class="layui-form-item">

                       <label class="layui-form-label">投放周期：</label>
                       <div class="layui-input-inline">
                         <input type="text" id="testDate" name="testDate" placeholder="请选择日期" style="width:250px;" class="layui-input input-text" />
                       </div>
                     </div> -->

							<div class="layui-inline">
								<label class="layui-form-mid">插播时段：</label>
								<div class="layui-input-inline"
									 style="width: 160px; height: 36px;">
									<input type="text" id="testDate" name="testDate" autocomplete="off"
										   placeholder="请选择时间" class="layui-input input-text" />
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">插播形式：</label>
								<div class="layui-input-inline"
									 style="width: 110px; height: 36px;">
									<select name="stat" id="stat"
											style="width: 110px; height: 36px;">
										<option value="2">插播</option>
										<option value="1">紧急插播</option>
									</select>
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">插播方式：</label>
								<div class="layui-input-block">
									<input type="radio" name="method" value="时间" title="时间"
										   lay-filter="infoValue" checked> <input type="radio"
																				  name="method" value="频次" title="频次" lay-filter="infoValue">
								</div>
								<!-- <div class="layui-inline" style=""> -->
								<!-- <input type="checkbox" id="method" name="method"
                                        lay-skin="switch" lay-filter="infoValue" lay-text="时间|频次"
                                        checked>
                                </div> -->
							</div>

							<div class="layui-inline" id="shijian">
								<label class="layui-form-mid">时间间隔：</label>
								<div class="layui-input-inline" style="">
									<!-- <input type="text" id="intervalTime" placeholder="秒" oninput='myFunction()' name="intervalTime" autocomplete="off" style="width: 100px; height: 36px;" class="layui-input input-text">-->
									<input type="text" id="intervalTime" placeholder="秒"
										   oninput='checkTip()' name="intervalTime" autocomplete="off"
										   style="width: 100px; height: 36px;"
										   class="layui-input input-text">
								</div>
							</div>

							<div class="layui-inline" id="pinci">
								<label class="layui-form-mid">频次：</label>
								<div class="layui-input-inline" style="">
									<!--  <input type="text" id="insertCi" placeholder="次" oninput='myCiFunction()' name="insertCi" autocomplete="off" style="width: 100px; height: 36px;" class="layui-input input-text"> -->
									<input type="text" id="insertCi" placeholder="次"
										   oninput='checkTip()' name="insertCi" autocomplete="off"
										   style="width: 100px; height: 36px;"
										   class="layui-input input-text">
								</div>
							</div>

							<div class="layui-inline">
								<div class="layui-inline" style="">
									&nbsp;&nbsp;<label id="frequ" style="width:60px;"></label>
								</div>
							</div>

						</div>
					</form>
				</div>

				<table class="layui-table" lay-skin="line">
					<thead>
					<tr>
						<th>稿件名称</th>
						<th>时长(秒)</th>
						<th>大小</th>
						<th>分辨率</th>
						<th>次数</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody id="demoList"></tbody>
				</table>

				<div class="layui-form-query">
					<div align="center">
						<div class="layui-inline">
							<div class="layui-inline">
								<button class="layui-btn layui-bg-green" type="button"
										onclick="addFileMaterial()">
									<i class="layui-icon">&#xe654;</i>添加稿件
								</button>
							</div>
							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn layui-bg-green" type="button"
											onclick="addInsertPtable()">
										<i class="layui-icon">&#xe605;</i>保存
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<table class="layui-table" id="table1" lay-filter="tableEvent"></table>
			<script type="text/html" id="barDemo">
				<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="mediaInfo">
					<i class="layui-icon">&#xe640;</i>删除</a>
			</script>
			<script type="text/html" id="barDemo1">
				<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5" >MD5</a>
			</script>
			<script type="text/html" id="barDemo2">

				<a class="layui-btn layui-btn-sm" lay-event="ptableDel" >删除</a>
				<a class="layui-btn layui-btn-sm" lay-event="mediaInfo">
					<i class="layui-icon">&#xe6ed;</i>详情
				</a>
			</script>
		</div>

	</div>
</div>
</body>
</html>