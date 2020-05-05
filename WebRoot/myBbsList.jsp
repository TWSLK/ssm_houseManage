<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>留言信息_我的网站</title>
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

<body>
<div id="container">
	<jsp:include page="top.jsp"></jsp:include>

<div class="breadcrumb-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-4 bcid-cat">留言信息</div>
			<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>留言信息</a> > </span></div>
		</div>
	</div>
</div>
	

<div class="page-container" id="innerpage-wrap">
	<div class="container">
		<div class="row">
			<div class="main col-md-12 inner-left" role="main">
				<div class="prolist-wrap">
					<div id="portfolio-container">
						<div class="row portfolio-3-columns isotope-x clearfix">
						
						<table class="table table-hover text-center">
						<tr>
						<td>序号</td><!-- <td>标题</td> --><td>留言人</td><td>留言内容</td><td>留言时间</td><td>回复人</td><td>回复内容</td><td>回复时间</td><td>操作</td>
						</tr>
						<c:forEach items="${list }" var="b" varStatus="num">
						<tr>
						<td>${num.count }</td>
						<%-- <td>${b.name }</td> --%>
						<td>
						<c:forEach items="${ulist}" var="u">
							<c:if test="${u.uid==b.uid }">
								${u.tname }
							</c:if>
						</c:forEach></td>
						<td>${b.note }</td>
						<td>${b.pubtime.substring(0,10) }</td>
						<td>
						<c:forEach items="${ulist}" var="u">
							<c:if test="${u.uid==b.did }">
								${u.tname }
							</c:if>
						</c:forEach></td>
						<td>${b.note2 }</td>
						<td>${b.htime.substring(0,10) }</td>
						<td>
						<c:if test="${sessionScope.user.uid==b.did }">
						<c:if test="${b.sta=='待回复' }">
						<a href="doUpdateBbs.do?id=${b.id }">回复</a>
						</c:if>
						</c:if>
						<c:if test="${sessionScope.user.uid==b.uid }">
						<c:if test="${b.sta=='已回复' }">
						<a href="doAddBbs.do?did=${b.name }">回复</a>
						</c:if>
						</c:if>
						<c:if test="${sessionScope.user.uid==b.uid }">
						<a href="deleteBbs.do?id=${b.id }">删除</a>
						</c:if>
						</td>
						</tr>
						
						</c:forEach>
						 <tr>
						 		<!-- <td><a href="addBbs.jsp">添加留言</a> </td> -->
								<td colspan="9"> <c:if test="${page.page>1}">
						              <a href="bbsList.do?page=1" >首页</a>
						             <a href="bbsList.do?page=${page.page-1 }"> 上一页</a> 
						             </c:if>
						    	     <c:if test="${page.page<page.totalPage}">
									<a href="bbsList.do?page=${page.page+1 }">下一页</a>
									<a href="bbsList.do?page=${page.totalPage }">末页</a>
								    </c:if> 
								</td>
						</tr>
						</table>
						
						
						</div>
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