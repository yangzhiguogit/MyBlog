<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>yzg-blog 首页</title>

	
    <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/css/mystyle.css' />" />
	 
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.js"></script>
    <![endif]-->
  </head>
	<body>
		
		<jsp:include page="../jsp/header.jsp"></jsp:include>
		
		<!--轮播广告start-->
		<!--data-pause="hover"鼠标停在图片上时暂停播放，放开就开始播放。data-wrap="true"是否循环播放  data-interval="1000"多少毫秒循环一次-->
		<div class="container">
		<div class="carousel slide" data-ride="carousel" id="my-carousel" data-pause="hover" data-wrap="true">
			<ul class="carousel-indicators">
				<li class="active" data-target="#my-carousel" data-slide-to="0"></li>
				<li data-target="#my-carousel" data-slide-to="1"></li>
				<li data-target="#my-carousel" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<div class="item active">
					<img src="<c:url value='/img/carousel_1.jpg' />" alt="This is my first"/>
					<!--轮播图片说明-->
					<div class="carousel-caption">
						<!--  <h3>This is my first project</h3>
						<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
						-->
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/img/carousel_2.jpg' />" alt="This is my second"/>
					<!--轮播图片说明-->
					<div class="carousel-caption">
						<!--<h3>This is my second project</h3>
						<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
						-->
					</div>
				</div>
				<div class="item">
					<img src="<c:url value='/img/carousel_3.jpg' />" alt="This is my three"/>
					<!--轮播图片说明-->
					<div class="carousel-caption">
						<!--<h3>This is my three project</h3>
						<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
						-->
					</div>
				</div>
			</div>
			<a class="carousel-control left" href="#my-carousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="carousel-control right" href="#my-carousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		</div>
		<!--轮播广告end-->
		<!--三栏简介布局start-->
		<div class="container" id="my-row">
			<div class="row">
				<div class="col-md-4">
					<a href="<c:url value='/article/getDetails?id=${articleList[0].id }' />"><img src="<c:url value='/${articleList[0].image }' />" alt="This is my first" class="img-thumbnail"/></a>
					<h3><a href="<c:url value='/article/getDetails?id=${articleList[0].id }' />">${articleList[0].name }</a></h3>
					<p>${articleList[0].description }</p>
				</div>
				<div class="col-md-4">
					<a href="<c:url value='/article/getDetails?id=${articleList[1].id }' />"><img src="<c:url value='/${articleList[1].image }' />" alt="This is my first" class="img-thumbnail"/></a>
					<h3><a href="<c:url value='/article/getDetails?id=${articleList[1].id }' />">${articleList[1].name }</a></h3>
					<p>${articleList[1].description }</p>
				</div>
				<div class="col-md-4">
					<a href="<c:url value='/article/getDetails?id=${articleList[2].id }' />"><img src="<c:url value='/${articleList[2].image }' />" alt="This is my first" class="img-thumbnail"/></a>
					<h3><a href="<c:url value='/article/getDetails?id=${articleList[2].id }' />">${articleList[2].name }</a></h3>
					<p>${articleList[2].description }</p>
				</div>
			</div>
			<hr class="divid" />
		</div>
		<!--三栏简介布局end-->
		<!--标签页start-->
		<div class="container">
		<ul class="nav nav-tabs"  id="page-tab">
			<li class="active"><a href="#0" data-toggle="tab">${articleList[0].name }</a></li>
			<li><a href="#1" data-toggle="tab">${articleList[1].name }</a></li>
			<li><a href="#2" data-toggle="tab">${articleList[2].name }</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="0">
				<div class="row" id="my-tabs">
					<div class="col-md-5">
						<a href="<c:url value='/article/getDetails?id=${articleList[0].id }' />"><img src="<c:url value='/${articleList[0].image }' />" alt="This is my first"  class="img-rounded"/></a>
					</div>
					<div class="col-md-7">
						<div class="tab-head"><a href="<c:url value='/article/getDetails?id=${articleList[0].id }' />">${articleList[0].name }<span class="text-muted">--</span></a></div>
						<p class="tab-cont">${articleList[0].description }</p>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="1">
				<div class="row" id="my-tabs">	
					<div class="col-md-7">
						<div class="tab-head"><a href="<c:url value='/article/getDetails?id=${articleList[1].id }' />">${articleList[1].name }<span class="text-muted">--</span></a></div>
						<p class="tab-cont">${articleList[1].description }</p>
					</div>
					<div class="col-md-5">
						<a href="<c:url value='/article/getDetails?id=${articleList[1].id }' />"><img src="<c:url value='/${articleList[1].image }' />" alt="This is my first"  class="img-rounded"/></a>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="2">
				<div class="row" id="my-tabs">
					<div class="col-md-8">
						<div class="tab-head"><a href="<c:url value='/article/getDetails?id=${articleList[2].id }' />">${articleList[2].name }<span class="text-muted">--</span></a></div>
						<p class="tab-cont">${articleList[2].description }</p>
					</div>
					<div class="col-md-4">
						<a href="<c:url value='/article/getDetails?id=${articleList[2].id }' />"><img src="<c:url value='/${articleList[2].image }' />" alt="This is my first"  class="img-rounded"/></a>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<!--标签页end-->
		<jsp:include page="../jsp/footer.jsp"></jsp:include>
		
	 <script src="<c:url value='/js/jquery-1.11.1.min.js' />"></script>
     <script src="<c:url value='/js/bootstrap.min.js' />"></script>
     
	</body>
</html>

