<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html class=" js csstransforms3d">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>公共侧边栏</title>
<link rel="stylesheet" type="text/css" href="static/css/base.css">
<link rel="stylesheet" type="text/css" href="static/css/page.css">
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/json2.js"></script>
<script type="text/javascript" src="static/js/main.js"></script>
<script type="text/javascript" src="static/js/modernizr.js"></script>
<script type="text/javascript" src="static/js/left.js"></script>
<script type="text/javascript" src="static/js/main_min.js"></script>
</head>
<body> 
	<!--side S-->
	<div class="super-side-menu">
		<div class="logo"><a href="javascript:void(0)" target="_parent">
		<img class="logimg" src="static/images/logo_yijia.png"></a></div>
		<div class="side-menu">
		<ul>
			<li><a href="index?page=1&token=${token }" ><i class="ico-1"></i>公告管理</a></li>
			<li><a href="index?page=2&token=${token }" ><i class="ico-2"></i>业主管理</a></li>
			<li><a href="index?page=3&token=${token }" ><i class="ico-3"></i>缴费管理</a></li>
			<li><a href="index?page=4&token=${token }" ><i class="ico-4"></i>开门记录</a></li>
			<li><a href="index?page=5&token=${token }" ><i class="ico-5"></i>便民信息</a></li>
			<li><a href="index?page=6&token=${token }" ><i class="ico-6"></i>居家维修</a></li>
			<li><a href="index?page=7&token=${token }" ><i class="ico-8"></i>投诉管理</a></li>
			<c:if test="${type!=3}">
				<li><a href="index?page=8&token=${token }" ><i class="ico-9"></i>物业公司</a></li>
			</c:if> 
			</ul>
		</div>
	</div>
</body>
</html>