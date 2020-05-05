<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

			
<!DOCTYPE html >
<html>
<header class="clearfix" id="header-sec">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="top-line">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-9 topbar-left">
					<ul class="info-list">
					
					</ul>
				</div>
				<div class="col-md-4 col-sm-3 topbar-right">
					
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-toggle collapsed mmenu-btn" href="#mmenu"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
			<a class="navbar-brand" href="index.do"> <img src="skin/images/logo.png" alt="" class="logo"  width="320px;"/> <img src="skin/images/logo.png" alt="" class="logo-m" /> </a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right" id="navigation">
				<li class="Lev1">
					<a href="index.do" class='menu1 active'>首页 </a>
				</li>
				<li class="Lev1">
					<a href="news.do" class="menu1 ">新闻</a>
				</li>
				<li class="Lev1">
					<a href="#" class="menu1 ">出租户型
						<i class="fa fa-caret-down"></i></a>
					<ul class="drop-down sub-menu2">
						<c:forEach items="${tlist }" var="t">
						<li class="Lev2">
							<a href="showGoodsType.do?fid=${t.id }" class="menu2">${t.name }</a>
						</li>
						</c:forEach>
					</ul>
				</li>
				<li class="Lev1">
					<a href="#" class="menu1 ">求租户型
						<i class="fa fa-caret-down"></i></a>
					<ul class="drop-down sub-menu2">
						<c:forEach items="${tlist }" var="t">
						<li class="Lev2">
							<a href="showGoodsType_qz.do?fid=${t.id }" class="menu2">${t.name }</a>
						</li>
						</c:forEach>
					</ul>
				</li>
				<li class="Lev1">
					<a href="showGoodsList.do" class="menu1 ">出租房屋</a>
				</li>
				<li class="Lev1">
					<a href="showGoodsList_cs.do" class="menu1 ">求租房屋</a>
				</li>
				<li class="Lev1">
					<a href="showGoodsList_cs.do" class="menu1 ">出售房屋</a>
				</li>
				<li class="Lev1">
					<a href="bbsList.do" class="menu1 ">在线留言
					</a>
				</li>
				<li class="Lev1">
					<a href="admin/" class="menu1 " target="_blank;">后台管理
					</a>
				</li>
				<c:if test="${sessionScope.user==null }">
				<li class="Lev1">
					<a href="login.do" class="menu1 ">登录
					</a>
				</li>
				<li class="Lev1">
					<a href="regist.jsp" class="menu1 ">注册
					</a>
				</li>
				</c:if>
					<c:if test="${sessionScope.user!=null }">
				<li><img alt="" src="upload/${sessionScope.user.img }" width="50" height="50"></li>
				<li class="Lev1">
					
					<a href="showInfo.do" class="menu1 " style="color:#ff0;">${sessionScope.user.uname }
					<i class="fa fa-caret-down"></i></a>
					<ul class="drop-down sub-menu2">
						<li class="Lev2">
							<a href="showInfo.do" class="menu2">我的信息</a>
						</li>
						<li class="Lev2">
							<a href="myGoodsList.do" class="menu2">我的出租</a>
						</li>
						<li class="Lev2">
							<a href="myGoodsList_qz.do" class="menu2">我的求租</a>
						</li>
						<li class="Lev2">
							<a href="myGoodsList_cs.do" class="menu2">我的出售</a>
						</li>
						<li class="Lev2">
							<a href="myKeepList.do" class="menu2">我的收藏夹</a>
						</li>
					</ul>
				</li>
				
				<li class="Lev1"><!-- contact.html -->
					<a href="loginout.do" class="menu1 ">注销
					</a>
				</li>
				</c:if>
				
			</ul>
		</div>
	</div>
</nav>
</header>
			
