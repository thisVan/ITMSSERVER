<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/layui/header.jsp"%>
<title>排播列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
<script type="text/javascript" defer="defer">
   var tabIndex=0;
   layui.use(['layer','form', 'element','laydate'], function(){
		var layer = layui.layer
		,form = layui.form
		,element = layui.element
	    ,laydate = layui.laydate;
		
		laydate.render({
		    elem: '#broadTime' //指定元素
		    ,range: true
		  });
		//监听Tab切换
		  element.on('tab(demo)', function(data){
			tabIndex=data.index;
			init();
		/*     layer.tips('切换了 '+ tabIndex +'：'+ this.innerHTML, this, {
		      tips: 1
		    }); */
		  });
	    //执行一个laydate实例
	    laydate.render({
		    elem: '#dateTime' //指定元素
		    ,range: true
		  });
	   
			
			//form.render('select', 'infoValue');
			form.on('radio(infoValue)', function(data){
				if(data.value == 0){
					//document.getElementById("tName").style.display="none";//隐藏
					document.getElementById("broadDate").style.display="none";//隐藏
					document.getElementById("uploadDate").style.display="";//显示
					$("#delBtn").hide();
					doNoSearch();
				}else if(data.value == 1){
					document.getElementById("broadDate").style.display="";//显示
					document.getElementById("uploadDate").style.display="none";//隐藏
					//document.getElementById("tName").style.display="";
					$("#delBtn").show();
					doYesSearch();
				}
			});
	});
   
   var node = [];
   var searchTerminal = "";
   $(function(){	   
	   treeSearch();
	   init();
   });   
   
   function init(){
	  
	   var radioId = document.getElementsByName("info");
		var infoId;
		for(var i=0;i<radioId.length;i++){
			if(radioId[i].checked==true){
				infoId=radioId[i].value;
			}
		}
		if(infoId == 0){
			doNoSearch();
		}else if(infoId == 1){
			doYesSearch();
			document.getElementById("uploadDate").style.display="none";//隐藏
		}
   }

   
   function doNoSearch(){
	   var param = "";
		  
	   //名称
	   var materialName = $("#materialName").val();
	   if(materialName != ""){
		   param = param + "materialName" + ",like,%" + materialName + "%,";
	   }
	   //状态
	   var statusId = $("#statusId").val();
	   if(statusId != ""){
		   param = param + "statusId" + ",=," + 3 + ",";
	   }
	   //时间
	   var dateTime = $("#dateTime").val();
	   param = param + "info" + ",=," + 0 + ",";
	   if(tabIndex==0){
	   param = param + "fileType" + ",=,vedio,";
	   
	   //方法级渲染
	   layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
				  autoSort: false
				  ,elem: '#table1'
    		    ,id: 'flagTwo'
    		    ,url:'<%=request.getContextPath()%>/material/wrapSearchFile.do'
    		    //,height: 500
    		    //,cellMinWidth: 120
				  ,height: 'full-200'
				  , cellMinWidth: 80
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      //{field:'id', width:'1%'}
    		      {checkbox: true, fixed: true}
    		      ,{field:'materialName',width:280, event: 'set2', title: '稿件名', fixed: true, sort: true}
    		      ,{field:'terminalName',width:120, event: 'set3', title: '终端名', sort: true
    		    	  ,templet: function(d){
    		    		  var terminal = d.terminal;
    		    		  return '<span style="color: #1E9FFF;">' + terminal.terminalName + '</span>';
    		    	  }
    		      }
    		      ,{field:'resolution',width:100, event: 'set6', title: '分辨率'}
    		      ,{field:'size',width:130, event: 'set6', title: '稿件大小'}
    		      ,{field:'duration',width:100, event: 'set7', title: '时长(秒)', sort: true}
    		      ,{field:'usedNum',width:100, event: 'set8', title: '使用次数', sort: true}
    		      ,{field:'statusId',width:100, event: 'set8', title: '审核状态', sort: true
    		    	  ,templet: function(d){
    		    		  var state = d.statusId;
    		    		  if(state == 1){
    		    			  return "未审核";
    		    		  }else if(state == 2){
    		    			  return "已初审";
    		    		  }else if(state == 3){
    		    			  return "已通过";
    		    		  }else if(state == 4){
    		    			  return "未通过";
    		    		  }
    		    	  }
    		      }
    		      ,{field:'uploadTime',width:160, event: 'set9', title: '上传时间', sort: true
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
    		      ,{field:'uploadName',width:90, event: 'set10', title: '上传人', sort: true}
    		      ,{fixed: 'right', width:180, event: 'set13', title: '操作', align:'center', toolbar: '#barDemoNo1'}
    		    ]]
    		    ,page: true
    		    ,where: {"terminalIdStr": searchTerminal, "param": param, "dateTime":dateTime, "field": "uploadTime", "order":"desc"}
    		    ,done: function(res, curr, count){
    		    	  //changeBg();
    		      }
    		  });

		   table.on('sort(tableEvent)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			   console.log(obj.field); //当前排序的字段名
			   console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
			   console.log(this) //当前排序的 th 对象*/

			   //尽管我们的 table 自带排序功能，但并没有请求服务端。
			   //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
			   table.reload('flagTwo', { //testTable是表格容器id
				   initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
				   ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
					   field: obj.field //排序字段
					   ,order: obj.type //排序方式
				   }
			   });
		   });

    		  table.on('tool(tableEvent)', function(obj){
    			  var tmpdata = obj.data;
    			  var mmid = tmpdata.mid;
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
  					    data: {"mid": mmid},
  					    dataType : "json",
  					    success: function(msg){
  				
  							window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
  							
  					    }
  					});
    				  <%-- window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620"); --%>
    			  } else if(obj.event === 'md5'){
    				  layer.open({
    					  title: 'MD5'
    					  ,content: md5
    					});
    			  }else if(obj.event === 'broadMedia'){
    				  layer.open({
			    			title:'排播稿件',
			    			type:2,
			    			area:['60%','85%'],
			    			content:'<%=request.getContextPath()%>/views/ajaxViews/material-add.jsp',
			    			success: function(layero, index){
			    				var body = layer.getChildFrame('body',index);//建立父子联系
			    	            var iframeWin = window[layero.find('iframe')[0]['name']];
			    	            // console.log(arr); //得到iframe页的body内容
			    	            // console.log(body.find('input'));
			    	            var inputList = body.find('input');
			    	            //var labelList = body.find('label');
			    	            $(inputList[0]).val(mmid);
			    	            $(inputList[1]).val(materialName);
			    	            $(inputList[6]).val(tmpdata.terminal.terminalId);
			    			}
    				  });
    			  }
    		  });
	   });
	   }else{
		param = param + "fileType" + ",=,picture,";
	   //方法级渲染
	   layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
    		    elem: '#table2'
    		    ,id: 'flagTwo'
    		    ,url:'<%=request.getContextPath()%>/material/wrapSearchFile.do'
    		    //,height: 500
    		    //,cellMinWidth: 120
				  ,height:'full-200'
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      //{field:'id', width:'1%'}
    		      {checkbox: true, fixed: true}
    		      ,{field:'materialName',width:280, event: 'set1', title: '稿件名', fixed: true, sort: true}
    		      ,{field:'terminalName',width:120, event: 'set2', title: '终端名', sort: true
    		    	  ,templet: function(d){
    		    		  var terminal = d.terminal;
    		    		  return '<span style="color: #1E9FFF;">' + terminal.terminalName + '</span>';
    		    	  }
    		      }
    		      ,{field:'resolution',width:100, event: 'set3', title: '分辨率'}
    		      ,{field:'size',width:130, event: 'set4', title: '稿件大小'}
    		      ,{field:'fileType',width:100, event: 'set5', title: '文件类型', sort: true}
    		      ,{field:'statusId',width:100, event: 'set6', title: '审核状态', sort: true
    		    	  ,templet: function(d){
    		    		  var state = d.statusId;
    		    		  if(state == 1){
    		    			  return "未审核";
    		    		  }else if(state == 2){
    		    			  return "已初审";
    		    		  }else if(state == 3){
    		    			  return "已通过";
    		    		  }else if(state == 4){
    		    			  return "未通过";
    		    		  }
    		    	  }
    		      }
    		      ,{field:'createTime',width:160, event: 'set7', title: '上传时间', sort: true
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
    		      ,{field:'uploadName',width:90, event: 'set8', title: '上传人', sort: true}
    		      ,{fixed: 'right', width:180, event: 'set9', title: '操作', align:'center', toolbar: '#barDemoNo2'}
    		    ]]
    		    ,page: true
    		    ,where: {"terminalIdStr": searchTerminal, "param": param, "dateTime":dateTime}
    		    ,done: function(res, curr, count){
    		    	  //changeBg();
    		      }
    		  });
    		 
    		  table.on('tool(marqueeEvent)', function(obj){
    			  var tmpdata = obj.data;
    			  var mmid = tmpdata.mid;
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
  					    data: {"mid": mmid},
  					    dataType : "json",
  					    success: function(msg){
  				
  							window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620");
  							
  					    }
  					});
    				  <%-- window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620"); --%>
    			  } else if(obj.event === 'md5'){
    				  layer.open({
    					  title: 'MD5'
    					  ,content: md5
    					});
    			  }<%-- else if(obj.event === 'broadMedia'){
    				  layer.open({
			    			title:'排播稿件',
			    			type:2,
			    			area:['60%','85%'],
			    			content:'<%=request.getContextPath()%>/views/ajaxViews/material-add.jsp',
			    			success: function(layero, index){
			    				var body = layer.getChildFrame('body',index);//建立父子联系
			    	            var iframeWin = window[layero.find('iframe')[0]['name']];
			    	            // console.log(arr); //得到iframe页的body内容
			    	            // console.log(body.find('input'));
			    	            var inputList = body.find('input');
			    	            //var labelList = body.find('label');
			    	            $(inputList[0]).val(mmid);
			    	            $(inputList[1]).val(materialName);
			    	            $(inputList[6]).val(tmpdata.terminal.terminalId);
			    			}
    				  });
    			  } --%>
    		  });
    		  
    	  });
	 }
   }
   
   
   function doYesSearch(){
	   var param = "";
	   //名称
	   var materialName = $("#materialName").val();
	   if(materialName != ""){
		   param = param + "materialName" + ",like,%" + materialName + "%,";
	   }
	   if(tabIndex==0){
	   var dateTime = $("#broadTime").val();   //时间
	   
	   //方法级渲染
	   layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
				  autoSort: false
				  ,elem: '#table1'
    		    ,id: 'flagTwo'
    		    ,url:'<%=request.getContextPath()%>/material/wrapSearchBroadItem.do'
    		   // ,height: 500
    		    //,cellMinWidth: 120
				  ,height:'full-200'
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      //{field:'id', width:'1%'}
    		      {checkbox: true, event: 'set1', fixed: true}
    		      ,{field:'itemName',width:280, event: 'set2', title: '节目名称', fixed: true, sort: true}
    		      ,{field:'terminalName',width:120, event: 'set3', title: '终端名', sort: true
    		    	  ,templet: function(d){
    		    		  var material = d.material;
    		    		  var name = material.terminal;
    		    		  return '<span style="color: #1E9FFF;">' + name.terminalName + '</span>';
    		      }
    		      }
    		      ,{field:'playDate',width:200, event: 'set4', title: '播放日期', sort: true}
    		      ,{field:'periodName',width:200, event: 'set5', title: '播放时段', sort: true}
    		      ,{field:'frequency',width:80, event: 'set6', title: '频次', sort: true}
    		      ,{field:'resolution',width:100, event: 'set7', title: '分辨率'
    		    	  ,templet: function(d){
    		    		  var material = d.material;
    		    		  return material.resolution;
    		      }
    		      }
    		      ,{field:'size',width:130, event: 'set8', title: '稿件大小'
    		    	  ,templet: function(d){
    		    		  var material = d.material;
    		    		  return material.size;
    		      }  
    		      }
    		      ,{field:'duration',width:100, event: 'set9', title: '时长(秒)', sort: true
    		    	  ,templet: function(d){
    		    		  var material = d.material;
    		    		  return material.duration;
    		      }  
    		      }
    		      ,{field:'statusId',width:100, event: 'set10', title: '审核状态', sort: true
    		    	  ,templet: function(d){
    		    		  var states = d.material;
    		    		  var state = states.statusId;
    		    		  if(state == 1){
    		    			  return "未审核";
    		    		  }else if(state == 2){
    		    			  return "已初审";
    		    		  }else if(state == 3){
    		    			  return "已通过";
    		    		  }else if(state == 4){
    		    			  return "未通过";
    		    		  }
    		    	  }
    		      }
    		      ,{field:'info',width:100, event: 'set11', title: '排播状态', sort: true
    		    	  ,templet: function(d){
    		    		  var states = d.material;
    		    		  var state = states.info;
    		    		  if(state == 0){
    		    			  return '<span style="color: #FF6347;">' + '未排播' + '</span>';
    		    		  }else if(state == 1){
    		    			  return '<span style="color: #90EE90;">' + '已排播' + '</span>';
    		    		  }
    		    	  }
    		      }
    		      ,{field:'createTime',width:160, event: 'set12', title: '创建时间', sort: true
    		    	  ,templet: function(d){
    		    		  var date = new Date(d.createTime);
    		    		  var Y = date.getFullYear() + '-';
    		    		  var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    		    		  var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
    		    		  var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
    		    		  var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
    		    		  var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
    		    		  return Y+M+D+h+m+s;
    		    	  }
    		      }
    		      ,{field:'createName',width:90, event: 'set13', title: '创建人', sort: true}
    		      ,{fixed: 'right', width:180, event: 'set14', title: '操作', align:'center', toolbar: '#barDemoYes1'}
    		    ]]
    		    ,page: true
    		    ,where: {"terminalIdStr": searchTerminal, "params": param, "dateTime": dateTime,"field": "createTime", "order":"desc"}
    		    ,done: function(res, curr, count){
    		    	  //changeBg();
    		      }
    		  });


		   table.on('sort(tableEvent)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			   console.log(obj.field); //当前排序的字段名
			   console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
			   console.log(this) //当前排序的 th 对象*/

			   //尽管我们的 table 自带排序功能，但并没有请求服务端。
			   //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
			   table.reload('flagTwo', { //testTable是表格容器id
				   initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
				   ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
					   field: obj.field //排序字段
					   ,order: obj.type //排序方式
				   }
			   });
		   });

    		  table.on('checkbox(tableEvent)', function(obj){
  			      //console.log(obj);
  		       });
    		  
    		  var  active = {
    				  getDeleteData: function(){ //获取选中数据
    				      var checkStatus = table.checkStatus('flagTwo')
    				      ,data = checkStatus.data;
    				      var mids = [];
    				      for(var i = 0; i < data.length; i++){
    					      mids.push(data[i].itemId);
    				      }
    				      if(mids.length == 0){
    				    	  layer.msg('请选择要删除的数据!',{icon:6,time:1500});
    				    	  return ;
    				      }
    				      //批量删除
    				      layer.confirm('确定删除选中的节目吗', function(index){
    					         //obj.del();
    					         layer.close(index);
    					       
    					         $.ajax({
    									type: "POST",
    									url: "<%=request.getContextPath()%>/material/delItem.do",
    									data: {"itemIds":mids},
    									traditional: true,
    									dataType : "json",
    									success : function(data){
    										if(data.success) {
    										   refresh();
										       layer.msg('删除成功!',{icon:6,time:2000});
										     } else {
										       layer.msg(data.msg, {icon:5,time:2000});
										     }
    									}
    								});
    			    	  });
    				    }
    		  };
    		  
    		  $('.operatorTable').on('click', function(){
				  var othis = $(this);
				  var dothing = othis.attr("function");
				  if(dothing == "getDeleteData"){
					  //console.log(dothing);
					  active.getDeleteData();
				  }
			  });
    		  
    		  
    		  table.on('tool(tableEvent)', function(obj){
    			  var tmpdata = obj.data;
    			  var itemId = tmpdata.itemId;
    			  var material = tmpdata.material;
    			  var mmid = material.mid;
    			  var md5 = material.md5;
    			  var materialName = material.materialName;
    			  var date = tmpdata.playDate;
    			  var periodId = tmpdata.periodId;
    			  var pNameOld = tmpdata.periodName;
    			  var pNameNew = pNameOld.split(" ");
    			  var pName = pNameNew[0];
    			  var frequency = tmpdata.frequency;
    			  var filePath = material.filePath;
    			  var name = filePath.split("/");
    			  var realname = name[name.length - 1];
    			  //console.log(date);console.log(pName);console.log(frequency);console.log(realname);
    			  document.getElementById("videoView").value = realname;
    			  if(obj.event === 'mediaView'){
    				  $.ajax({
  						type:"POST",
  					    url: '<%=request.getContextPath()%>/material/deposeMaterial.do',
  					    data: {"mid": mmid},
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
    				  <%-- window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620"); --%>
    			  }else if(obj.event === 'md5'){
    				  layer.open({
    					  title: 'MD5'
    					  ,content: md5
    					});
    			  }else if(obj.event === 'mediaUpdate'){
    				  layer.open({
			    			title:'重新排播稿件',
			    			type:2,
			    			area:['60%','85%'],
			    			content:'<%=request.getContextPath()%>/views/ajaxViews/broad-update.jsp',
			    			success: function(layero, index){
			    				var body = layer.getChildFrame('body',index);//建立父子联系
			    	            var iframeWin = window[layero.find('iframe')[0]['name']];
			    	            // console.log(arr); //得到iframe页的body内容
			    	            // console.log(body.find('input'));
			    	            var inputList = body.find('input');
			    	            //var labelList = body.find('label');
			    	            $(inputList[0]).val(itemId);
			    	            $(inputList[1]).val(materialName);
			    	            $(inputList[2]).val(date);
			    	            $(inputList[3]).val(periodId);
			    	            $(inputList[4]).val(pName);
			    	            $(inputList[5]).val(frequency);
			    	            $(inputList[6]).val(tmpdata.terminalId);
			    			}
    				  });
    			  }
    		  });
	   });
	   }else{
	   
	   <!--begin-->
	   //方法级渲染
	   layui.use('table', function(){
		   var table = layui.table;
 		  table.render({
 		    elem: '#table2'
 		    ,id: 'flagThree'
 		    ,url:'<%=request.getContextPath()%>/material/wrapSearchMarquee.do'
 		    //,height: 500
 		    //,cellMinWidth: 120
			  ,height:'full-200'
 		    ,limits:[10,25,50,75,100]
 		    ,cols: [[
 		      //{field:'id', width:'1%'}
 		      {checkbox: true, event: 'set1', fixed: true}
 		     ,{field:'marqName',width:280, event: 'set2', title: '稿件名', fixed: true, sort: true}
		     ,{field:'marqName',width:120, event: 'set3', title: '终端名', sort: true
		    	  ,templet: function(d){
		    		 // var terminal = d.terminal;
		    		  return '<span style="color: #1E9FFF;">' + d.terminalName + '</span>';
		    	  }
		      }
		      ,{field:'resolution',width:100, event: 'set4', title: '分辨率'}
		      ,{field:'playDate',width:200, event: 'set4', title: '播放日期', sort: true}
		      ,{field:'size',width:130, event: 'set5', title: '稿件大小'}
		      ,{field:'fileType',width:100, event: 'set6', title: '文件类型', sort: true}
		      ,{field:'statusId',width:100, event: 'set7', title: '审核状态', sort: true
		    	  ,templet: function(d){
		    		  var state = d.statusId;
		    		  if(state == 1){
		    			  return "未审核";
		    		  }else if(state == 2){
		    			  return "已初审";
		    		  }else if(state == 3){
		    			  return "已通过";
		    		  }else if(state == 4){
		    			  return "未通过";
		    		  }
		    	  }
		      }
		      ,{field:'createTime',width:160, event: 'set8', title: '上传时间', sort: true
		    	  ,templet: function(d){
		    		  var date = new Date(d.createTime);
		    		  var Y = date.getFullYear() + '-';
		    		  var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
		    		  var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
		    		  var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
		    		  var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
		    		  var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
		    		  return Y+M+D+h+m+s;
		    	  }
		      }
		      ,{field:'userName',width:90, event: 'set9', title: '创建人', sort: true}
		      ,{fixed: 'right', width:180, event: 'set10', title: '操作', align:'center', toolbar: '#barDemoYes2'}
		    ]]
 		    ,page: true
 		    ,where: {"terminalIdStr": searchTerminal, "param": param, "dateTime": dateTime}
 		    ,done: function(res, curr, count){
 		    	  //changeBg();
 		      }
 		  });
 		  
		  table.on('checkbox(marqueeEvent)', function(obj){
			      //console.log(obj);
		       });
		  
		  var  active = {
				  getDeleteData: function(){ //获取选中数据
				      var checkStatus = table.checkStatus('flagThree')
				      ,data = checkStatus.data;
				      var mids = [];
				      for(var i = 0; i < data.length; i++){
					      mids.push(data[i].mid);
				      }
				      if(mids.length == 0){
				    	  layer.msg('请选择要删除的数据!',{icon:6,time:1500});
				    	  return ;
				      }
				      //批量删除
				      layer.confirm('确定删除选中的LOGO/图片叠加吗', function(index){
					         //obj.del();
					         layer.close(index);
					       
					         $.ajax({
									type: "POST",
									url: "<%=request.getContextPath()%>/material/delMarquee.do",
									data: {"midIds":mids},
									traditional: true,
									dataType : "json",
									success : function(data){
										if(data.success) {
										   refresh();
									       layer.msg('删除成功!',{icon:6,time:2000});
									     } else {
									       layer.msg(data.msg, {icon:5,time:2000});
									     }
									}
								});
			    	  });
				    }
		  };
		  
		  $('.operatorTable').on('click', function(){
			  var othis = $(this);
			  var dothing = othis.attr("function");
			  if(dothing == "getDeleteData"){
				  //console.log(dothing);
				  active.getDeleteData();
			  }
		  });
		  
		  
		  table.on('tool(marqueeEvent)', function(obj){
			  var tmpdata = obj.data;
			  var marqueeid = tmpdata.mid;
			  var marqueeName = tmpdata.marqName
			  //var material = tmpdata.material;
			  var mmid = tmpdata.materialId;
			  var md5 = tmpdata.md5;
			  var materialName = tmpdata.marqName;
			  var date = tmpdata.playDate;
			  var periodId = tmpdata.periodId;
			  var pNameOld = tmpdata.periodName;
			  var pNameNew = pNameOld.split(" "); 
			  var pName = pNameNew[0];
			  //var frequency = tmpdata.frequency;
			  var opacity = tmpdata.opacity;
			  var filePath = tmpdata.filePath;
			  var name = filePath.split("/");
			  var realname = name[name.length - 1];
			  //console.log(date);console.log(pName);console.log(frequency);console.log(realname);
			  document.getElementById("videoView").value = realname;
			  if(obj.event === 'mediaView'){
				  $.ajax({
						type:"POST",
					    url: '<%=request.getContextPath()%>/material/deposeMaterial.do',
					    data: {"mid": mmid},
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
				  <%-- window.open('<%=request.getContextPath()%>/file/videoView.jsp',"_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=300,top=20, width=800, height=620"); --%>
			  }else if(obj.event === 'md5'){
				  layer.open({
					  title: 'MD5'
					  ,content: md5
					});
			  }else if(obj.event === 'marqueeUpdate'){
				  layer.open({
		    			title:'重新排播稿件',
		    			type:2,
		    			area:['60%','85%'],
		    			content:'<%=request.getContextPath()%>/views/ajaxViews/marquee-update.jsp',
		    			success: function(layero, index){
		    				var body = layer.getChildFrame('body',index);//建立父子联系
		    	            var iframeWin = window[layero.find('iframe')[0]['name']];
		    	            // console.log(arr); //得到iframe页的body内容
		    	            // console.log(body.find('input'));
		    	            var inputList = body.find('input');
		    	            //var labelList = body.find('label');
		    	            $(inputList[0]).val(marqueeid);
		    	            $(inputList[1]).val(materialName);
		    	            $(inputList[2]).val(date);
		    	            $(inputList[3]).val(periodId);
		    	            $(inputList[4]).val(pName);
		    	            $(inputList[5]).val(opacity);
		    	            $(inputList[6]).val(tmpdata.terminalId);
		    			}
				  });
			  }
		  });
	   });
	  }
   }
   
   
   function treeSearch(){
		$.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/material/treeDate.do",
			dataType: "json",
			success: function(msg){
				for(var i = 0; i < msg.length; i++){
					node.push({
			            name:'' + msg[i].name,
			            id: '' + msg[i].id,
			            spread:'' + true
			        });
					if(msg[i].children.length > 0){
						var child = [];
						for(var j = 0; j < msg[i].children.length; j++){
							child.push({
								name:'' + msg[i].children[j].name,
								id:'' + msg[i].children[j].id,
							});
						}
					}
					node[i].children = child;
				}
				
				layui.use(['tree', 'layer'], function(){
					  var layer = layui.layer , $ = layui.jquery; 
					  
					  layui.tree({
					    elem: '#demo1' //指定元素
					    ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
					    ,click: function(item){ //点击节点回调
					            searchTerminal = "";
							    if(item.id.charAt(0) == 'p') {
							       for(var i = 0; i < item.children.length; i++) {
							          searchTerminal += item.children[i].id.slice(1) + ",";
							       }
							    } else {
							          searchTerminal += item.id.slice(1) + ",";
							    }
							    var index=searchTerminal.indexOf(",");
							    document.getElementById("terminalId").value = searchTerminal.substring(0,index);
							    
				     	        //layer.alert(searchTerminal)
				     	        
					         //分两种情况查询
					      	    var radioId = document.getElementsByName("info");
								var infoId;
								for(var i=0;i<radioId.length;i++){
									if(radioId[i].checked==true){
										infoId=radioId[i].value;
									}
								}
								if(infoId == 0){
									doNoSearch(); //排播状态为否
								}else if(infoId == 1){
								    doYesSearch(); //排播状态为是
								}
					            searchTerminal = "";					      
					    }
					    ,nodes: node
					  });
				});
			}
		});
	}
   
   
   function refresh(){
	   init();
   }
   
   function addNewPeriod(){
	   layer.open({
			title:'添加时段',
			type:2,
			area:['60%','85%'],
			content:'<%=request.getContextPath()%>/views/ajaxViews/period-add.jsp',
			success: function(){
				
			}
		});
   }
   
   function materialBroad(){
	   var terminalId=$("#terminalId").val();
	   layer.open({
			title:'稿件列表',
			type:2,
			area:['80%','90%'],
			//shade:false,
			content:'<%=request.getContextPath()%>/material/getMaterialInfo.do?terminalId=' + terminalId,
			
	  });
   }
   function marqueeBroad(){
	   layer.open({
			title:'添加LOGO/图片叠加',
			type:2,
			area:['70%','95%'],
			content:'<%=request.getContextPath()%>/views/ajaxViews/marquee-broad.jsp',
			success: function(layero, index){
				var body = layer.getChildFrame('body',index);//建立父子联系
	            var iframeWin = window[layero.find('iframe')[0]['name']];
	            // console.log(arr); //得到iframe页的body内容
	            // console.log(body.find('input'));
	            var inputList = body.find('input');
	            //var labelList = body.find('label');
	            //$(inputList[0]).val(mmid);
	            //$(inputList[1]).val(materialName);
			}
	  });
   }
   
   function artificialGenerated(){
  	 //手动生成播表
  	 document.location = "<%=request.getContextPath()%>/ptable/generatePtable.do";
   }
   
   $("ul li").click(function() {
   		alert("asdgasdl");
        $(this).css("background","#99CCFF").siblings().css("background","#ffffff"); 
    });
   
   </script>
</head>
<body>
	<input type="hidden" id="videoView" value="">
	<input type="hidden" id="terminalId" value="">
	<div style="width: 14%; height: 100%; float: left">
		<br>
		<lable style="padding-left:0.8em;color: purple;font-size: 1em;">双击打开关闭</lable>
		<ul id="demo1"></ul>
	</div>

	<div style="width: 86%; height: 100%; float: left">
		<div class="layui-fluid">
			<div class="layui-row layui-col-space1">
				<div class="layui-col-md12">
					<div class="layui-form-query">
						<form class="layui-form" id="query_form">
							<div class="layui-form-item">
								<div class="layui-inline">
									<label class="layui-form-mid">稿件名：</label>
									<div class="layui-input-inline"
										style="width: 110px; height: 35px;">
										<input type="tel" id="materialName" name="materialName"
											autocomplete="off" style="width: 110px; height: 35px;"
											placeholder="稿件名" class="layui-input input-text" />
									</div>
								</div>

								<div class="layui-inline" id="uploadDate">
									<label class="layui-form-mid">上传日期范围：</label>
									<div class="layui-inline" style="">
										<input type="text" id="dateTime" name="dateTime"
											autocomplete="off" style="width: 170px; height: 36px;"
											class="layui-input fsDate" dateRange="1" placeholder=" - " />
									</div>
								</div>

								<div class="layui-inline" id="broadDate">
									<label class="layui-form-mid">排播日期范围：</label>
									<div class="layui-inline" style="">
										<input type="text" id="broadTime" name="broadTime"
											autocomplete="off" style="width: 170px; height: 36px;"
											class="layui-input fsDate" dateRange="1" placeholder=" - " />
									</div>
								</div>

								<div class="layui-inline">
									<label class="layui-form-label">是否排播：</label>
									<div class="layui-input-block">
										<input type="radio" name="info" value="1" title="是"
											lay-filter="infoValue" checked> <input type="radio"
											name="info" value="0" title="否" lay-filter="infoValue">
									</div>
								</div>

								<div class="layui-inline">
									<div class="layui-inline">
										<button class="layui-btn layui-btn-jan" type="button"
											onclick="init()">
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
						<div class="layui-btn-container">
							<button class="layui-btn layui-btn-sm" onclick="materialBroad()">
								<i class="layui-icon">&#xe654;</i>节目编辑
							</button>
							<button class="layui-btn layui-btn-sm" onclick="marqueeBroad()">
								<i class="layui-icon">&#xe654;</i>LOGO/图片叠加
							</button>
							<button class="layui-btn layui-btn-sm"
								onclick="artificialGenerated()">
								<i class="layui-icon">&#xe63c;</i>生成播表
							</button>
							<button class="layui-btn layui-btn-sm" onclick="addNewPeriod()">
								<i class="layui-icon">&#xe654;</i>新增时段
							</button>
							<button id="delBtn"
								class="layui-btn layui-btn-sm layui-btn-danger operatorTable"
								function="getDeleteData" data-type="getDeleteData">
								<i class="layui-icon">&#xe640;</i>批量删除
							</button>
							<button class="layui-btn layui-btn-sm" onclick="refresh()">
								<i class="layui-icon">&#x1002;</i>刷新
							</button>
						</div>
						<div class="layui-col-md12">
							<div class="layui-tab layui-tab-brief" lay-filter="demo">
								<ul class="layui-tab-title">
									<li class="layui-this">节目</li>
									<li>LOGO/图片叠加</li>
								</ul>
								<div class="layui-tab-content">
									<div class="layui-tab-item layui-show">
										<table class="layui-hide" id="table1" lay-filter="tableEvent"></table>
										<script type="text/html" id="barDemoNo1">
                         <a class="layui-btn layui-btn-sm" lay-event="broadMedia" >排播</a>
 				         <a class="layui-btn layui-btn-sm" lay-event="mediaView" >预览</a>
                    </script>
										<script type="text/html" id="barDemoYes1">
                    <a class="layui-btn layui-btn-sm" lay-event="mediaUpdate" >修改</a>
 				    <a class="layui-btn layui-btn-sm" lay-event="mediaView" >预览</a>
                    </script>
										<script type="text/html" id="barDemo1">
                    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5" >MD5</a>
                    </script>
									</div>
									<div class="layui-tab-item">
										<table class="layui-hide" id="table2"
											lay-filter="marqueeEvent"></table>
										<script type="text/html" id="barDemoNo2">
 				         <a class="layui-btn layui-btn-sm" lay-event="mediaView" >预览</a>
                    </script>
										<script type="text/html" id="barDemoYes2">
                    <a class="layui-btn layui-btn-sm" lay-event="marqueeUpdate" >修改</a>
 				    <a class="layui-btn layui-btn-sm" lay-event="mediaView" >预览</a>
                    </script>
										<script type="text/html" id="barDemo1">
                    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="md5" >MD5</a>
                    </script>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>