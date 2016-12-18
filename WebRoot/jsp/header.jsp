<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 	<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/css/mystyle.css' />" />
<!--导航条start-->
<nav class="navbar navbar-default  navbar-fixed-top my-navbar">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-nav"  aria-expanded="false">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=basePath %>user?method=index">YZG--BLOG</a>
				</div>
				<div class="collapse navbar-collapse my-collapse-style" id="navbar-nav">
					<ul class="nav navbar-nav">
						<li class="first"><a href="<%=basePath %>user?method=index">首页</a></li>
						<li><a href="<%=basePath %>jsp/introduce.jsp">简介</a></li>
						<li><a href="<%=basePath %>article/findType">日记</a></li>
						<!--<li><a href="#">留言板</a></li>-->
					</ul>
				<c:choose>
					<c:when test="${applicationScope.msg!=null}">
					<div class="dropdown  navbar-right">
						<a  href="#"  class="dropdown-toggle" data-toggle="dropdown" id="user-image">
							<img src="<c:url value='/${applicationScope.msg.image }' />" class="main-image img-circle ">
						</a>
						 <ul class="dropdown-menu pull-right" id="mymenu">
		                    <li>
		                        <a href="<%=basePath %>jsp/login.jsp" id="tab">用户切换</a>
		                    </li>
		                    <li>
		                        <a href="#" id="exit">用户注销</a>
		                    </li>
		                    <li>
		                        <a href="#" id="info">用户基本信息</a>
		                    </li>
		                  </ul>
					</div>
					</c:when>
					<c:when test="${applicationScope.msg==null}">
						<a type="button" class="btn btn-default navbar-btn navbar-right my-btn" href="<%=basePath %>jsp/reg.jsp">注册</a>
						<a type="button" class="btn btn-default navbar-btn navbar-right my-btn" href="<%=basePath %>jsp/login.jsp">登录</a>
					</c:when>
				</c:choose>								
					<!-- <form class="navbar-form navbar-right">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="站内信息搜索" />
						</div>
						<button type="submit" class="btn btn-default  my-form">搜索</button>
					</form>
					 -->
				</div>
			</div>
		</nav>
<!--导航条end-->
		
	
		
		 <script src="<c:url value='/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.min.js' />"></script>
    <script type="text/javascript">
    	$("#user-image").on("mouseover mouseout",function(event){
    		if(event.type=="mouseover"){
    			$("#mymenu").show();
    		}else if(event.type=="mouseout"){
    			//$("#mymenu").hide();
    			$("#mymenu").show();
    		}
    	});
    	$("#mymenu").on("mouseover mouseout",function(event){
    		if(event.type=="mouseover"){
    			$("#mymenu").show();
    		}else if(event.type=="mouseout"){
    			$("#mymenu").hide();
    		}
    	});
    	//点击注销则清楚application中的用户记录
    	$("#exit").on("click",function(){
    		location.href="<%=basePath %>user?method=index";
    	});
	</script>
