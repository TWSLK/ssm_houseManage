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
	<title>登录_我的网站</title>
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
						<div class="col-md-3 col-sm-4 bcid-cat">注册</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>注册</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								<div id="contact-wrap">
									<h3 class="msg-title">会员注册</h3>
									<form class="add-msg-form" action="reg.do" onsubmit="return check();"  method="post"  enctype="multipart/form-data"><!-- enctype="multipart/form-data" -->
										<div class="row">
											<div class="cf-column col-md-12"> 
												<input name="uname" id="username" type="text" placeholder="登录名" onblur="return checkuname()" />
												<span id='checku' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12"> 
												<input name="tname"  type="text" placeholder="真实姓名" onblur="return checkuname2()"   />
												<span id='checku2' class="spanInit" ></span>
											</div>
											
											<div class="cf-column col-md-12">
												<input name="pwd" id="txtPwd" type="password" placeholder="密码"  onblur="return checkpwd()" />
												<span id='prompt_pwd'  class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
												<input name="pwdc" id="txtConfirmPwd" type="password" placeholder="确认密码"  onblur="return checkpwdc()" />
												<span id='prompt_confirmpwd' class="spanInit"  ></span>
											</div>
											
											<div class="cf-column col-md-12">
											<label>性别：</label>
												<select name="sex">
												<option value="男">男</option>
												<option value="女">女</option>
												</select>
												<span id='' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
												<select name="utype">
												<option value="会员">会员</option>
												</select>
												<span id='' class="spanInit" ></span>
											</div>
											
											<div class="cf-column col-md-12">
												<input name="tel" id="txtPhone" type="text" placeholder="电话/手机"  id="txtPhone" onblur="return checktel()"  />
												<span id='prompt_phone' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
												<input name="weixin" id="" type="text" placeholder="请输入微信"  required="required" />
												<span id='' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
												<input name="email" id="" type="text" placeholder="请输入邮箱"  required="required" />
												<span id='' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
											<input name="file"  id="" type="file"  />
											</div>
											<div class="cf-column col-md-12">
												<input name="address" id="address" type="text" placeholder="地址" />
											</div>
											<div class="cf-column col-md-12">
												<input name="mbanswer" id="" type="text" placeholder="密保问题" required="required" />
											</div>
											<div class="cf-column col-md-12">
												<input name="question" id="" type="text" placeholder="密保答案" required="required"/>
											</div>
											<div class="cf-column col-md-12 submit-column">
												<button type="submit" id="submit-btn" class="submit-button" onclick="return checkAll()">注册</button>
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