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
		<title>在线留言_我的网站</title>
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
						<div class="col-md-3 col-sm-4 bcid-cat">在线留言</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>在线留言</a> > </span></div>
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
										<a class="swipebox-x" href="showBbs.do?id=${n.id }">
										<c:forEach items="${ulist }" var="u">
										<c:if test="${u.uid==n.uid }">
										 <img class="img-responsive" alt="${u.tname }" src="./upload/${u.img }" />
										</c:if>
										</c:forEach>
										 </a>
									</figure>
									<div class="entry-summary post-summary">
										<header class="entry-header">
											<h2 class="entry-title post-title"> <a href="showBbs.do?id=${n.id }" title="${n.name }">${n.name }</a> </h2>
										</header>
										<div class="entry-meta post-meta">
											<ul>
												<li class="entry-date date">
													<time class="entry-date" datetime="${n.pubtime.substring(0,10) }">${n.pubtime.substring(0,10) }</time>
												</li>
												<li class="tags">
													<a href="javascript:;">在线留言</a>
												</li>
												<li class="byline author vcard">by
													<a href="showBbs.do?id=${n.id }" class="fn"><c:forEach items="${ulist }" var="u">
										<c:if test="${u.uid==n.uid }">
										 ${u.tname }
										</c:if>
										</c:forEach></a>
												</li>
											</ul>
										</div>
										<div class="entry-content">
											<%-- <p>${n.note.substring(0,20) }...</p> --%>
										</div>
										<a href="showBbs.do?id=${n.id }" class="read-more-link">查看详细</a>
										<c:if test="${sessionScope.user!=null }">
										
										</c:if>
										
									</div>
								</div>
								</c:forEach>
								
							</article>
							<div class="pagination-wrap">
								<div id="pages">
									<div class="page">
									<c:if test="${sessionScope.user!=null }">
									<a href="bbs_add.jsp" class="read-more-link">发布留言</a></c:if>
									<c:if test="${sessionScope.user==null }">请登录后操作!
									<a href="login.jsp" class="read-more-link">登录</a></c:if>
									<c:if test="${sessionScope.p==1 }">
									 <c:if test="${page.page>1}">
							             <a href="bbsList.do?page=1" >首页</a>
							             <a href="bbsList.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="bbsList.do?page=${page.page+1 }">下一页</a>
										 <a href="bbsList.do?page=${page.totalPage }">末页</a>
									    </c:if> 
									</c:if>
									<c:if test="${sessionScope.p==2 }">
									 <c:if test="${page.page>1}">
							             <a href="searchbbsList.do?page=1" >首页</a>
							             <a href="searchbbsList.do?page=${page.page-1 }"> 上一页</a> 
							             </c:if>
							    	     <c:if test="${page.page<page.totalPage}">
									     <a href="searchbbsList.do?page=${page.page+1 }">下一页</a>
										 <a href="searchbbsList.do?page=${page.totalPage }">末页</a>
									    </c:if> 
									</c:if>
									</div>
								</div>
							</div>
						</div>
						<!-- <aside class="sidebar col-md-3 inner-right" role="complementary">
							<section class="widget side-search">
								<h3 class="title">站内搜索</h3>
								<form class="searchform" id="searchform" name="formsearch" method="post" action="searchbbsList.do">
									<input type="hidden" name="kwtype" value="0" />
									<div class="sform-div">
										<input type="text"  name="name" placeholder="输入在线留言名称" id="s" />
										<input type="submit" id="searchsubmit" value="" />
									</div>
								</form>
							</section>
							
						</aside> -->
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
			
			<jsp:include page="foot.jsp"></jsp:include>
			
		</div>
		 <jsp:include page="foot2.jsp"></jsp:include>