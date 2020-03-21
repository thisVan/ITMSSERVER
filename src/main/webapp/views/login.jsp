<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联网播控系统2.0</title>
<link rel="icon" href="../images/logo.png" type="image/x-icon" />
<link rel="shortcut icon" href="../images/logo.png" type="image/x-icon" />
<link href="<%=request.getContextPath()%>/layui/css/layui.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/login.css" media="all" />
    <script type="text/javascript">
    var videoName = [];    
    if(window !=top){
            top.location.href=location.href;
        }
        function getMedia(){

        	videoName.push("1 (1).mp4");
        	videoName.push("1 (2).mp4");
        	videoName.push("1 (3).mp4");
        	videoName.push("1 (4).mp4");
        	
        	var offset = Math.floor(Math.random()*4);
        	var video = document.getElementById("video");
            video.src = "/ITMS/media/login/" + videoName[offset];
        }
    </script>
</head>
<body onLoad="getMedia()">
<video id="video" class="video-player" preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920">
    <source src="" type="video/mp4">
</video>

<div class="video_mask"></div>
<div class="login">
    <h1>联网播控系统2.0</h1>
    <h2 id="tipMsg" style="text-align:center; color:red; margin-bottom:5px;clear: both"></h2>
        <div class="layui-form-item">
            <input class="layui-input" id="userAccount" name="userAccount" placeholder="用户名" value="" lay-verify="required" type="text" autocomplete="off">
        </div>
        <br>
        <div class="layui-form-item">
            <input class="layui-input" id="userPassword" name="userPassword" placeholder="密码" value=""  lay-verify="required" type="password" autocomplete="off">
        </div>
        <br>
        <button class="layui-btn login_btn" onclick="loginIn()">登录</button>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

    $("body").keydown(function(event){
    	if(event.keyCode == "13"){
    		loginIn();
    	}
    });

    layui.use('layer', function(){
	  var layer = layui.layer;
	});
   
   function validateNameAndPasswd(){
	   var userAccount = document.getElementById("userAccount").value;
	   var userPassword = document.getElementById("userPassword").value;
	   if(userAccount == ""){
		   //layer.msg('请输入用户名',{icon:5,time:2000});
		   $("#tipMsg").html('请输入用户名');
		   $("#userAccount").attr('placeholder','请输入用户名');
	  	  return false ;
	   };
	   if(userPassword == ""){
		  // layer.msg('请输入密码',{icon:5,time:2000});
		   $("#tipMsg").html('请输入密码');
		   $("#userPassword").attr('placeholder','请输入密码');
	  	  return false;
	   };
	   return true;
   }
   
   function loginIn(){
	   var userAccount = document.getElementById("userAccount").value;
	   var userPassword = document.getElementById("userPassword").value;
	   if(validateNameAndPasswd()){
		   $.ajax({
			   type:'POST',
			   url:'<%=request.getContextPath()%>/login/loginIn.do',
			   data:{'userAccount':userAccount,'userPassword':userPassword},
			   dataType:'json',
			   success:function(data){
				   if(data.success) {
				        document.location = "<%=request.getContextPath()%>/front/index.do";
				   } else {
				      $("#tipMsg").html(data.msg);
				   }
			   }
			});
	   }
   }
</script>
</body>
</html>
