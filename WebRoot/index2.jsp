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
		<title>房屋租赁系统</title>
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="order by website" />
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
		
		<section id="home-section" class="slider1">
				<div class="tp-banner-container">
					<div class="tp-banner">
						<ul>
						<c:forEach items="${list }" var="n">
							<li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="banner1"> 
							<img src="./upload/${n.ggpic }" alt="${n.name }" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat" /> 
							</li>
						</c:forEach>

						</ul>
						<div class="tp-bannertimer"></div>
					</div>
				</div>
			</section>
			<%-- <section class="services-section" id="index-cate">
				<div class="container">
					<div class="services-box">
						<div class="row">
						<c:forEach items="${tlist }" var="t">
							<div class="col-md-3 col-sm-6 col-xs-6 cate-itme">
								<div class="services-post">
									<a href="showGoodsType.do?fid=${t.id }" class="thumb-link"></a>
									<div class="services-content">
										<h2><a href="showGoodsType.do?fid=${t.id }">户型名称：${t.name }</a></h2>
										<a href="showGoodsType.do?fid=${t.id }" class="readmore">查看更多 <i class="fa fa-angle-double-right"></i></a>
									</div>
								</div>
							</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</section> --%>
			<section class="portfolio-section" id="index-portfolio">
				<div class="container">
					<h3 class="text-center section-title"><a href="javascript:;">出租房屋信息</a> </h3>
					<div class="portfolio-box owl-wrapper">
						<div class="owl-carousel" data-num="4">
						<c:forEach items="${glist }" var="sb">
							<div class="item project-post">
								<div class="project-gallery"> <img src="./upload/${sb.img }" alt="${sb.name }" width="262px" height="262px"/>
									<div class="hover-box">
										<div class="inner-hover">
											<h2><a href="showGoodsx.do?id=${sb.id }">${sb.name }</a></h2>
											<span><c:forEach items="${tlist }" var="t">
											<c:if test="${t.id==sb.fid }">
											出租房屋户型：${t.name }
											</c:if>
											</c:forEach></span>
											<span>单价：${sb.price }</span>
											 </div>
									</div>
								</div>
								<h3 class="iport-h3-title"><a href="showGoodsx.do?id=${sb.id }" title="${sb.name }">${sb.name }</a></h3>
							</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</section>
			<section class="portfolio-section" id="index-portfolio">
				<div class="container">
					<h3 class="text-center section-title"><a href="javascript:;">求租房屋信息</a> </h3>
					<div class="portfolio-box owl-wrapper">
						<div class="owl-carousel" data-num="4">
						<c:forEach items="${glist2 }" var="sb">
							<div class="item project-post">
								<div class="project-gallery"> <img src="./upload/${sb.img }" alt="${sb.name }" width="262px" height="262px"/>
									<div class="hover-box">
										<div class="inner-hover">
											<h2><a href="showGoodsx.do?id=${sb.id }">${sb.name }</a></h2>
											<span><c:forEach items="${tlist }" var="t">
											<c:if test="${t.id==sb.fid }">
											求租房屋户型：${t.name }
											</c:if>
											</c:forEach></span>
											<span>单价：${sb.price }</span>
											 </div>
									</div>
								</div>
								<h3 class="iport-h3-title"><a href="showGoodsx.do?id=${sb.id }" title="${sb.name }">${sb.name }</a></h3>
							</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</section>
			
			<section class="news-section" id="index-news">
				<div class="container">
					<h3 class="text-center section-title"><a href="javascript:;">新闻动态</a> </h3>
					<div class="news-box owl-wrapper">
						<div class="owl-carousel" data-num="4">
						<c:forEach items="${list2 }" var="n2">
							<div class="item news-post">
								<div class="news-gallery">
									<a href="showNew.do?id=${n2.ggid }" class="thumb-link">
									<img src="./upload/${n2.ggpic }" alt="${n2.name }"  width="262px" height="262px"/></a>
									<div class="date-post">
										<p>${n2.pubtime.substring(0,7) } <span>${n2.pubtime.substring(8,10) }</span></p>
									</div>
								</div>
								<div class="news-content"><!-- .substring(0,20) -->
									<h2 class="inews-title"><a href="showNew.do?id=${n2.ggid }" title="${n2.name }">${n2.name }</a></h2>
									<p class="desc"><%-- ${n2.note } --%>...</p>
									<a href="showNew.do?id=${n2.ggid }" class="news-readmore">阅读更多 <i class="fa fa-angle-right"></i></a>
								</div>
							</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
			</section>
			
			
			<jsp:include page="foot.jsp"></jsp:include>
			
			</div>
		<jsp:include page="foot2.jsp"></jsp:include>
	</body>

</html>
