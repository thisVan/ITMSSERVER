<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	  
<meta content="text/html;charset=UTF-8" />
<%@ include file="/layui/header.jsp"%>
<title>排播素材</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />

<script type="text/javascript">
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
</script>
</head>
<body>
	<input type="hidden" id="mid" value="" />
	<input type="hidden" id="terminalId" value="" />

	<div class="layui-fluid">
		<div class="layui-form-item">
			<label class="layui-form-label">素材名：</label>
			<div class="layui-input-inline">
				<input type="text" id="materialName" name="materialName"
					placeholder="请选择素材" autocomplete="off" style="width:250px;"
					class="layui-input input-text" readonly="readonly" />
			</div>
			<div class="layui-input-inline">
				<button name="" id="" class="layui-btn" type="button"
					onclick="selectLogo()">
					<i class="layui-icon">&#xe61f;</i> 素材选择
				</button>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">投放周期：</label>
			<div class="layui-input-inline">
				<!-- <input type="text" id="testDate" name="testDate" placeholder="请选择日期"
					style="width:250px;" class="layui-input input-text" /> -->
					<input type="text" id="testDate" name="testDate" placeholder="请选择日期"
					style="width:250px;" class="layui-input input-text">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">时段范围：</label>
			<div class="layui-input-inline">
				<input type="hidden" id="ppid" value="" /> <input type="text"
					id="periodName" name="periodName" required="" placeholder="请选择时段"
					style="width:250px;" lay-verify="required" autocomplete="off"
					class="layui-input input-text" readonly="readonly" />
			</div>
			<div class="layui-input-inline">
				<button name="" id="" class="layui-btn" type="button"
					onclick="selectPeriod()">
					<i class="layui-icon">&#xe61f;</i> 添加
				</button>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">透明度：</label>
			<div class="layui-input-inline">
				<input type="text" id="opacity" name="opacity"
					placeholder="透明度 0-255" autocomplete="off" style="width:250px;"
					class="layui-input input-text" value="255" />
			</div>
		</div>
		<br> <br>
		<hr class="layui-bg-green" />
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="addMarquee()">
					<i class="layui-icon">&#xe605;</i>保存
				</button>
				<button type="button" class="layui-btn layui-btn-primary"
					onclick="closeWind()">关闭</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
layui.use(['layer','form'], function(){
	    var layer = layui.layer
	    ,form = layui.form;
	  
	    updateConfig();
	  /*   ,laydate = layui.laydate; */
	    //执行一个laydate实例
	    /* laydate.render({
	    	elem: '#testDate'
			,range: true
			,type: 'date'
			,format: 'yyyy-MM-dd'
			,value: new Date().format("yyyy-MM-dd") +" - "+ new Date().format("yyyy-MM-dd")
	    }); */
	});



     //

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
	});
}

 
   function closeWind(){
	   var index = parent.layer.getFrameIndex(window.name);
	   parent.layer.closeAll();
   }
   
   function addMarquee(){
	   var mid = $("#mid").val();
	   var periodName = $("#periodName").val();
	   var testDate = $("#testDate").val();
	   var opacity = $("#opacity").val();
	   layer.alert(opacity)
	   var pid = $("#ppid").val();
	   if(opacity == ""){
		   layer.msg('请输入的图片的透明度!!!',{icon:6,time:2000});
		   return ;
	   }
	   
	   if(isNaN(opacity)){
		   layer.msg('输入的透明度不符!!!',{icon:5,time:2000});
			return ;
		}
	   if(parseInt(opacity)==opacity&&parseInt(opacity)<=255){
	    	
	    }else{
	    	layer.msg('请输入0-255的整数!!!',{icon:5,time:2000});
			return ;
	    }
	   
	   if(periodName == "" || testDate == "" || opacity == ""){
		   layer.msg('时段、日期、透明度不能为空!!!',{icon:5,time:2000});
		   return ;
	   }else{
		   var formData = new FormData();
			formData.append("mid",mid);
			formData.append("testDate",testDate);
			formData.append("opacity",opacity);
			formData.append("periodId",pid);
		   $.ajax({
				type: "POST",
				url: "<%=request.getContextPath()%>/material/addMarquee.do",
				data:formData,
				async: false,
				processData : false,
				contentType : false,
				dataType: "json",
				success: function(msg){
					var value = msg.toString();
					if(value=="true"){
						//opener.location.reload();
						parent.layer.closeAll();
						parent.layer.msg('添加成功!',{icon:6,time:2000});
						parent.refresh();
						//window.parent.location.reload(); //刷新父页面
					}else if(value=="false"){
						layer.msg('存在同名文件，请重新输入!',{icon:5,time:2000});
					}else if(value=="1"){
						layer.msg('前后时段有误!',{icon:5,time:2000});
					}else if(value == "2"){
					    layer.msg('登陆超时,重新登陆操作!',{icon:5,time:2000});
					}else if(value == "4"){
					    layer.msg('执行失败,当前终端已经有LOGO/图片叠加!',{icon:5,time:2000});
					}else {
					    layer.msg('添加失败!',{icon:5,time:2000});
					}
				}
			});
	   }
	 }
   
   function selectPeriod(){		
          var terminalId = $("#terminalId").val();
          if(terminalId == "") {
             parent.layer.msg('请先决定添加的素材!',{icon:5,time:1500});
             return;
          }	  
          
		  layer.open({
			    title:'时段列表',
				type:2,
				area:['100%','90%'],
				content:'<%=request.getContextPath()%>/period/selectPeriod.do?terminalId=' + terminalId 
		  }); 
	}
   
   function selectLogo(){
	   var terminalId=parent.$("#terminalId").val();
	   layer.open({
		    title:'素材列表',
			type:2,
			area:['100%','100%'],
			content:'<%=request.getContextPath()%>/material/getLogoInfo.do?terminalId='+terminalId
		}); 
   }  
</script>
</html>
