<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/css/mystyle.css' />" />

<!--底部start-->
		<footer class="navbar-fixed-bottom">
			<p class="text-center text-info">yzg-blog</p>
		</footer>
		<!--底部end-->
		
		 <script src="<c:url value='/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.min.js' />"></script>
