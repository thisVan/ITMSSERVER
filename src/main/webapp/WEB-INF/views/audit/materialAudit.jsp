<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/layui/header.jsp"%>
<title>操作记录列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
<script type="text/javascript" defer="defer">
   $(function(){
	   init();
   });
   
   function refresh(){
	   init();
   }
      function init(){
    	  layui.use('layer', function(){
    		  var layer = layui.layer;
    		});
    	  layui.use('laydate', function(){
    		  var laydate = layui.laydate;
    		  
    		  laydate.render({
      		    elem: '#startTime' //指定元素
      		  });
    		  //执行一个laydate实例
    		  laydate.render({
    		    elem: '#endTime' //指定元素
    		  });
    		});
		  
		 //帐号
		 var userName = $("#userName").val();
		  //角色
		  var roleName = $("#roleName").val();
		  
		  //日期
		  var startTime = $("#startTime").val();
		  var endTime = $("#endTime").val();
		   
		  //操作类型
		  var operation=$("#operation").val();
		   //素材ID
		  var modifyObjectId = $("#modifyObjectId").val();
   		  var params = "modifyObjectType, = ,MATERIAL,";
			
   		  if(userName!="")
			params=params+"userName"+",=,"+userName+",";
		  if(roleName!="")
			params=params+"roleName"+",=,"+roleName+",";
	      if(operation!="")
			params=params+"operation"+",=,"+operation+","; 
		  if(modifyObjectId!="")
			params=params+"modifyObjectId"+",=,"+modifyObjectId+","; 
			
    	  
    	  layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
      		    elem: '#table1'
      		    ,id: 'flagOne'
      		    ,url:'<%=request.getContextPath()%>/audit/getAllMaterialAuditLog.do'
      		    //,height: 550
      		    //,cellMinWidth: 120
      		    ,limits:[10,25,50,75,100,500]
      		    , initSort: {
      		      field: 'statusId' //排序字段，对应 cols 设定的各字段名
      		        ,type: 'asc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
      		      }
      		    ,cols: [[
				  	{field:'modifyObjectName',width:300, event: 'set6', title: '操作对象名称', fixed:true,sort: true}
				  	,{field:'operation',width:200, event: 'set4', title: '操作类型', sort: true}
        		    ,{field:'userName',width:140, event: 'set2', title: '操作账户', sort: true}
					,{field:'roleName',width:140, event: 'set1', title: '操作角色', sort: true}
        		    ,{field:'operationTime',width:220, event: 'set3', title: '操作日期', sort: true
          		    	,templet: function(d){
      		    		  var date = new Date(d.operationTime);
      		    		  var Y = date.getFullYear() + '-';
      		    		  var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
      		    		  var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
      		    		  var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
      		    		  var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
      		    		  var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
      		    		  return Y+M+D+h+m+s;
      		    	  	}
          		    }     
					,{field:'modifyObjectId',width:140, event: 'set10', title: '操作对象ID', sort: true}
        		]]
      		    ,page: true
      		    ,where: {
      		    	"start": startTime,
      		    	"end"  : endTime,
      		    	"param": params
      		    }
      		    ,done: function(res, curr, count){
      		    	  //document.getElementById("table1").remove();
      		    	  if(res.fail == 1){
      		    	      layer.msg(res.msg,{icon:5,time:2000});
      		    	  }
      		    	  //console.log(res.msg);
      		      }
      		  });
    		   
    		  table.on('sort(flagOne)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
								<label class="layui-form-mid">账户：</label>
								<div class="layui-input-inline"
									style="width: 100px; height: 35px;">
									<input type="tel" id="userName" name="userName" autocomplete="off"
										style="width: 100px; height: 35px;" placeholder="请输入账号"
										class="layui-input input-text" />
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">角色：</label>
								<div class="layui-input-inline"
									style="width: 100px; height: 35px;">
									<input type="tel" id="roleName" name="roleName" autocomplete="off"
										style="width: 100px; height: 35px;" placeholder="请输入角色名"
										class="layui-input input-text" />
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">操作日期范围：</label>
								<div class="layui-inline" style="">
									<input type="text" id="startTime" name="startTime"
										autocomplete="off" style="width: 100px; height: 36px;"
										class="layui-input fsDate" dateRange="1" />
								</div>
							</div>

							<div class="layui-inline">
								<div class="layui-inline" style="">
									<label class="layui-form-mid">-&nbsp;&nbsp;&nbsp;</label> <input
										type="text" id="endTime" name="endTime" autocomplete="off"
										style="width: 100px; height: 36px;" class="layui-input fsDate"
										dateRange="1" />
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">操作类型：</label>
								<div class="layui-input-inline"
									style="width: 150px; height: 35px;">
									<select id="operation" name="operation" style="width: 150px; height: 35px;">
										<option value="">-请选择-</option>
										<option value="MATERIAL_UPLOAD">上传</option>
										<option value="MATERIAL_DELETE">删除</option>
										<option value="MATERIAL_MODIFY">修改</option>
										<option value="MATERIAL_REVIEW">审核</option>
									</select>
								</div>
							</div> 

							<div class="layui-inline">
								<label class="layui-form-mid">素材ID：</label>
								<div class="layui-input-inline"
									style="width: 100px; height: 35px;">
									<input type="tel" id="modifyObjectId" name="modifyObjectId" autocomplete="off"
										style="width: 100px; height: 35px;" placeholder="ID"
										class="layui-input input-text" />
								</div>
							</div>

							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" type="button" onclick="init()">
										<i class="layui-icon">&#xe615;</i>查询
									</button>
								</div>
							</div>
							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" onclick="refresh()">
										<i class="layui-icon">&#x1002;</i>刷新
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="layui-col-md12">
				<table class="layui-table" id="table1" lay-filter="tableEvent"></table>
				<!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="top" topUrl="views/datagrid2/one.html" topMode="readonly" topWidth="800px" topHeight="600px" topTitle="查看demo" inputs="id:">查看</a> -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
	layui.use('form', function(){
		  var form = layui.form;
		});
	</script>
</body>
</html>