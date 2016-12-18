<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>yzg-blog 日记</title>

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
			<div class="row">
				<div class="col-md-8 col-md-push-2" id="details-title">
					<h1 class="text-success">${articleMap["center"].name }</h1>
					<p class="text-muted">文章发布时间：${articleMap["center"].time }</p>
					<p class="text-info">发布人：${articleMap["center"].user.ud.name }</p>
					<p class="pull-left text-danger">阅读：${articleMap["center"].look_times }</p>
					<p class="pull-left text-danger" id="respon">评论：${articleMap["center"].response }</p>
					<hr class="divid" />
				</div>
				<div class="hidden" id="from_user_id">${sessionScope.user.id }</div>
				<div class="hidden" id="article_id">${articleMap["center"].id }</div>
			</div>
		</div>
		<div class="container">
		  	 <div class="row">
				<div class="col-md-8 col-md-push-2">
					<div class="details-context">
						${articleMap["center"].context }
					</div>
					<c:out value=""></c:out>
					<c:if test="${articleMap['prev']!=null }">
						<p class="pull-left">上一篇：<a href="article/getDetails?id=${articleMap['prev'].id }">${articleMap["prev"].name }</a></p>
					</c:if>
					<c:if test="${articleMap['next']!=null }">
						<p class="pull-right">下一篇：<a href="article/getDetails?id=${articleMap['next'].id }">${articleMap["next"].name }</a></p>
					</c:if>
						
					<form class="details-form">
						<div class="form-group">
							<textarea class="form-control textar" rows="4" placeholder="请输入你的评论(少于300字)..." id="txt"></textarea>
						</div>
						<button type="button" class="btn btn-default pull-right" id="send-txt"><span class="glyphicon glyphicon-send"></span> 发送</button>
						<br />
						<hr class="divid" />
					</form>
					<ul class="media-list" id="details-media-list">
						<c:forEach items="${responseList }" var="response" begin="0" end="10">
							<li class="media">
								<a class="pull-left" href="#">
									<img class="media-object img-circle" src="<c:url value='/${response.fromUser.ud.image }' />" alt="..."/>
								</a>
								
								<div class="media-body">
									<div class="media-heading" id="details-name">
										<div class="hidden" id="to_user_id">${response.fromUser.id }</div>
										<span class="text-left"><a href="#" id="u_name">${response.fromUser.ud.name }</a></span>
										<!-- <span class="pull-right"><a id="to_user_response">回复</a></span> -->
									</div>
									<p><span class="glyphicon glyphicon-time">${response.time }</p>
									<p>${response.context }</p>
									
								</div>
							</li>
						</c:forEach>
					</ul>
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
		
		<c:if test="${fn:length(responseList)!=0 }">
			<button type="button" class="btn btn-info btn-block my-button">点击加载更多。。。</button>
		</c:if>
		
		<jsp:include page="../jsp/footer.jsp"></jsp:include>
	<script src="<c:url value='/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/js/bootstrap.min.js' />"></script>
    <script type="text/javascript">
   
    	//获得年月日      得到日期oTime  
        function getMyDate(str){  
            var oDate = new Date(str),  
            oYear = oDate.getFullYear(),  
            oMonth = oDate.getMonth()+1,  
            oDay = oDate.getDate(),  
            oHour = oDate.getHours(),  
            oMin = oDate.getMinutes(),  
            oSen = oDate.getSeconds(),  
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
            return oTime;  
        };  
        //补0操作  
        function getzf(num){  
            if(parseInt(num) < 10){  
                num = '0'+num;  
            }  
            return num;  
        } 
   		 var len=4;
    	$("#send-txt").on("click",function(){
    		//点击的时候保存留言信息
    		var value=$("#txt").val();
    		var from_userId=$("#from_user_id").html();
    		var articleId=$("#article_id").html();
    		if(from_userId==""){
    			$("#my-modal-context").html("请先登录,在评论！");
        		$("#my-modal-context").addClass("text-danger");
        		$("#my-modal").modal('show');
    		}else{
    			$.ajax({
	    			data:{
	    				"value":value,
	    				"from_userId":from_userId,
	    				"articleId":articleId
	    			},
	    			type:"POST",
	    			dataType:"json",
	    			url:"response/responseToArticle",
	    			error:function(data){
	    				alert("错误--"+data);
	    			},
	    			success:function(data){
	    				$(".my-button").html("点击加载更多。。。");
		    			$(".my-button").attr("disabled",false);
		    			$("#txt").val("");
	    				var list=data;
	    				$("#respon").html("评论： "+list["article"].response);
	    				//如果list为空说明回复失败，不重新加载回复内容，否则重新加载
	    				var htm="";
	    					if(len>list["response"].length){
	    						len=list["response"].length;
	    					}
	    					for(var i=0;i<len;i++){
	    						htm+="<li class='media'>"+
									"<a class='pull-left' href='#'>"+
										"<img class='media-object img-circle' src='<c:url value='/"+list["user"][0].image+"' />'/>"+
									"</a>"+
									"<div class='media-body'>"+
										"<div class='media-heading' id='details-name'>"+
											"<div class='hidden' id='to_user_id'>"+list["user"][0].id+"</div>"+
											"<span class='text-left'><a href='#'>"+list["user"][0].name+"</a></span>"+
										"</div>"+
										"<p><span class='glyphicon glyphicon-time'>"+getMyDate(list["response"][i].time)+"</p>"+
										"<p>"+list["response"][i].context+"</p>"+
									"</div>"+
								"</li>";
	    					}
	    				$("#details-media-list").html(htm);
	    			}
	    		});
    		}
    	});
    	
    	
    	//点击加载更多
    	$(".my-button").on("click",function(){
    		len+=4;
    		//点击的时候保存留言信息
    		var from_userId=$("#from_user_id").html();
    		var articleId=$("#article_id").html();
    		//userid为空的时候没有处理
    		if(from_userId==""){
    			$("#my-modal-context").html("请先登录,在加载！");
        		$("#my-modal-context").addClass("text-danger");
        		$("#my-modal").modal('show');
    		}else{
	    		$.ajax({
	    			data:{
	    				"value":0,
	    				"from_userId":from_userId,
	    				"articleId":articleId
	    			},
	    			type:"POST",
	    			dataType:"json",
	    			url:"response/responseToArticle",
	    			error:function(data){
	    				alert("出错了！！:"+data.msg);
	    			},
	    			success:function(data){
		    				var list=data;
		   					var htm="";
		   					if(len>list["response"].length){
	    						len=list["response"].length;
	    						$(".my-button").html("已经全部加载了！！！！！");
		    					$(".my-button").attr("disabled",true);
		    				}else{
		    					$(".my-button").html("点击加载更多。。。");
		    					$(".my-button").attr("disabled",false);
		    				}
	    					for(var i=0;i<len;i++){
	    						htm+="<li class='media'>"+
									"<a class='pull-left' href='#'>"+
										"<img class='media-object img-circle' src='<c:url value='/"+list["user"][0].image+"' />'/>"+
									"</a>"+
									"<div class='media-body'>"+
										"<div class='media-heading' id='details-name'>"+
											"<div class='hidden' id='to_user_id'>"+list["user"][0].id+"</div>"+
											"<span class='text-left'><a href='#'>"+list["user"][0].name+"</a></span>"+
										"</div>"+
										"<p><span class='glyphicon glyphicon-time'>"+getMyDate(list["response"][i].time)+"</p>"+
										"<p>"+list["response"][i].context+"</p>"+
									"</div>"+
								"</li>";
	    					}
	   						$("#details-media-list").html(htm);
	    			}
	    		});
    		}
    	});
    </script>
	</body>
</html>

