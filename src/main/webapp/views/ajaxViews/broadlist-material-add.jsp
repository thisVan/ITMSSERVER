<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;charset=UTF-8" />
<%@ include file="/layui/header.jsp"%>
<title>添加稿件到该播表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
</head>
<body>
	<input type="hidden" id="mid" value="" />
	<input type="hidden" id="terminalId" value="" />
	<input type="hidden" id="ptableId" value="" />
	<input type="hidden" id="itemnum" value="" />

	<div class="layui-fluid">
		<div class="layui-form-item">
			<label class="layui-form-label">稿件名：</label>
			<div class="layui-input-inline">
				<input type="text" id="materialName" name="materialName"
					placeholder="请选择稿件" autocomplete="off" style="width:250px;"
					class="layui-input input-text" readonly="readonly" />
			</div>
			<label class="layui-form-label"></label>
			<div class="layui-input-inline">
				<button name="" id="" class="layui-btn" type="button"
					onclick="selectMaterial()">
					<i class="layui-icon">&#xe61f;</i> 稿件选择
				</button>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">投放周期：</label>
			<div class="layui-input-inline">
				<input type="text" id="testDate" name="testDate"
					style="width:250px;" class="layui-input input-text"
					readonly="readonly" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">时段范围：</label>
			<div class="layui-input-inline">
				<input type="hidden" id="ppid" value="" /> <input type="text"
					id="periodName" name="periodName" required="" style="width:250px;"
					lay-verify="required" autocomplete="off"
					class="layui-input input-text" readonly="readonly" />
			</div>


		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">频次：</label>
			<div class="layui-input-inline">
				<input type="text" id="frequency" name="frequency"
					placeholder="请输入频次" autocomplete="off" style="width:250px;"
					class="layui-input input-text" value="60" />
			</div>
		</div>
		<br>
		<br>
		<hr class="layui-bg-green" />
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" onclick="addMaterial()">
					<i class="layui-icon">&#xe642;</i>保存
				</button>
				<button type="button" class="layui-btn layui-btn-primary"
					onclick="closeWind()">关闭</button>
			</div>
		</div>
</div>
<script type="text/javascript">
	
/* 	layui.use(['layer','form','laydate'], function(){
	    var layer = layui.layer
	    ,form = layui.form
	    ,laydate = layui.laydate;
	    //执行一个laydate实例
	    laydate.render({
	    	elem: '#testDate'
			,range: true
			,type: 'time'
			,format: 'yyyy/MM/dd'
	    }); 
	});  */
	layui.use(['layer','form'], function(){
	    var layer = layui.layer
	    ,form = layui.form;
	    updateConfig();
	    //执行一个laydate实例
	});
	
	
	  function updateConfig() {
	       $('#testDate').daterangepicker({ 
	     "autoApply": true,
		 "locale": {
		     "direction": "rtl",
		     "format": "YYYY-MM-DD",
		     "separator": " / ",
		     "applyLabel": "确定",
		     "cancelLabel": "取消",
		     "fromLabel": "起始时间",
		     "toLabel": "结束时间",
		     "customRangeLabel": "自定义",
		     "daysOfWeek": [
		         "日",
		         "一",
		         "二",
		         "三",
		         "四",
		         "五",
		         "六"
		     ],
		     "monthNames": [
		         "一月",
		         "二月",
		         "三月",
		         "四月",
		         "五月",
		         "六月",
		         "七月",
		         "八月",
		         "九月",
		         "十月",
		         "十一月",
		         "十二月"
		     ],
		     "firstDay": 5
		 },
		 "alwaysShowCalendars": false,
		 "startDate": moment(),
		 "endDate": moment()
	}, function(start, end) {
			//layer.alert(start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
			var datestr = start.format('YYYY-MM-DD') + ' / ' + end.format('YYYY-MM-DD');
			$("#testDate").value = datestr;
			layer.msg(datestr);
		}).click();
	}
	
	
   function closeWind(){
	   var index = parent.layer.getFrameIndex(window.name);
	   parent.layer.closeAll();
   }
   
   
   function addMaterial(){
	   var mid = $("#mid").val();
	   var periodName = $("#periodName").val();
	   var testDate = $("#testDate").val();
	   var frequency = $("#frequency").val();
	   var ptableid = $("#ptableId").val();
	   var itemnum=$("#itemnum").val();
	   //var periodId = periodName.split(",");
	   //var pid = periodId[1];
	   var pid = $("#ppid").val();//时段ID
	   if(frequency == ""){
		   layer.msg('请输入的频次!!!',{icon:6,time:2000});
		   return ;
	   }
	   
	   if(isNaN(frequency)){
		   layer.msg('输入的频次数不符!!!',{icon:5,time:2000});
			return ;
		}
	   if(parseInt(frequency)==frequency){
	    	
	    }else{
	    	layer.msg('输入的频次数不是整数!!!',{icon:5,time:2000});
			return ;
	    }
	   
	   //console.log(periodName);
	   //console.log(testDate);
	   //console.log(frequency);
	   if(periodName == "" || testDate == "" || frequency == ""){
		   layer.msg('时段、日期、频次不能为空!!!',{icon:5,time:2000});
		   return ;
	   }else{
		   var formData = new FormData();
			formData.append("mid",mid);
			formData.append("testDate",testDate);
			formData.append("frequency",frequency);
			formData.append("periodId",pid);
		   $.ajax({
				type: "POST",
				url: "<%=request.getContextPath()%>/material/addMaterial.do",
				data:formData,
				async: false,
				processData : false,
				contentType : false,
				dataType: "json",
				success: function(msg){
					var value = msg.toString();
					if(value=="true"){
						//opener.location.reload();
						$.ajax({
	    						type: "POST",
	    						url: "<%=request.getContextPath()%>/ptable/copyOneToPlayFile.do",
	    						data: {"ppid" : ptableid,"mmid" :mid,"num" :itemnum},
	    						traditional: true,
	    						dataType : "json",
	    						success : function(msg){
	    							parent.initTable();
	    							parent.reloadhtml();
	    							parent.layer.msg('添加成功!',{icon:6,time:2000});
	    						}
	    					});
						//parent.layer.closeAll();
						//parent.refresh();
						
						//window.parent.location.reload(); //刷新父页面
						window.close();
						
				  }else if(value=="false"){
					  layer.msg('存在同名文件，请重新输入!!!',{icon:5,time:2000});
				  }else if(value=="1"){
					  layer.msg('前后时段有误!!!',{icon:5,time:2000});
				     } else if(value == "2"){
				    	 layer.msg('登陆超时,重新登陆操作!!!',{icon:5,time:2000});
				     }
				  else {
				    	 layer.msg('添加失败!!!未知原因！',{icon:5,time:2000});
				     }
				}
			});
		 
	   }
	 }
   
   function selectPeriod(){		
          var terminalId = $("#terminalId").val();
          if(terminalId == "") {
             parent.layer.msg('请先决定排播的稿件!',{icon:5,time:1500});
             return;
          }	  
          
		  layer.open({
			    title:'时段列表',
				type:2,
				area:['100%','90%'],
				content:'<%=request.getContextPath()%>/period/selectPeriod.do?terminalId=' + terminalId 
		  }); 
	}
   
   function selectMaterial(){
	   var terminalId = $("#terminalId").val();
	   var ppid = $("#ptableId").val();
	   layer.open({
		    title:'稿件列表',
			type:2,
			area:['100%','100%'],
			content:'<%=request.getContextPath()%>/material/getMaterialInfoBytid/' + terminalId + '/' + ppid + '.do'
		}); 
   }
</script>
</body>
</html>
