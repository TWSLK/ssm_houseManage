<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>忘记密码_我的网站</title>
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
		<script type="text/javascript" src="skin/js/login.js"></script>
	</head>

	<body>
		<div id="container">
		
			<jsp:include page="top.jsp"></jsp:include>

			<div class="breadcrumb-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 bcid-cat">忘记密码</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>忘记密码</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								
								<div id="contact-wrap">
									<h3 class="msg-title">忘记密码</h3>
									<form class="add-msg-form" action="login.do"  method="post"><!-- enctype="multipart/form-data" -->
										
										<div class="row">
											
											<div class="cf-column col-md-12">
											<label>用户名：</label>
											<input name="uname" id="uname_loss" type="text" placeholder="请输入用户名" onblur="checkLossPwd();"/>
											<span id="checkUname"></span>
											</div>
											<div class="cf-column col-md-12" id="showMbanswer" style="display: none">
											<label>密保问题：</label>
											<input  id="mbanswer_loss" type="text"  readonly="readonly"/>
											</div>
											<div class="cf-column col-md-12" id="showQuestion" style="display: none">
											<label>密保答案：</label>
											<input name="question" id="miBaoQuestion" type="text" placeholder="请输入密保答案" onblur="checkMiBao();"/>
											<span id="checkMbquestion"></span>
											</div>
											<div class="cf-column col-md-12 submit-column">
												<a href="login.jsp" class="submit-button">返回登录页面</a>
											</div>
										</div>
									</form>
									<script type="text/javascript" src="skin/js/jquery.form.js"></script>
									<script type="text/javascript" src="skin/js/jquery.artdialog.js"></script>
									<script type="text/javascript" src="skin/js/iframetools.js"></script>
								</div>
							</div>
						</div>
						<aside class="sidebar col-md-3 inner-right" role="complementary">
						</aside>
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
			 <jsp:include page="foot.jsp"></jsp:include>
		</div>
		 <jsp:include page="foot2.jsp"></jsp:include>