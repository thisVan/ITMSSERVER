<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <%@ include file="/layui/header.jsp"%>
   <title>稿件列表</title>
   <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
   <script type="text/javascript" defer="defer">
   /* layui.use('table', function(){
	    var form = layui.table;
	    
	    //单选
	    form.on('checkbox(test)', function (data) {
	        var i = 0;
	        var j = 0;
	        $("input[name='check[]']").each(function () {
	            if( this.checked === true )
	            {
	                i++;
	            }
	            j++;
	        });
	        if( i == j )
	        {
	            $(".checkboxAll").prop("checked",true);
	            form.render('checkbox');
	        }else
	        {
	            $(".checkboxAll").removeAttr("checked");
	            form.render('checkbox');
	        }

	    });
	}); */
   
   $(function(){
	   init();
   });
   
	function getQueryString(name) {
	    var result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
	    if (result == null || result.length < 1) {
	        return "";
	    }
	    return result[1];
	}
   
      function init(){
    	  
    	  var params = "";
    	  
    	  var value;
    	  var terminalvalue;
    	  var timePeriodValue;

    	  value = $("#materialName").val();
    	  terminalvalue = $("#terminal").val();
    	  timePeriodValue = $("#timePeriod").val();

		   if(value != "") {
			   params = params + "materialName" + ",like,%" + value + "%,";
		   }
		   if(terminalvalue!=""){
			   params = params +"terminal_id" + ",=,"+terminalvalue+",";
		   }
		   if(timePeriodValue==""){
			   timePeriodValue = 0;
		   }
		   
		   params = params + "statusId" + ",=," + "3" + ","+"file_type"+",=,"+"vedio";
    	  layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
				  autoSort: false,
    		    elem: '#table1'
    		    ,id: 'flagOne'
    		    ,url:'<%=request.getContextPath()%>/material/getAllMaterialInfo2.do'
    		   // ,height: 400
				  ,height:'full-200'
    		    //,cellMinWidth: 120
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      {type: 'checkbox', event: 'set1', fixed: true}
    		      ,{field:'terminalId',width:200, event: 'set2', title: '稿件名', fixed: true, sort: true,hide:true}
    		      ,{field:'materialName',width:200, event: 'set2', title: '稿件名', fixed: true, sort: true}
    		      ,{field: 'terminalName',width:125, event: 'set3', title: '终端名', sort: false
    		    	  ,templet: function(d){
    		    		  var name = d.terminal;
    		    		  return '<span style="color: #1E9FFF;">' + name.terminalName + '</span>';
    		    	  }
    		      }
    		      ,{field: 'resolution',width:100, event: 'set4', title: '分辨率', sort: true}
      		      ,{field: 'duration',width:80, event: 'set5', title: '时长(秒)', sort: true}
      		      ,{field: 'size',width:100, event: 'set6', title: '大小', sort: true}
      		      ,{field: 'usedNum',width:100, event: 'set7', title: '使用次数', sort: true}
      		      ,{field: 'uploadTime',width:160, event: 'set9', title: '上传时间', sort: true
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
      		      ,{field: 'checkTime',width:160, event: 'set10', title: '审核时间', sort: true
						  ,templet: function(d){
							  var date = new Date(d.checkTime);
							  var Y = date.getFullYear() + '-';
							  var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
							  var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
							  var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
							  var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
							  var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
							  return Y+M+D+h+m+s;
						  }
					  }
      		      ,{field: 'checkName',width:100, event: 'set11', title: '审核人', sort: true}
      		      ,{fixed: 'right', width:140, event: 'set8', title: '操作', align:'center', toolbar: '#barDemo'}
      		    ]]
    		    ,page: true
    		    ,where: {"param": params,"timePeriodValue": timePeriodValue, "field": "uploadTime", "order":"desc"}
    		    ,done: function(res, curr, count){
    		    	  //document.getElementById("table1").remove();
    		      }
    		  });

			  table.on('sort(tableEvent)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				  console.log(obj.field); //当前排序的字段名
				  console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
				  console.log(this) //当前排序的 th 对象*/

				  //尽管我们的 table 自带排序功能，但并没有请求服务端。
				  //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
				  table.reload('flagOne', { //testTable是表格容器id
					  initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
					  ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
						  field: obj.field //排序字段
						  ,order: obj.type //排序方式
					  }
				  });
			  });

    		  table.on('tool(tableEvent)', function(obj){
    			  var tmpdata = obj.data;
    			  var mid = tmpdata.mid;
    			  var md5 = tmpdata.md5;
    			  var materialName = tmpdata.materialName;
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

    						   window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
    							
    					    }
    					});
    			  }else if(obj.event === 'checkMaterial') {
					  //var index = parent.layer.getFrameIndex(window.name);
					  /*  var mainIframeName=getQueryString("parentName");
					   //console.log(mid);
					   //console.log(materialName);
					   var ifrc=window.parent.frames[mainIframeName];
					   var winc=ifrc.window;
					   winc.document.getElementById("mid").value=mid;
					   winc.document.getElementById("materialName").value=materialName;
					   winc.document.getElementById("terminalId").value=tmpdata.terminal.terminalId;
						*/
					  var index = layer.open({
						  title: '排播稿件',
						  type: 2,
						  area: ['70%', '80%'],
						  //shade:false,
						  content: '<%=request.getContextPath()%>/views/ajaxViews/material-broad.jsp',
						  //zIndex: layer.zIndex, //重点1
						  success: function (layero, index) {
							  var body = layer.getChildFrame('body', index);//建立父子联系
							  var iframeWin = window[layero.find('iframe')[0]['name']];
							  // console.log(arr); //得到iframe页的body内容
							  // console.log(body.find('input'));
							  var inputList = body.find('input');
							  //var labelList = body.find('label');
							  //$(inputList[0]).val(mmid);
							  //$(inputList[1]).val(materialName);
							  body.find('#mid').val(mid);
							  body.find('#materialName').val(materialName);
							  body.find('#terminalId').val(tmpdata.terminal.terminalId);
							  layer.iframeAuto(index);
							  //layer.setTop(layero); //重点2
						  }
					  });
					  /* window.parent.$("#layui-layer-iframe"+idx).contents().find("mid").val(mid);
    				  window.parent.$("#layui-layer-iframe"+idx).contents().find("materialName").val(materialName);
    				  window.parent.$("#layui-layer-iframe"+idx).contents().find("terminalId").val(tmpdata.terminal.terminalId); */
					  //parent.$('#materialName').val(materialName);
					  //parent.$('#terminalId').val(tmpdata.terminal.terminalId);
					  //parent.layer.close(index);
				  }
    		  });
    		});
      }

      function getBroadData(){
		  var table=layui.table;
		  var checkStatus = table.checkStatus('flagOne')
				  ,data = checkStatus.data;
		  var mids = [];
		  for(var i = 0; i < data.length; i++){
			  mids.push(data[i].mid);
		  }
		  if(mids.length == 0){
			  layer.msg('请选择要排播的稿件!',{icon:6,time:1500});
			  return ;
		  }
		  var materialName ="";
		  for(var i = 0; i < data.length; i++){
		  	if(i==0){
				materialName += data[i].materialName;
			}else{
				materialName+= "," + data[i].materialName;
			}
		  }
		  for(var i = 1; i < data.length; i++){
			  if(data[i].terminal.terminalId != data[0].terminal.terminalId){
				  layer.msg('请选择相同终端的稿件!',{icon:6,time:1500});
				  return ;
			  }
		  }
		  //批量排播
		  var index=layer.open({
			  title:'排播稿件',
			  type:2,
			  area:['70%','80%'],
			  //shade:false,
			  content:'<%=request.getContextPath()%>/views/ajaxViews/material-broad2.jsp',
			  //zIndex: layer.zIndex, //重点1
			  success: function(layero, index){
				  var body = layer.getChildFrame('body',index);//建立父子联系
				  var iframeWin = window[layero.find('iframe')[0]['name']];
				  // console.log(arr); //得到iframe页的body内容
				  // console.log(body.find('input'));
				  var inputList = body.find('input');
				  //var labelList = body.find('label');
				  //$(inputList[0]).val(mmid);
				  //$(inputList[1]).val(materialName);
				  body.find('#mid').val(mids);
				  body.find('#materialName').val(materialName);
				  body.find('#terminalId').val(data[0].terminal.terminalId);
				  layer.iframeAuto(index);
				  //layer.setTop(layero); //重点2
			  }
		  });
	  }
      
      function myTrim(x) {
    	    return x.replace(/^\s+|\s+$/gm,'');
    	}
      
      
   </script>
   
</head>
<body>
	<script type="text/javascript">document.write(mainIframeName);</script>
	<input type="hidden" id="videoView" value="">
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
										style="width: 100px; height: 35px;" placeholder="稿件名"
										class="layui-input input-text" />
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-mid">终端：</label>
								<div class="layui-input-inline"
									style="width: 150px; height: 35px;">
									<select name="terminal" id="terminal" lay-verify="required" lay-search="" style="width: 140px; height: 35px;">
										<option value="">直接选择或搜索</option>
										<c:forEach items="${terminals}" var = "item" varStatus = "status">
                                        <option value="${item.terminalId}"  <c:if test="${item.terminalId==terminalId}">selected</c:if> > ${item.terminalName} </option>
                              			</c:forEach>
									</select>
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-mid">时间段：</label>
								<div class="layui-input-inline"
									 style="width: 150px; height: 35px;">
									<select id="timePeriod" name="timePeriod" style="width: 150px; height: 35px;">
										<option value="">--请选择--</option>
										<option value="7">近一周</option>
										<option value="30">近一个月</option>
										<option value="365">近一年</option>
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
							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" type="button" onclick="getBroadData()">
										<i class="layui-icon"></i>批量排播
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			
					<div class="layui-col-md12">
  	 	<div class="layui-row grid-demo">
			
		 <div class="layui-col-md12">
            <table class="layui-table" id="table1" lay-filter="tableEvent"></table>
			<script type="text/html" id="barDemo">
 				<a class="layui-btn layui-btn-sm" lay-event="mediaView" >预览</a>
                <a class="layui-btn layui-btn-sm" lay-event="checkMaterial" >选定</a>
			</script>
			<script type="text/html" id="barDemo1">
 				<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5" >MD5</a>
			</script>
	      </div>
			
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