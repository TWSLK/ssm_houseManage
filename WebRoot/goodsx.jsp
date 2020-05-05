<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="renderer" content="webkit" />
		<meta name="robots" content="index, follow" />
		<title>房屋信息详情_我的网站</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="skin/css/font-awesome.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/bootstrap.min.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/owl.carousel.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/owl.theme.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/settings.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/style-red.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="skin/css/tk.css" media="screen" />
		<script type="text/javascript" src="skin/js/jquery.min.js"></script>
		<script type="text/javascript" src="skin/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="skin/js/owl.carousel.min.js"></script>
	</head>
<script type="text/javascript">
function down1(fujianPath)
{
   var url="updown.jsp?fujianPath="+fujianPath;
   url=encodeURI(url); 
   url=encodeURI(url); 
   window.open(url,"_self");
}
</script>
	<body>
		<div id="container">
		
			<jsp:include page="top.jsp"></jsp:include>

			<div class="breadcrumb-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 bcid-cat">${goods.name }</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>房屋信息</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								<div class="com-cnt page-content"><br />
									<p>
										&nbsp;</p>
									<p>户型：
									<c:forEach items="${tlist }" var="t">
									<c:if test="${t.id==goods.fid }">
									${t.name }
									</c:if>
									</c:forEach>
									</p>
									<p>面积：${goods.area }</p>
									<c:if test="${goods.btype=='出租' }">
									<p>价格：${goods.price }/月</p>
									</c:if>
									<c:if test="${goods.btype=='求租' }">
									<p>价格：${goods.price }</p>
									</c:if>
									<c:if test="${goods.btype=='出售' }">
									<p>价格：${goods.price }</p>
									</c:if>
									<p>位置：${goods.addr }</p>
									<p>联系人：${goods.tname }</p>
									<p>电话${goods.tel }</p>
									<hr>
									<img alt="" src="./upload/${goods.img }" /><br />
									<hr>房屋说明：
									${goods.note }
									<hr>
									<div id="pages" class="page"></div>
									<hr>
								</div>
								<div id="contact-wrap">
								    <c:if test="${sessionScope.user!=null }">
								    <c:if test="${sessionScope.user.uid!=goods.uid }">
								    
									<h3 class="msg-title"><a href="addKeep.do?fid=${goods.id }">收藏</a></h3>
									</c:if>
									</c:if>
									<c:if test="${sessionScope.user==null }">
									<p>请登录后操作！</p>
									<h3 class="msg-title"><a href="login.jsp">登录</a></h3>
									</c:if>
									<script type="text/javascript" src="skin/js/jquery.form.js"></script>
									<script type="text/javascript" src="skin/js/jquery.artdialog.js"></script>
									<script type="text/javascript" src="skin/js/iframetools.js"></script>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
				<jsp:include page="foot.jsp"></jsp:include>
		</div>
		 <jsp:include page="foot2.jsp"></jsp:include>