<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <%@ include file="/layui/header.jsp"%>
   <title>反审核稿件列表</title>
   <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
   <script type="text/javascript" defer="defer">
   var node = [];
   $(function(){
	   init();
   });
   
      function init(){
    	  layui.use('layer', function(){
    		  var layer = layui.layer;
    		});
    	  
    	  layui.use('laydate', function(){
    		  var laydate = layui.laydate;
    		  //执行一个laydate实例
    		  laydate.render({
    		    elem: '#dateTime' //指定元素
    		    ,range: true
    		  });
    		});
    	  
		  
    	   var param = "";
		  
   	       //名称
		   var materialName = $("#materialName").val();
		   if(materialName != ""){
			   param = param + "materialName" + ",like,%" + materialName + "%,";
		   }
		   
		   
		   //类型
		   var fileType = $("#fileType").val();
		   if(fileType != ""){
			   param = param + "fileType" + ",=," + fileType + ",";
		   }
		   
		   
		   //状态
		   var statusId = $("#statusId").val();
		   if(statusId != ""){
			   param = param + "statusId" + ",=," + statusId + ",";
		   }
		   
		   //时间
		   var dateTime = $("#dateTime").val();
    	  
    	  layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
    		    elem: '#table1'
    		    ,id: 'flagTwo'
    		    ,url:'<%=request.getContextPath()%>/material/searchFile.do'
    		   // ,height: 550
    		    //,cellMinWidth: 120
				  ,height:'full-200'
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      //{field:'id', width:'1%'}
    		      {checkbox: true, event: 'set1', fixed: true}
    		      ,{field:'materialName',width:280, event: 'set2', title: '稿件名', fixed: true, sort: true}
    		      ,{field:'terminalName',width:120, event: 'set3', title: '终端名', sort: true
    		    	  ,templet: function(d){
    		    		  var tname = d.terminalName;
    		    		  var name = d.terminal;
    		    		  var tis = d.tis;
    		    		  if(tis == '0'){
    		    			  return '<span style="color: #FF6347;">' + '未选择' + '</span>';
    		    		  }else{
    		    			  return '<span style="color: #1E9FFF;">' + name.terminalName + '</span>';
    		    		  }
    		    	  }
    		      }
    		      ,{field:'statusId',width:100, event: 'set4', title: '审核状态', sort: true
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
    		    		  }
    		    	  }
    		      }
    		      ,{field:'resolution',width:100, event: 'set5', title: '分辨率'}
    		      ,{field:'size',width:130, event: 'set6', title: '稿件大小'}
    		      ,{field:'duration',width:100, event: 'set7', title: '时长(秒)', sort: true}
    		      ,{field:'usedNum',width:100, event: 'set8', title: '使用次数', sort: true}
    		      ,{field:'info',width:100, event: 'set9', title: '排播状态', sort: true
    		    	  ,templet: function(d){
    		    		  var state = d.info;
    		    		  if(state == 0){
    		    			  return '<span style="color: #FF6347;">' + '未排播' + '</span>';
    		    		  }else if(state == 1){
    		    			  return '<span style="color: #90EE90;">' + '已排播' + '</span>';
    		    		  }
    		    	  }
    		      }
    		      /* ,{field:'playDate',width:200, event: 'set9', title: '播放日期', sort: true}
    		      ,{field:'playTime',width:200, event: 'set10', title: '播放时段', sort: true}
    		      ,{field:'frequency',width:100, event: 'set11', title: '频次', sort: true} */
    		      ,{field:'uploadTime',width:160, event: 'set10', title: '上传时间', sort: true
    		    	  ,templet: function(d){
    		    		  var date = new Date(d.uploadTime);
    		    		  var Y = date.getFullYear() + '-';
    		    		  var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    		    		  var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
    		    		  var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
    		    		  var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
    		    		  var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
    		    		  return Y+M+D+h+m+s;
    		    	  }
    		      }
    		      ,{field:'uploadName',width:90, event: 'set11', title: '上传人', sort: true}
    		      ,{fixed: 'right', width:200, event: 'set12', title: '操作', align:'center', toolbar: '#barDemo'}
    		    ]]
    		    ,page: true
    		    ,where: {"param": param,"dateTime":dateTime,"field":"uploadTime", "order":"asc"}
    		    ,done: function(res, curr, count){
    		    	  //changeBg();
    		      }
    		  });
    		  
    		  table.on('tool(tableEvent)', function(obj){
    			  var tmpdata = obj.data;
    			  var mid = tmpdata.mid;
    			  var md5 = tmpdata.md5;
    			  var filePath = tmpdata.filePath;
    			  var name = filePath.split("/");
    			  var realname = name[name.length - 1];
    			  document.getElementById("videoView").value = realname;
    			  if(obj.event === 'mediaView'){
    				  $.ajax({
    						type:"POST",
    					    url: '<%=request.getContextPath()%>/material/deposeMaterial.do',
    					    data: {"mid": mid},
    					    dataType : "json",
    					    success: function(msg){
    					    	var value = msg.toString();
    							if(value=="true"){
    								window.open('<%=request.getContextPath()%>/file/videoViewDepose.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
    							}else if(value == "false"){
    								window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
    							}
    					    }
    					});
    			  }else if(obj.event == "resetState"){
    				  layer.confirm('真的重置该稿件么', function(index){
    					  layer.close(index);
    					  $.ajax({
								type: "POST",
								url: "<%=request.getContextPath()%>/material/resetMaterial.do",
								data: {"mid":mid},
								traditional: true,
								dataType : "json",
								success : function(msg){
									var value = msg.toString();
									if(value=="true"){
										init();
										layer.msg('重置成功!',{icon:6,time:4000});
									}
								}
							});
    				  });
    			  }
    		  });
    		});
      }
      
   </script>
   
</head>
<body>
  <input type="hidden" id="videoView" value="">
  <div>
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
										class="layui-input input-text" />
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
<%--										<option value="1">未审核</option>--%>
										<option value="2">已初审</option>
										<option value="3">已通过</option>
									</select>
								</div>
							</div>
							
							<div class="layui-inline">
			                    <label class="layui-form-mid">上传日期范围：</label>
			                    <div class="layui-inline" style="">
				                    <input type="text" id="dateTime" name="dateTime" autocomplete="off" style="width: 170px; height: 36px;" class="layui-input fsDate" dateRange="1" placeholder=" - "/>
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
            <table class="layui-table" id="table1" lay-filter="tableEvent"></table>
			<!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="top" topUrl="views/datagrid2/one.html" topMode="readonly" topWidth="800px" topHeight="600px" topTitle="查看demo" inputs="id:">查看</a> -->
			<script type="text/html" id="barDemo">
 				<a class="layui-btn layui-btn-sm" lay-event="mediaView" >预览</a>
                <a class="layui-btn layui-btn-sm" lay-event="resetState" >状态重置</a>
			</script>
			<script type="text/html" id="barDemo1">
 				<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5" >MD5</a>
			</script>
	      </div>
			
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