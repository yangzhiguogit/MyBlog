<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>yzg-blog 简介</title>

    <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/css/mystyle.css' />" />
	 
	
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.js"></script>
    <![endif]-->
  </head>
	<body>
		<jsp:include page="../jsp/header.jsp"></jsp:include>
		<div class="container" >
			<div id="introduce-nav">
				<p class="text-primary pull-left">关于我</p>
				<p class="text-primary pull-right">就像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。</p>
			</div>
			<hr class="divid" />
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="author-img">
						<img src="<c:url value='/img/author-img.jpg' />" alt="个人头像"/>
					</div>
					<p class="text-left text-success">姓名：阳志国</p>
					<p class="text-left text-info">爱好：音乐,篮球....</p>
					<p class="text-left text-danger">职业：程序员</p>
					<p class="text-left text-primary">地址：湖南省郴州市安仁县</p>
				</div>
				<div class="col-md-9">
					<h3 class="text-success">Just about me</h3>
		    		<div>
		    			<p>阳志国，男，90后，一个从美好的校园刚刚放出来的小白。从无忧无虑的大学生活直接跳跃到必须什么事都要去学习的社会生活，这一切都来的太突然，太不之所措。对于社会这个大学以前都是在网络上和别人的口中了解到，觉得和大学生活也才不多，但是当走进社会的时候才发现并不是那样。</p>
		    			<p>社会大学给我上的第一堂课就是求职，对于大学生来说是可以直接在学校通过校招来进入公司的。当然我也是其中的幸运者，怀着无比激动的心情踏入自己的第一份工作，想着可以在公司大展自己的才能，当是并没有，验证了一句老话，<code>不是你想要什么就有什么</code>。由于在公司并没有做和自己职业发展方向一样的职位，就第一次辞掉了自己的第一份工作
		    			当然后来我也意识到了这句话，并不是所有事都如你所愿</p>
		    			<p>人生就是一个得与失的过程，得到的永远比失去的多。我相信自己一定会成功！</p>
		    		</div>
		    		<h3 class="text-success">About my blog</h3>
		    		<p class="text-muted">域 名：www.yangqq.com 创建于2011年01月12日 </p>
		    		<p class="text-muted">服务器：阿里云服务器</p>
		    		<p class="text-muted">程 序：JSP ssh</p>
				</div>
			</div>
		</div>
		
		<!--底部start-->
		<jsp:include page="../jsp/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.min.js' />"></script>
	</body>
</html>
