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
   
   
   
      function init(){
    	  
    	  var params = "";
    	  
    	  var value;
    	  var terminalvalue;
    	  
    	  
    	  value = $("#materialName").val();
    	  terminalvalue = $("#terminal").val();
		   if(value != "") {
			   params = params + "materialName" + ",like,%" + value + "%,";
		   }
		   if(terminalvalue!=""){
			   params = params +"terminal_id" + ",=,"+terminalvalue+",";
		   }
		   
		   params = params + "statusId" + ",=," + "3" + ","+"file_type"+",=,"+"picture";
    	  layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
    		    elem: '#table1'
    		    ,id: 'flagOne'
    		    ,url:'<%=request.getContextPath()%>/material/getAllMaterialInfo.do'
    		    //,height: 400
    		    //,cellMinWidth: 120
				  ,height:'full-200'
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      {type: 'radio', event: 'set1', fixed: true}
    		      ,{field:'materialName',width:200, event: 'set2', title: '稿件名', fixed: true, sort: true}
    		      ,{field: 'terminalName',width:125, event: 'set3', title: '终端名', sort: true
    		    	  ,templet: function(d){
    		    		  var name = d.terminal;
    		    		  return '<span style="color: #1E9FFF;">' + name.terminalName + '</span>';
    		    	  }
    		      }
    		      ,{field: 'resolution',width:100, event: 'set4', title: '分辨率', sort: true}
      		      ,{field: 'duration',width:80, event: 'set5', title: '时长(秒)', sort: true}
      		      ,{field: 'size',width:100, event: 'set6', title: '大小', sort: true}
      		      ,{field: 'usedNum',width:100, event: 'set7', title: '使用次数', sort: true}
      		      ,{fixed: 'right', width:140, event: 'set8', title: '操作', align:'center', toolbar: '#barDemo'}
      		    ]]
    		    ,page: true
    		    ,where: {"param": params,"field":"materialName","order":"desc"}
    		    ,done: function(res, curr, count){
    		    	  //document.getElementById("table1").remove();
    		      }
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
    			  }else if(obj.event === 'checkMaterial'){
    				  var index = parent.layer.getFrameIndex(window.name);
    				  //console.log(mid);
    				  //console.log(materialName);
    				  parent.$("#mid").val(mid);
    				  parent.$('#materialName').val(materialName);
    				  parent.$('#terminalId').val(tmpdata.terminal.terminalId);
    				  parent.layer.closeAll();
    			  }
    		  });
    		});
      }
      
      function myTrim(x) {
    	    return x.replace(/^\s+|\s+$/gm,'');
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
                                        <option value="${item.terminalId}" <c:if test="${item.terminalId==terminalId}">selected</c:if> >${item.terminalName}</option>
                              			</c:forEach>
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