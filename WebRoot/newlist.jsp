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
		<title>新闻动态_我的网站</title>
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
						<div class="col-md-3 col-sm-4 bcid-cat">新闻动态</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>新闻动态</a> > </span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<article class="blog-wrap">
							
							<c:forEach items="${list }" var="n">
								<div class="blog-article hentry format-image">
									<figure>
										<a class="swipebox-x" href="showNew.do?id=${n.ggid }"> <img class="img-responsive" alt="${n.name }" src="./upload/${n.ggpic }" /> </a>
									</figure>
									<div class="entry-summary post-summary">
										<header class="entry-header">
											<h2 class="entry-title post-title"> <a href="showNew.do?id=${n.ggid }" title="${n.name }">${n.name }</a> </h2>
										</header>
										<div class="entry-meta post-meta">
											<ul>
												<li class="entry-date date">
													<time class="entry-date" datetime="${n.pubtime.substring(0,10) }">${n.pubtime.substring(0,10) }</time>
												</li>
												<li class="tags">
													<a href="javascript:;">新闻动态</a>
												</li>
												<li class="byline author vcard">by
													<a href="showNew.do?id=${n.ggid }" class="fn">admin</a>
												</li>
											</ul>
										</div>
										<div class="entry-content">
											<%-- <p>${n.note.substring(0,20) }...</p> --%>
										</div>
										<a href="showNew.do?id=${n.ggid }" class="read-more-link">查看详细</a>
									</div>
								</div>
								</c:forEach>
								
							</article>
							<div class="pagination-wrap">
								<div id="pages">
									<div class="page">
									<c:if test="${sessionScope.p==1 }">
									 <c:if test="${page.page>1}">
							             <a href="news.do?page=1" >首页</a>
							             <a href="news.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="news.do?page=${page.page+1 }">下一页</a>
										 <a href="news.do?page=${page.totalPage }">末页</a>
									    </c:if> 
									</c:if>
									<c:if test="${sessionScope.p==2 }">
									 <c:if test="${page.page>1}">
							             <a href="searchNews.do?page=1" >首页</a>
							             <a href="searchNews.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="searchNews.do?page=${page.page+1 }">下一页</a>
										 <a href="searchNews.do?page=${page.totalPage }">末页</a>
									    </c:if> 
									</c:if>
									</div>
								</div>
							</div>
						</div>
						<aside class="sidebar col-md-3 inner-right" role="complementary">
							<section class="widget side-search">
								<h3 class="title">站内搜索</h3>
								<form class="searchform" id="searchform" name="formsearch" method="post" action="searchNews.do">
									<input type="hidden" name="kwtype" value="0" />
									<div class="sform-div">
										<input type="text"  name="name" placeholder="输入新闻动态名称" id="s" />
										<input type="submit" id="searchsubmit" value="" />
									</div>
								</form>
							</section>
							
						</aside>
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
			
			<jsp:include page="foot.jsp"></jsp:include>
			
		</div>
		 <jsp:include page="foot2.jsp"></jsp:include>