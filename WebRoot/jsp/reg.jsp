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
    <title>yzg-blog 注册</title>

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
					<h3 class="text-center tit"><a href="<%=basePath %>jsp/login.jsp"><span class="text-muted">登录</span></a>·<a href="<%=basePath %>jsp/reg.jsp"><span class="text-success">注册</span></a></h3>
					<form class="login" action="user/reg" method="post">
						<div class="form-group">
							<label for="name" class="labl">帐      号：</label>
							<input class="form-control input-lg" placeholder="请输入要注册的帐号" type="text" id="name" name="lg_name"/>
							<span class="help-block hidden description" id="name-t"><span class="name-txt text-danger"></span></span>
						</div>
						<div class="form-group">
							<label for="pwd" class="labl">密      码：</label>
							<input class="form-control input-lg" placeholder="请输入你的密码" type="password" id="pwd" name="pwd"/>
							<span class="help-block hidden description" id="pwd-t"><span class="pwd-txt text-danger"></span></span>
						</div>
						<div class="form-group">
							<label for="pwd" class="labl">确认密码：</label>
							<input class="form-control input-lg" placeholder="请再次输入你的密码" type="password" id="rpwd" name="rpwd"/>
							<span class="help-block hidden description" id="rpwd-t"><span class="rpwd-txt text-danger"></span></span>
						</div>
						<div class="form-group">
							<label for="pwd" class="labl">手机号码：</label>
							<input class="form-control input-lg" placeholder="请输入你的手机号码" type="password" id="phone" name="phone"/>
							<span class="help-block hidden description" id="phone-t"><span class="phone-txt text-danger"></span></span>
						</div>
						<button type="button" class="btn btn-success btn-lg btn-block" id="sub">注册</button>
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
    	//提交注册的时候检测输入框是否为空
    	$("#sub").on("click",function(){
    		if($("#name").val()=="" || $("#name").val()==null){
    			$("#name-t").removeClass("hidden");
    			$(".name-txt").html("你输入用户名");
    		}else if($("#pwd").val()=="" || $("#pwd").val()==null){
	    		$("#pwd-t").removeClass("hidden");
	    		$(".pwd-txt").html("你输入密码");
	    	}else if($("#rpwd").val()=="" || $("#rpwd").val()==null){
	    		$("#rpwd-t").removeClass("hidden");
	    		$(".rpwd-txt").html("你输入验证密码");
	    	}else if($("#phone").val()=="" || $("#phone").val()==null){
	    		$("#phone-t").removeClass("hidden");
	    		$(".phone-txt").html("你输入手机号码");
	    	}else{
	    		$.ajax({
		    		data:{
		    			lg_name:$("#name").val(),
		    			pwd:$("#pwd").val(),
		    			phone:$("#phone").val()
		    		},
		    		type:"post",
		    		dataType:"text",
		    		url:"user/reg",
		    		error:function(data){
		    			alert("出错了！！:"+data.msg);  
		    		},
		    		success:function(data){
		    			if(data=="true"){
		    				var times=3;
			        		$("#suc").hide();
			        		var stop=setInterval(function(){
				        		if(times==1){
				        			clearInterval(stop);
				        			location.href="<%=basePath %>jsp/login.jsp";
				        		}
			        			$("#my-modal-context").html("用户注册成功,"+times+"秒过后进入登录界面....");
							    $("#my-modal-context").addClass("text-success");
				    			$("#my-modal").modal('show');
			        			times--;
			        		}, 2000);
		    			}else{
		    				$("#my-modal-context").html("对不起,用户注册失败");
						  	$("#my-modal-context").addClass("text-danger");
			    			$("#my-modal").modal('show');
		    			}
		    		}
		    	});
	    	}
    	});
    	//正则验证手机号码格式
    	function isPhone(phone){
			var reg=/^[0-9]{11}$/;
			if(reg.test(phone)){
				return true;
			}else{
				return false;
			} 		
    	};
    	//正则验证密码格式
    	function ispwd(pwd){
    		//密码只能是数字和大小写字母的组合，长度要大于6
    		var reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$/;
    		/*
    			分开来注释一下：
				^ 匹配一行的开头位置
				(?![0-9]+$) 预测该位置后面不全是数字
				(?![a-zA-Z]+$) 预测该位置后面不全是字母
				[0-9A-Za-z] {6,10} 由6-10位数字或这字母组成
				$ 匹配行结尾位置
    		*/
    		if(reg.test(pwd)){
				return true;
			}else{
				return false;
			} 
    	}
    	//异步检测是否有重复的用户名和手机号码
    	$("#name").on("blur",function(){
    		var name=$("#name").val();
    		if(name=="" || name==null){
    			$("#name-t").removeClass("hidden");
    			$(".name-txt").html("你输入用户名");
    		}else{
    			$("#name-t").addClass("hidden");
    			$.ajax({
	    			data:{
	    				name:name,
	    			},
	    			dataType:"text",
	    			type:"POST",  
	    			url:"user/regName", 
	    			success:function(data){
	    				if(data=="false"){
	    					$("#name-t").addClass("hidden");
	    				}else{
	    					$("#name-t").removeClass("hidden");
	    					$(".name-txt").html("帐号已被注册不可用!");
	    				}
	    			},
	    			err:function(data){
	    				 alert("出错了！！:"+data.msg);  
	    			}
	    		});
    		}
    	});
    	var pwd;
    	$("#pwd").on("blur",function(){
    		pwd=$("#pwd").val();
    		if(pwd=="" || pwd==null){
	    		$("#pwd-t").removeClass("hidden");
	    		$(".pwd-txt").html("你输入密码");
	    	}else{
	    		$("#pwd-t").addClass("hidden");
	    		if(ispwd(pwd)){
	    			$("#pwd-t").addClass("hidden");
		    	}else{
		    		$("#pwd-t").removeClass("hidden");
		    		$(".pwd-txt").html("密码格式不对,只能是数字和大小写字母的组合，且长度在6~12,请重新输入");
		    	}
	    	}
    	});
    	$("#rpwd").on("blur",function(){
    		var rpwd=$("#rpwd").val();
    		if(rpwd=="" || rpwd==null){
	    		$("#rpwd-t").removeClass("hidden");
	    		$(".rpwd-txt").html("你输入验证密码");
	    	}else{
	    		$("#rpwd-t").addClass("hidden");
	    		if(rpwd==pwd){
	    			$("#rpwd-t").addClass("hidden");
		    	}else{
		    		$("#rpwd-t").removeClass("hidden");
		    		$(".rpwd-txt").html("密码与第一次输入的密码不一样,请重新输入");
		    	}
	    	}
    	});
    	$("#phone").on("blur",function(){
    		var phone=$("#phone").val();
    		if(phone=="" || phone==null){
	    		$("#phone-t").removeClass("hidden");
	    		$(".phone-txt").html("你输入手机号码");
	    	}else{
	    		$("#phone-t").addClass("hidden");
	    		
		    	if(isPhone(phone)){
		    		$("#phone-t").addClass("hidden");
		    		$.ajax({
		    			data:{
		    				phone:phone,
		    			},
		    			dataType:"text",
		    			type:"POST",  
		    			url:"user/regPhone", 
		    			success:function(data){
		    				if(data=="false"){
		    					$("#phone-t").addClass("hidden");
		    				}else{
		    					$("#phone-t").removeClass("hidden");
		    					$(".phone-txt").html("手机号已被注册不可用!");
		    				}
		    			},
		    			err:function(data){
		    				 alert("出错了！！:"+data.msg);  
		    			}
		    		});
		    	}else{
		    		$("#phone-t").removeClass("hidden");
		    		$(".phone-txt").html("手机号格式不对,请重新输入");
		    	}
	    	}
    	});
    </script>
	</body>
</html>

