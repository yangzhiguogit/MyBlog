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
			<div id="introduce-nav">
				<p class="text-primary pull-left">日记</p>
				<p class="text-primary pull-right">记录生活,记录脚印,不断积累,茁壮成长</p>
			</div>
			<hr class="divid" />
		</div>
		<div class="container">
		    <div class="row">
		    	<div class="col-md-2" id="bor">
		    		<h3>日记分类</h3>
		    		<ul class="nav nav-tabs nav-stacked">
		    			<c:forEach items="${bigList }" var="bigType">
		    				<li class="dropdown">
			    				<a href="#" data-toggle="dropdown"  class="dropdown-toggle" id="cao">${bigType.name }<span class="caret"></span></a>
			    				<ul class="dropdown-menu">
			    						<c:forEach items="${smallMap }" var="m">
			    							<c:if test="${m.key==bigType.name }">
			    								<c:if test="${fn:length(m.value)>0 }">
				    								<c:forEach items="${m.value }" var="l">
				    									<li><a id="small">${l.name }</a></li>
				    								</c:forEach>
				    							</c:if>
			    							</c:if>
			    						</c:forEach>
			    				</ul>
		    				</li>
		    			</c:forEach>
		    		</ul>
		    	</div>
		    	<div class="col-md-10">
		    		<ul class="media-list" id="recorde-media-list">
		    			<c:forEach items="${articleList }" var="article" varStatus="statu" begin="0" end="3">
		    				<li class="media">
			    				<a class="pull-left" href="article/getDetails?id=${article.id }">
			    					<img class="media-object" src="<c:url value='/${article.image }' />" alt="..."/>
			    				</a>
			    				<div class="media-body" id="my-media-body">
			    					<h4 class="media-heading"><a href="article/getDetails?id=${article.id }">${article.name }</a></h4>
			    					<p>${article.description }</p>
			    					<p class="pull-left bott"><span class="glyphicon glyphicon-time"></span>${article.time }</p>
			    					<p class="pull-left bott"><span class="glyphicon glyphicon-user"></span>${article.user.ud.name }</p>
			    					<p class="pull-left bott"><span class="glyphicon glyphicon-eye-open"></span>${article.look_times }</p>
			    					<p class="pull-left bott"><span class="glyphicon glyphicon-comment"></span>${article.response }</p>
			    				</div>
			    			</li>
		    			</c:forEach>
		    		</ul>
		    	</div>
		    </div>
		</div>
		
		<c:if test="${fn:length(articleList)!=0 }">
			<button type="button" class="btn btn-info btn-block my-button">点击加载更多。。。</button>
		</c:if>
		<!--底部start-->
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
        var value=null;
        var len=4;
    	$(function(){
    		$("#cao").click(function(){
    			$(".dropdown-toggle").dropdown('toggle');
    		});
    		//给相同id的标签绑定相同事件
    		$("[id=small]").each(function(){
    			$(this).click(function(){
    				$(".my-button").html("点击加载更多。。。");
    				$(".my-button").attr("disabled",false);
    				value=$(this).html();
    				len=4;
	    			$.ajax({
	    				data:{
	    					"articleSmallType":value
	    				},
	    				type:"POST",
	    				dataType:"json",
	    				url:"article/recordArticle",
	    				error:function(data){
	    					alert("出错了！！:"+data.msg);  
	    				},
	    				success:function(data){
	    					var map=data;
	    					//获得json的长度
	    					//alert(articleList.length);
	    					//alert(articleList[0].name);
	    					
	    					if(len>map["articleList"].length){
	    						len=map["articleList"].length;
	    					}
	    					var htm="";
	    					if(map["articleList"].length==0){
	    						$(".my-button").addClass("hidden");
	    					}else{
	    						$(".my-button").removeClass("hidden");
	    					}
	    					for(var i=0;i<len;i++){
	    						var url="article/getDetails?id="+map["articleList"][i].id;
	    						htm+="<li class='media'>"+
				    				"<a class='pull-left' href='"+url+"'>"+
				    					"<img class='media-object' src='<c:url value='/"+map["articleList"][i].image+"' />'/>"+
				    				"</a>"+
				    				"<div class='media-body' id='my-media-body'>"+
				    					"<h4 class='media-heading'><a href='"+url+"'>"+map["articleList"][i].name+"</a></h4>"+
				    					"<p>"+map["articleList"][i].description+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-time'></span>"+getMyDate(map["articleList"][i].time)+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-user'></span>"+map["user"][i].name+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-eye-open'></span>"+map["articleList"][i].look_times+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-comment'></span>"+map["articleList"][i].response+"</p>"+
				    				"</div></li>";
	    					}
	    					$("#recorde-media-list").html(htm);
	    				}
	    			});
    			});
    		});
    	});
    	
    	//点击加载更多
    	$(".my-button").on("click",function(){
    		len+=4;
    		$.ajax({
    			data:{
    				"articleSmallType":value
    			},
    			type:"POST",
    			dataType:"json",
    			url:"article/clickMore",
    			error:function(data){
    				alert("出错了！！:"+data.msg);
    			},
    			success:function(data){
	    				var map=data;
	    				if(len>map["articleList"].length){
	    					len=map["articleList"].length;
	    					$(".my-button").html("已经全部加载了！！！！！");
	    					$(".my-button").attr("disabled",true);
	    				}else{
	    					$(".my-button").html("点击加载更多。。。");
	    					$(".my-button").attr("disabled",false);
	    				}
    					
	   					var htm="";
	   					for(var i=0;i<len;i++){
	   						var url="article/getDetails?id="+map["articleList"][i].id;
	    						htm+="<li class='media'>"+
				    				"<a class='pull-left' href='"+url+"'>"+
				    					"<img class='media-object' src='<c:url value='/"+map["articleList"][i].image+"' />'/>"+
				    				"</a>"+
				    				"<div class='media-body' id='my-media-body'>"+
				    					"<h4 class='media-heading'><a href='"+url+"'>"+map["articleList"][i].name+"</a></h4>"+
				    					"<p>"+map["articleList"][i].description+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-time'></span>"+getMyDate(map["articleList"][i].time)+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-user'></span>"+map["user"][i].name+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-eye-open'></span>"+map["articleList"][i].look_times+"</p>"+
				    					"<p class='pull-left bott'><span class='glyphicon glyphicon-comment'></span>"+map["articleList"][i].response+"</p>"+
				    				"</div></li>";
	   					}
   						$("#recorde-media-list").html(htm);	
    			}
    		});
    	});
    </script>
	</body>
</html>

