<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>素材预览</title>
<link href="<%=request.getContextPath()%>/layui/css/layui.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/layui/css/video-js.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/layui/video.min.js"></script>
</head>
<body onLoad="getMedia()">
	<input type="hidden" id="vdo">
	<h2 id="tipMsg" hidden align="center"
		style="color:red; margin-top:20px;">视频已被删除</h2>
	<div id="div2">
		<div align="center">
			<video width="650" height="450" id="video1" class="video-js" preload="auto" controls autoplay="autoplay" loop="loop">
				<source src="" type="video/mp4" />
			</video>
		</div>
		<br>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 5px;">
			<legend>素材信息</legend>
		</fieldset>
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>素材名:</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>${sessionScope.materialThree.materialName}</label>
			<br>
			<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>素材分辨率:</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>${sessionScope.materialThree.resolution}</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>大小:</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>${sessionScope.materialThree.size}</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>时长:</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>${sessionScope.materialThree.duration}秒</label>
		</div>

	</div>
</body>
<script type="text/javascript">

	function getMedia() {
		var materialExist = '${sessionScope.materialExist}';
		if (materialExist == "false") { //视频不存在的话
			$("#tipMsg").show();
			$("#div2").hide();
			return;
		}
		
		var myDate = new Date();
		var year = myDate.getFullYear();
		var origanname = window.opener.document.getElementById("videoView").value;
		var filename = origanname.substr(0, origanname.lastIndexOf(".") + 1) + 'mp4';
		var video = document.getElementById("video1");
		play();

		var myPlayer = videojs('video1');
		videojs("video1").ready(function(){
			var myPlayer = this;
			myPlayer.play();
		});
	}
	
	function play() {
		var video = document.getElementById("video1");
		video.src = '<%=request.getContextPath()%>/downloadController/showVedio.do?filename=' + filename;
	}
	

</script>
</html>