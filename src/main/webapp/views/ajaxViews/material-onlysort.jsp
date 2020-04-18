<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta content="text/html;charset=UTF-8"/>
	<%@ include file="/layui/header.jsp"%>
   <title>稿件顺序修改列表</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta http-equiv ="Pragma" content = "no-cache"/>
	<meta http-equiv="Cache-Control" content="no cache" />
	<meta http-equiv="Expires" content="0" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="format-detection" content="telephone=no"/>
	<link href="<%=request.getContextPath()%>/st/app.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/st/Sortable.js"></script>
	<style type="text/css">
      li {width:100%; margin-bottom:10px;font: 15px Helvetica Neue,Helvetica,PingFang SC,\5FAE\8F6F\96C5\9ED1,Tahoma,Arial,sans-serif}
    </style>
</head>
<body style="background-color:#FFFFFF;">
	<input type="hidden" id="pid" name="pid"/>
  <label>&nbsp;&nbsp;<font size="4" color="green">播表稿件顺序列表(拖拽)&nbsp;&nbsp;<i class="layui-icon">&#xe6ed;</i>:</font></label>
  <br><br>
  <!-- 
  <div style="width: 20%; float: left">
    <label>&nbsp;&nbsp;&nbsp;&nbsp;序号</label>
    <ul class="block__list block__list_words">
		<c:forEach items="${sessionScope.tableFirst}" var="table" varStatus="status">
			<li>${status.count}</li>
		</c:forEach>
	</ul>
  </div>
   -->
  <div>
	<ul style="padding: 5px 40px; max-width: 360px;">
	  <li>
		  <span style="width: 30%; float: left">序号</span>
		  <span style="width: 70%; float: left">顺序列表</span>
	  </li>
	</ul>
	
	<ul id="foo" class="block__list block__list_words">
		<c:forEach items="${sessionScope.tableFirst}" var="table" varStatus="status">
			<li drag-id="${table.material.mid},${table.itemId}">
				<span  style="width: 30%;float: left;">${status.count}</span>
				<span style="width: 70%; float: left;">${table.materialName}</span>
			</li>
		</c:forEach>
	</ul>
  </div>
  <br><br><br><br>
  <hr class="layui-bg-green"/>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" onclick="saveSort()"><i class="layui-icon">&#xe642;</i>保存</button>
      <button type="button" class="layui-btn layui-btn-primary" onclick="closeWind()">关闭</button>
    </div>
  </div>
<script type="text/javascript">
layui.use('layer', function(){
	  var layer = layui.layer;
	});

   var listSort='';
   var itemIdSort ='';
   
Sortable.create(document.getElementById('foo'), {
	animation : 150, //动画参数
	onAdd : function(evt) { //拖拽时候添加有新的节点的时候发生该事件
		console.log('onAdd.foo:', [ evt.item, evt.from ]);
	},
	onUpdate : function(evt) { //拖拽更新节点位置发生该事件
		console.log('onUpdate.foo:', [ evt.item, evt.from ]);
	},
	onRemove : function(evt) { //删除拖拽节点的时候促发该事件
		console.log('onRemove.foo:', [ evt.item, evt.from ]);
	},
	onStart : function(evt) { //开始拖拽出发该函数
		console.log('onStart.foo:', [ evt.item, evt.from ]);
	},
	onSort : function(evt) { //发生排序发生该事件
		console.log('onSort.foo:', [ evt.item, evt.from ]);
	},
	onEnd : function(evt) { //拖拽完毕之后发生该事件
		console.log('onEnd.foo:', [ evt.item, evt.from ]);
		var id_arr = '';
		var item_id_arr = '';
		for (var i = 0, len = evt.from.children.length; i < len; i++) {

			var sortIdStr = evt.from.children[i].getAttribute('drag-id');
			var sortIds = sortIdStr.split(",");
			id_arr += ','
					+  sortIds[0];
			item_id_arr += ','
					+ sortIds[1];
		}
		//移动的时候更新序号
		var num = 0;
		$("#foo span").each(function(index){
		   if(index % 2 == 0) {
		      num++;
		      $(this).text(num);
		   }
		});
		//alert(id_arr);
		id_arr = id_arr.substr(1);
		item_id_arr = item_id_arr.substr(1);

		listSort = id_arr;
		itemIdSort = item_id_arr;
		//然后请求后台ajax 这样就完成了拖拽排序
		//alert(id_arr);
		//console.log(id_arr);
	}
});
   
   
   function closeWind(){
	   var index = parent.layer.getFrameIndex(window.name);
	   parent.layer.closeAll();
   }

   function saveSort() {

	   layui.use('layer', function() {
		   var layer = layui.layer;

		   let groupMembers = [];

		   // 查播表组数据，填充groupId 和 groupMembers
		   $.ajax({
			   type: "POST",
			   async: false,
			   url: "<%=request.getContextPath()%>/ptable/getPtableGroupAndMembers.do",
			   data: {
				   "pid": $("#pid").val(),
				   "checkKind": 0,
			   },
			   traditional: true,
			   dataType: "json",
			   success: function (msg) {
				   groupMembers = msg;
				   console.log(groupMembers);
				   //layer.msg(groupMembers[0].pid);

				   let content = '<br>以下为一次排播的多天播表： </br>';
				   for (let member in groupMembers) {
					   content += ('<br>播表名: ' + groupMembers[member].ptableName + ',播放日期：' + timestampToTime(groupMembers[member].playDate) + '</br>');
				   }
				   content += "<br><strong>是否应用修改到以上播表?</strong></br>";

				   // 没有其他的只有自己
				   if (groupMembers.length == 1) {
					   requestPtableSort($("#pid").val());
					   return;
				   }
				   layer.confirm(content, {
					   btn: ['是', '否'], //按钮
					   area: ['500px', '600px']
				   }, function () {
					   // 是
					   for (let member in groupMembers) {
						   requestPtableSort(groupMembers[member].pid);
					   }
				   }, function () {
					   // 否
					   requestPtableSort($("#pid").val());
				   });
			   }

		   });
	   });


   }


   function requestPtableSort(pid){
	   $.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/ptable/modifyPlayTableNumFromaddPtable.do",
			data: {
				"ppid" : pid,
				"sortNum":listSort,
				"itemIdSort" : itemIdSort
			},
			traditional: true,
			dataType : "json",
			success : function(msg){
				var value = msg.toString();
				if(value=="true"){
					parent.layer.closeAll();
					parent.layer.msg('保存成功!',{icon:6,time:2000});
					parent.initTable();
				}else{
					layer.msg('保存失败!!!',{icon:5,time:2000});
				}
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



</script>
</body>
</html>
