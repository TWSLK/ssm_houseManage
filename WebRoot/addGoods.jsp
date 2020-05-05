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
	<title>出租_我的网站</title>
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
<script charset="utf-8" src="/fangwuzulinsys/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/fangwuzulinsys/kindeditor/lang/zh-CN.js"></script>
<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/fangwuzulinsys/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/fangwuzulinsys/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
	<body>
		<div id="container">
		
			<jsp:include page="top.jsp"></jsp:include>

			<div class="breadcrumb-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 bcid-cat">添加出租</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>添加出租</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								
								<div id="contact-wrap">
									<h3 class="msg-title">出租添加</h3>
									<form class="add-msg-form" action="addGoods.do"   method="post"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
										
										<div class="row">
											
											<div class="cf-column col-md-12"> 
												<input name="name" type="text" placeholder="出租名称"  />
												<span id='checku' class="spanInit" ></span>
											</div>
											<div class="cf-column col-md-12">
												<select name="fid" class="cf-column col-md-12">
														<option value="">请选择出租类型</option>
													<c:forEach items="${tlist }" var="t">
														<option value="${t.id }"> ${t.name }(${t.btype })</option>
													</c:forEach>
												</select> 
											</div>
											<div class="cf-column col-md-12">
											<label>出租图片：</label>
												<input type="file" name="file"  placeholder="选择出租的图片" value="上传图片">
											</div>
											<div class="cf-column col-md-12">
											<label>面积：</label>
												<input type="text" name="area"   placeholder="请输入房屋面积" id="articletitle" name="area" >
											</div>
											<div class="cf-column col-md-12"><label>单价：</label>
													<input type="text" class="input-text"   placeholder="请输入房屋单价" id="articletitle" name="price">
											</div>
											<div class="cf-column col-md-12"><label>地址：</label>
													<input type="text" class="input-text"   placeholder="请输入房屋地址" id="articletitle" name="addr">
											</div>
											<div class="cf-column col-md-12"><label>联系人：</label>
													<input type="text" class="input-text"   placeholder="请输入" id="articletitle" name="tname">
											</div>
											<div class="cf-column col-md-12"><label>联系人电话：</label>
													<input type="text" class="input-text"   placeholder="请输入" id="articletitle" name="tel">
											</div>
		
											<div class="cf-column col-md-12">
											<label >说明：</label>
												<textarea rows="" cols="" name="note" id="editor_id"></textarea>
											</div>
											<div class="cf-column col-md-12 submit-column">
												<button type="submit" id="submit-btn" class="submit-button" >提交</button>
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