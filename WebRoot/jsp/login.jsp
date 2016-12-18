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
    <title>yzg-blog 登录</title>
	
       <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/css/mystyle.css' />" />
	 
	
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.js"></script>
    <![endif]-->
  </head>
	<body>
		<jsp:include page="../jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-push-4">
					<h3 class="text-center tit"><a href="<%=basePath %>jsp/login.jsp"><span class="text-success">登录</span></a>·<a href="<%=basePath %>jsp/reg.jsp"><span class="text-muted">注册</span></a></h3>
					<form class="login" action="user?method=login" method="post">
						<div class="form-group">
							<label for="name" class="labl">帐   号：</label>
							<input class="form-control input-lg" placeholder="请输入你的帐号" type="text" id="name" name="lg_name"/>
						</div>
						<div class="form-group">
							<label for="pwd" class="labl">密   码：</label>
							<input class="form-control input-lg" placeholder="请输入你的密码" type="password" id="pwd" name="pwd"/>
						</div>
						<span class="help-block hidden description"><span class="text-danger">自己独占一行或多行的块级帮助文本。</span></span>
						<button type="button" class="btn btn-success btn-lg btn-block" id="sub">登录</button>
					</form>
				</div>
			</div>
		</div>
		
		<!--弹出框start-->
		<div class="modal fade" id="my-modal" data-backdrop="static" >
			<div class="modal-dialog">
				<div class="modal-content">
					<!--  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" >&times;</button>
						<h3 class="modal-title">弹出框标题</h3>
					</div>
					-->
					<div class="modal-body">
						<p class="" id="my-modal-context">
							
						</p>
					</div>
					<div class="modal-footer" id="suc">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!--弹出框end-->
		<jsp:include page="../jsp/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.min.js' />"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#sub").on('click',function(){
    			var lg_name=$("#name").val();
    			var pwd=$("#pwd").val();
    			
				 $.ajax({  
			        data:{
			        "lg_name":lg_name,
			        "pwd":pwd
			        },  
			        type:"POST",  
			        dataType:'text',  
			        url:"user/login",  
			        error:function(data){  
			            $("#my-modal-context").html("登录失败,用户名或密码错误！");
		        		$("#my-modal-context").addClass("text-danger");
		        		$("#my-modal").modal('show');
			        },  
			        success:function(data, textStatus){
			        	
			        	if(data=="true"){
			        		//登录成功
			        		var times=3;
			        		$("#suc").hide();
			        		var stop=setInterval(function(){
				        		if(times==1){
				        			clearInterval(stop);
				        			location.href="user/findDetails?lg_name="+lg_name+"&pwd="+pwd+"";
				        		}
			        			$("#my-modal-context").html("登录成功,"+times+"秒过后进入主页....");
			        			$("#my-modal-context").removeClass("text-danger");
			        			$("#my-modal-context").addClass("text-success");
			        			$("#my-modal").modal('show');
			        			times--;
			        		}, 1000);
			        	}else{
			        		//登录失败
			        		$("#my-modal-context").html("登录失败,用户名或密码错误！");
			        		$("#my-modal-context").addClass("text-danger");
			        		$("#my-modal").modal('show');
			        	}
			        }  
		        });  
    		});
    	});
    </script>
	</body>
</html>

